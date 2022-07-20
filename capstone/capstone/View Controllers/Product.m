//
//  Product.m
//  capstone
//
//  Created by Celine Boudaie on 7/20/22.
//

#import "Product.h"
#import "PFObject+Subclass.h"

@implementation Product
@dynamic idStr;
@dynamic upvoteCount;
@dynamic upvoted;
@dynamic downvoteCount;
@dynamic downvoted;
@dynamic bookmark;

+(nonnull NSString *)parseClassName{
    return @"Product";
}



@end
