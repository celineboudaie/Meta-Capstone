import os
import requests
from parse_rest.connection import register
from parse_rest.datatypes import Object

MAX_PAGES = 3

class Product(Object):
    pass

register("WAVphoQM8Ap3MNrtuljK7xbqnbEkP07RbfBad7x2", "cd8hYlnVzJmQg2FU1lEFFchpD2I7ZsQSPxEugmaO", master_key=os.environ['PARSE_API_ROOT'])

headers = {
  'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
}

categories = ['face wash', 'face moisturizer', 'sunscreen', 'eye cream', 'makeup remover', 'toner']

for category in reversed(categories):
  current_item_idx = 1
  for pageNum in range(0, MAX_PAGES):
    print(f"Looking at category {category} page {pageNum}")
    sephoraData = requests.get(f"https://www.sephora.com/api/catalog/search?type=keyword&q={category}&pageSize=-1&currentPage={pageNum}", headers=headers)
    responsejson = sephoraData.json()
    if len(responsejson["products"]) == 0:
      print("Page empty")
      break  # Stop iterating through pages
      
    for product in responsejson["products"]:
      try:
        productRequest = requests.get(f"https://www.sephora.com/api2/catalog/products/{product['productId']}", headers=headers)
        
        productjson = productRequest.json()
        query = Product.Query.filter(ID=product['productId'])
    
        # Check if we already have it in the DB
        if len(query) > 0:
          p = query[0]
        else:
          product = Product()
        product.ID = product['productId']
        product.Category = category
        product.Name = product['productName']
        product.Brand = product['brandName']
        ingredients = productjson['currentSku']['ingredientDesc']
        ingredients.replace("<br>", "")
        ingredients.replace("<b>", "")
        ingredients.replace("</b>", "")
        ingredients.replace("<p>", "")
        ingredients.replace("</p>", "")
        product.Ingredients = ingredients
        product.Price = product['currentSku']['listPrice']
        product.SearchNum = current_item_idx
        product.save()
        current_item_idx += 1
      except Exception as exc: 
        print(f"Error saving product {product['productId']}")
        print(exc)
  print(f"Added {current_item_idx-1} products from category {category}")
