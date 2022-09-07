# Meta-Capstone
## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
SkinSweep was created for individuals to find clean products and filter out ingredients that are potentially causing harm to their body. The application is meant for users to learn more about the issues with certain ingredients in their products and find replacements for their favorite products. The homefeed displays users with trending products based on the upvotes and downvotes of other users. One page of the app will be dedicated to providing scientific research about why a certain ingredient is harmful to the body. Users are able to filter out ingredients after learning about their harm and their feed for a certain product type will be populated with the product with the most upvotes. Users can upvote, downvote, comment, and save products they are interested in purchasing or researching further. 

### App Evaluation
- **Category:Lifestyle/Wellness**
- **Mobile: iOS focused**
- **Story: Users are able to learn about the ingredients in their product and find a cleaner alternative**
- **Market: Users looking to live a cleaner life**
- **Habit: Users are expected to be active abt 3x a week. Users can post, upvote, and downvote products after trying them. Look at trending products and for replacements. Also, they will use the app whenever they are interested in learning about new ingredients and why they are harmful to their body.**
- **Scope: Skincare and possibly expand to makeup, haircare, and food**

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**
* Home feed that displays trending products based on user upvotes and articles
* Skincare tab where users can choose a type of product, filter out multiple ingredients, and view the most popular products that are in line with the slected filters based on user upvote. Users can upvote, downvote, bookmark, and review a certain product. 
* Each product would have seperate page where users can see the full ingredient list, product image, and community insight.
* Learn more about the filter. Each filter would have a page dedicated with an explanation about why it is even an option to filter out. Scientific research would be provided to explain why the ingredient is harmful to an individual
* Account page where users can look at their bookmarked products and logout
* * Having the amazon link to buy the products


**Optional Nice-to-have Stories**

* Expanding the scope of my project by creating a tab for haircare, makeup, and food

### 2. Screen Archetypes

* Login in/Sign Up
   * Upon opening the app, the user is prompted to sign up or login to the app so that the data associated with their account can be stored to their user info
* Home Feed
   * Upon selecting this view, the user will be able to view trending products and articles about filters based on x amount of saves and clicks
* Skincare
  * User can choose the type of skincare product they are interested in and then one to multiple filters to exclude certain ingredients
  * Upon slecting the filters, the users screen will be filled with cells of products that adhere to all the filters and the topmost cell will be filled with the product with the most upvotes
  * Upon clicking on the cell the user will be redirected to a details view page that will have the associated amazon link to purchase the item, an image of the product, ingredients, and community insight about the product
* Learn More About Filter 
  * Users will be able to view and click on a cell for each filter
  * Upon clicking on the cell the user will be prompted to a new details view controller with scientific research and data about what makes the ingredient "bad"
* Account Info
  * User can click on the saved products tab to view a collection of cells of products they bookmarked on the skincare tab
  * User can click logout to be redirected to the sign in/sign up page
  
### 3. Navigation

**Tab Navigation** (Tab to Screen)
* Sign In/Sign Up
* Home Feed
* Skincare
* Learn more about filters
* Account Info

**Flow Navigation** (Screen to Screen)
Login/Sign Up Page 
Home Feed
* Skincare Page
   * Details page for each product
   
* Learn more about filter options
   * Details page for each filter with scientific research
   
* Account Information
  * Saved products
    * Page filled with cells of all the users saved products

## Wireframes
https://drive.google.com/file/d/1DohTwRbSM5bLqqoOESDHS7VT9IPyPe3n/view?usp=sharing


## Schema 

### Models
| Property | Type | Description |
| :---         |     :---:      |          ---: |
| objectId   | String| unique id for the user post  |
| upvote count     | Number| number of upvotes associated with a certain product id|
| downvote count   | Number| number of downvotes associated with a certain product id|
| review   | String| connected to the user id and displays the users username when a product review is posted|
| bookmark   | String| stores cells that user bookmarked for certain products and articles|

### Networking
Home Feed
* (Update/GET) Display trending product based on x amount of upvotes or bookamrks
* (Update/GET) Display trending articles about filters based on x amount of clicks

Skincare Tab
* (GET) All products (from API) that adhere to applied filters
* (Create/Post) Comment about certain product
* (GET) change placement of products on skincare tab based on upvote, downvote 

Account Info
* (Update) Saved products if user bookmarks a product on skincare tab
* (READ/GET) Query logged in user object
