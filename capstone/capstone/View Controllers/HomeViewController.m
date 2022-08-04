//
//  HomeViewController.m
//  capstone
//
//  Created by Celine Boudaie on 7/8/22.
//

#import "HomeViewController.h"
#import "Parse/Parse.h"
#import "Product.h"
#import "ProductCell.h"
#import "UIImageView+AFNetworking.h"


@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onePriceFilter:(id)sender {
    
}

- (IBAction)twoPriceFilter:(id)sender {
    
}

- (IBAction)threePriceFilter:(id)sender {
    
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //Getting filtered product results from filters view controller
//    NSIndexPath *senderIndex = [self.tableView indexPathForCell:sender];
//    NSDictionary *products = self.filteredProductResults[senderIndex.row];
}

@end
