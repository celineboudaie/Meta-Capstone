//
//  Product.h
//  capstone
//
//  Created by Celine Boudaie on 7/21/22.
//

#import <Foundation/Foundation.h>
#import "Parse/Parse.h"


NS_ASSUME_NONNULL_BEGIN

@interface Product : NSObject
- (instancetype)initWithPFObject:(PFObject *)productObject;
@property (nonatomic, strong) NSString *Name;
@property (nonatomic, strong) NSString *Brand;
@property (nonatomic, strong) NSString *Price;
@property (nonatomic, strong) NSString *Ingredients;
@property (nonatomic, strong) NSString *Category;
@property (nonatomic, strong) NSString *ImageURL;
@property (nonatomic, strong) NSString *ProductURL;
@property (nonatomic) int upvoteCount;
@property (nonatomic) BOOL upvoted;
@property (nonatomic) int downvoteCount;
@property (nonatomic) BOOL downvoted;
@property (nonatomic) BOOL bookmark;
@end

NS_ASSUME_NONNULL_END

