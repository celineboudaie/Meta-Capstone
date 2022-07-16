//
//  ProductCell.m
//  capstone
//
//  Created by Celine Boudaie on 7/8/22.
//

#import "ProductCell.h"
#import "UIImageView+AFNetworking.h"
#import "AppDelegate.h"



@implementation ProductCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setProductObject:(Product *)product{
    self.product = product;
    [self refreshData];
}

-(void) refreshData{
    NSString* upvoteString = [[NSString alloc] initWithFormat:@"%d", _product.upvoteCount];
    NSString* downvoteString = [[NSString alloc] initWithFormat:@"%d", _product.downvoteCount];
    
    [self.upvote setTitle:upvoteString forState:UIControlStateNormal];
    [self.downvote setTitle:downvoteString forState:UIControlStateNormal];
}

- (IBAction)tapUpvote:(id)sender {
    if(self.product.upvoted == NO){
        self.product.upvoted = YES;
        self.product.upvoteCount += 1;
        [self.upvote setImage:[UIImage imageNamed:@"arrow.up.heart.fill"] forState:UIControlStateNormal];
        self.productObject = self.product;
        [self refreshData];
//        [[APIManager shared] upvote:self.Product completion:^(Product *product, NSError *error) {
//
//            if(error){
//                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
//            }
//            else{
//                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
//            }
//        }];
    }
    else{
        self.product.upvoted = NO;
        self.product.upvoteCount -= 1;
        [self.upvote setImage:[UIImage imageNamed:@"arrow.up.heart"] forState:UIControlStateNormal];
        self.productObject = self.product;
        [self refreshData];
//        [[APIManager shared] upvote:self.product completion:^(Product *product, NSError *error) {
//
//        if(error){
//            NSLog(@"Error upvoting product: %@", error.localizedDescription);
//        }
//        else{
//            NSLog(@"Successfully upvoted the following Product: %@", _tweet.text);
//        }
//
//        }];
//    }
}
}

- (IBAction)tapDownvote:(id)sender {
    
}

- (IBAction)tapBookmark:(id)sender {
}

@end
