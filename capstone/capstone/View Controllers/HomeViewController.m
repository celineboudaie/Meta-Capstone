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
#import "SkincareViewController.h"
#import "FiltersViewController.h"


@interface HomeViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSArray<Product *> *trendingResults;
@property (strong, nonatomic) NSArray<Product *> *voteResults;
@property (strong, nonatomic) IBOutlet UITableView *trendingTableView;
@property (strong, nonatomic) NSArray<Product *> *sortedTrendingResults;



@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.trendingTableView.dataSource = self;
    self.trendingTableView.delegate = self;
}


- (IBAction)refreshTrending:(id)sender {
    PFQuery *voteQuery = [PFQuery queryWithClassName:@"Vote"];
    [voteQuery selectKeys:@[@"ProductID"]];
    [voteQuery selectKeys:@[@"UserID"]];
    __block NSArray *productsByPopularity;
    NSMutableDictionary *voteCount = [[NSMutableDictionary alloc] init];

    [voteQuery findObjectsInBackgroundWithBlock:^(NSArray<PFObject* > *objects, NSError *error) {
        if (!error) {
            self.voteResults = objects;
            for(id vote in self.voteResults){
                NSLog(@"%@",vote);
                if([voteCount objectForKey:vote[@"ProductID"]] != nil){
                    NSNumber *newCount = [NSNumber numberWithInt:[voteCount[vote[@"ProductID"]] intValue] + 1];
                    voteCount[vote[@"ProductID"]] = newCount;
                }
                else{
                    NSNumber *newCount = [NSNumber numberWithInt:1];
                    voteCount[vote[@"ProductID"]] = newCount;
                }
            }
            NSLog(@"%@",voteCount);
            NSArray *keys = [voteCount allKeys];
            productsByPopularity = [keys sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
                NSString *first = [voteCount objectForKey:a];
                NSString *second = [voteCount objectForKey:b];
                return [second compare:first];
            }];
            NSLog(@"%@",productsByPopularity);
            PFQuery *productQuery = [PFQuery queryWithClassName:@"Product"];
            [productQuery selectKeys:@[@"Name"]];
            [productQuery selectKeys:@[@"Brand"]];
            [productQuery selectKeys:@[@"Price"]];
            [productQuery selectKeys:@[@"Ingredients"]];
            [productQuery selectKeys:@[@"Category"]];
            [productQuery selectKeys:@[@"ImageURL"]];
            [productQuery selectKeys:@[@"ProductURL"]];
            [productQuery selectKeys:@[@"ID"]];
            [productQuery whereKey:@"ID" containedIn:productsByPopularity];

            productQuery.limit = 2000;

            [productQuery findObjectsInBackgroundWithBlock:^(NSArray<PFObject* > *objects, NSError *error) {
                if (!error) {
                    self.trendingResults = [objects sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
                        NSString *first = [voteCount objectForKey:a[@"ID"]];
                        NSString *second = [voteCount objectForKey:b[@"ID"]];
                        return [second compare:first];
                    }];

                    NSLog(@"%@",self.trendingResults);

                } else {
                    NSLog(@"Error: %@ %@", error, [error userInfo]);
                }
            }];
        }
        else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCell" forIndexPath:indexPath];
    cell.product = self.sortedTrendingResults[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sortedTrendingResults.count;
}





//remove products w/price that doesnt fall in range
- (IBAction)onePriceFilter:(id)sender {
}
- (IBAction)twoPriceFilter:(id)sender {
}
- (IBAction)threePriceFilter:(id)sender {
}


#pragma mark - Navigation

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//
//}



@end
