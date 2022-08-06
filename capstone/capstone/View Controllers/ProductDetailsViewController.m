//
//  ProductDetailsViewController.m
//  capstone
//
//  Created by Celine Boudaie on 7/27/22.
//

#import "ProductDetailsViewController.h"
#import "ProductCell.h"
#import "UIImageView+AFNetworking.h"
#import "Product.h"
#import "Parse/Parse.h"
#import "FBShimmeringView.h"

@interface ProductDetailsViewController ()
@property (strong, nonatomic) IBOutlet UILabel *productBrand;
@property (strong, nonatomic) IBOutlet UILabel *productName;
@property (strong, nonatomic) IBOutlet UILabel *productPrice;
@property (strong, nonatomic) IBOutlet UILabel *Ingredients;
@property (strong, nonatomic) IBOutlet UIImageView *productImage;
@property (strong, nonatomic) IBOutlet FBShimmeringView *shimmeringViewAnimation;


@end

@implementation ProductDetailsViewController

- (void)viewDidLoad {
    self.shimmeringViewAnimation.contentView = self.productBrand;
    self.shimmeringViewAnimation.shimmering = YES;
    self.productName.text = self.products[@"Name"];
    self.productBrand.text = self.products[@"Brand"];
    self.productPrice.text = self.products[@"Price"];
    self.Ingredients.text = self.products[@"Ingredients"];
    NSString *URLString = self.products[@"ImageURL"];
    NSURL *url = [NSURL URLWithString:URLString];
    self.productImage.image = nil;
    [self.productImage setImageWithURL:url];
    

}



@end
