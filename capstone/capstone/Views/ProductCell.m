//
//  ProductCell.m
//  capstone
//
//  Created by Celine Boudaie on 7/8/22.
//

#import "ProductCell.h"
#import "UIImageView+AFNetworking.h"
#import "AppDelegate.h"
#import "Product.h"
#import "SkincareViewController.h"



@implementation ProductCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setProduct:(PFObject *)product{
    _product = [[Product alloc] initWithPFObject:product];
    self.productName.text = self.product.Name;
    self.productBrand.text = self.product.Brand;
    self.productPrice.text = self.product.Price;
    [self refreshData];
}

-(void) refreshData{
    NSString* upvoteString = [[NSString alloc] initWithFormat:@"%d", _product.upvoteCount];
    NSString* downvoteString = [[NSString alloc] initWithFormat:@"%d", _product.downvoteCount];
    
    [self.upvote setTitle:upvoteString forState:UIControlStateNormal];
    [self.downvote setTitle:downvoteString forState:UIControlStateNormal];
}

- (IBAction)tappedUpvote:(id)sender forEvent:(UIEvent *)event {
    UITouch* touch = [[event allTouches] anyObject];
       if (touch.tapCount == 2) {
           self.product.upvoted = YES;
           self.product.upvoteCount += 1;
           [self.upvote setImage:[UIImage imageNamed:@"arrow.up.heart.fill"] forState:UIControlStateNormal];
   //        self.productObject = self.product;
           [self refreshData];

       }
       else{
           self.product.upvoted = NO;
           self.product.upvoteCount -= 1;
           [self.upvote setImage:[UIImage imageNamed:@"arrow.up.heart"] forState:UIControlStateNormal];
           [self refreshData];
       }
}

- (IBAction)tappedDownvote:(id)sender forEvent:(UIEvent *)event {
    UITouch* touch = [[event allTouches] anyObject];
       if (touch.tapCount == 2) {
           self.product.downvoted = YES;
           self.product.downvoteCount += 1;
           [self.downvote setImage:[UIImage imageNamed:@"arrow.down.heart.fill"] forState:UIControlStateNormal];
   //        self.productObject = self.product;
           [self refreshData];

       }
       else{
           self.product.downvoted = NO;
           self.product.downvoteCount -= 1;
           [self.downvote setImage:[UIImage imageNamed:@"arrow.down.heart"] forState:UIControlStateNormal];
           [self refreshData];
       }
}



- (IBAction)tapBookmark:(id)sender {
    
}

@end
