//
//  Product.m
//  capstone
//
//  Created by Celine Boudaie on 7/21/22.
//

#import "Product.h"
#import "Parse/Parse.h"

@implementation Product
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if(self){
        self = [super init];
        self.idStr = dictionary[@"id_str"];
        self.upvoteCount = [dictionary[@"upvote_count"] intValue];
        self.upvoted = [dictionary[@"upvoted"] boolValue];
        self.downvoteCount = [dictionary[@"downvote_count"] intValue];
        self.downvoted = [dictionary[@"downvoted"] boolValue];
        self.bookmark = [dictionary[@"bookmark"] boolValue];
    }
   
    return self;
}
@end
