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
@property (nonatomic, strong) NSString *idStr;
@property (nonatomic) int upvoteCount;
@property (nonatomic) BOOL upvoted;
@property (nonatomic) int downvoteCount;
@property (nonatomic) BOOL downvoted;
@property (nonatomic) BOOL bookmark;
@end

NS_ASSUME_NONNULL_END
