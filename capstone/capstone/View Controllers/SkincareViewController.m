//
//  SkincareViewController.m
//  capstone
//
//  Created by Celine Boudaie on 7/8/22.
//

#import "SkincareViewController.h"
#import "ProductCell.h"
#import "Product.h"
#import "UIImageView+AFNetworking.h"
#import "Parse/Parse.h"
#import "ProductDetailsViewController.h"
#import "FiltersViewController.h"

@interface SkincareViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray<Product *> *productResults;

@end


@implementation SkincareViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCell" forIndexPath:indexPath];
    cell.product = self.filteredProductResults[indexPath.row];
    return cell;
}
        
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.filteredProductResults.count;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //Getting filtered product results from filters view controller
    NSIndexPath *senderIndex = [self.tableView indexPathForCell:sender];
    NSDictionary *products = self.filteredProductResults[senderIndex.row];
    //For Details View Controller
    ProductDetailsViewController *detailVC = [segue destinationViewController];
    detailVC.products = products;
}
@end
        
        
