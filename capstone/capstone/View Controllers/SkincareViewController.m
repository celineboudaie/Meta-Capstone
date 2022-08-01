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

@interface SkincareViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray<Product *> *productResults;

@end


@implementation SkincareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    PFQuery *query = [PFQuery queryWithClassName:@"Product"];
    [query selectKeys:@[@"Name"]];
    [query selectKeys:@[@"Brand"]];
    [query selectKeys:@[@"Price"]];
    [query selectKeys:@[@"Ingredients"]];
    [query selectKeys:@[@"Category"]];
    [query selectKeys:@[@"upvoteCount"]];
    [query selectKeys:@[@"downvoteCount"]];
    
    
      [query findObjectsInBackgroundWithBlock:^(NSArray<PFObject* > *objects, NSError *error) {
          if (!error) {
              self.productResults = objects;
              NSLog(@"%@",self.productResults);
              [self.tableView reloadData];
          } else {
              NSLog(@"Error: %@ %@", error, [error userInfo]);
          }
      }];
   
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCell" forIndexPath:indexPath];
    cell.product = self.productResults[indexPath.row];
    return cell;
}
        
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.productResults.count;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *senderIndex = [self.tableView indexPathForCell:sender];
    NSDictionary *products = self.productResults[senderIndex.row];
    ProductDetailsViewController *detailVC = [segue destinationViewController];
    detailVC.products = products;
}
@end
        
        
