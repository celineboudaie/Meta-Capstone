//
//  Product.m
//  capstone
//
//  Created by Celine Boudaie on 7/15/22.
//

#import "Product.h"

@implementation Product

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if(self){
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
