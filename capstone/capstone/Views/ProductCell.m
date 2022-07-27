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

- (IBAction)tapUpvote:(id)sender {
    if(self.product.upvoted == NO){
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

- (IBAction)tapDownvote:(id)sender {
    
}

- (IBAction)tapBookmark:(id)sender {
}

@end
