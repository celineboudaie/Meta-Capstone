//
//  Product.m
//  capstone
//
//  Created by Celine Boudaie on 7/21/22.
//

#import "Product.h"
#import "Parse/Parse.h"

@implementation Product
- (instancetype)initWithPFObject:(PFObject *)productObject {
    [productObject fetchIfNeeded];
    self = [super init];
    if(self){
        self.Name = [productObject objectForKey:@"Name"];
        self.Brand = [productObject objectForKey:@"Brand"];
        self.Price = [productObject objectForKey:@"Price"];
        self.Ingredients = [productObject objectForKey:@"Ingredients"];
        self.Category = [productObject objectForKey:@"Category"];
        self.ImageURL = [productObject objectForKey:@"ImageURL"];
        self.ProductURL = [productObject objectForKey:@"ProductURL"];
        self.ID = [productObject objectForKey:@"ID"];
    }
    
    return self;
}
@end
