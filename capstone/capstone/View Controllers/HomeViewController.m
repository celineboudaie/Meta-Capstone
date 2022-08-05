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
    

    [query findObjectsInBackgroundWithBlock:^(NSArray<PFObject* > *objects, NSError *error) {
        if (!error) {
            self.voteResults = objects;
            NSMutableDictionary *voteCount = [[NSMutableDictionary alloc] init];
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
            NSArray *sortedKeys = [keys sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
                NSString *first = [voteCount objectForKey:a];
                NSString *second = [voteCount objectForKey:b];
                return [second compare:first];
            }];
            NSLog(@"%@",sortedKeys);
        }
        else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}
- (IBAction)refreshTrending:(id)sender {
    PFQuery *query = [PFQuery queryWithClassName:@"Product"];
    [query selectKeys:@[@"Name"]];
    [query selectKeys:@[@"Brand"]];
    [query selectKeys:@[@"Price"]];
    [query selectKeys:@[@"Ingredients"]];
    [query selectKeys:@[@"Category"]];
    [query selectKeys:@[@"ImageURL"]];
    [query selectKeys:@[@"ProductURL"]];
    [query selectKeys:@[@"ID"]];
    query.limit = 2000;
    
    [query findObjectsInBackgroundWithBlock:^(NSArray<PFObject* > *objects, NSError *error) {
        if (!error) {
            self.trendingResults = objects;
            NSLog(@"%@",self.trendingResults);

        } else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
  self.trendingResults =  [[NSMutableArray alloc] init];
    
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCell" forIndexPath:indexPath];
//    cell.product = self.sortedTrendingResults[indexPath.row];
//    return cell;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.sortedTrendingResults.count;
//}





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
