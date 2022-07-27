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
    self = [super init];
    if(self){
        self.Name = [productObject objectForKey:@"Name"];
        self.Brand = [productObject objectForKey:@"Brand"];
        self.Price = [productObject objectForKey:@"Price"];
        self.Ingredients = [productObject objectForKey:@"Ingredients"];
        self.Category = [productObject objectForKey:@"Category"];
        self.upvoteCount = [productObject objectForKey:@"upvote_count"];
        self.upvoted = [productObject objectForKey:@"upvoted"];
        self.downvoteCount = [productObject objectForKey:@"downvote_count"];
        self.downvoted = [productObject objectForKey:@"downvoted"];
        self.bookmark = [productObject objectForKey:@"bookmark"];
    }
    
    return self;
}
@end
