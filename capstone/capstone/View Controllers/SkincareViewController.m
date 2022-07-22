//
//  SkincareViewController.m
//  capstone
//
//  Created by Celine Boudaie on 7/8/22.
//

#import "SkincareViewController.h"
#import "ProductCell.h"
#import "UIImageView+AFNetworking.h"



@interface SkincareViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *resultsArray;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *refreshCell;

@end

@implementation SkincareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCell" forIndexPath:indexPath];
    NSDictionary *Product = self.resultsArray[indexPath.row];
    NSLog(@"%@", Product[@"productName"]);
    cell.productName.text = Product[@"productName"];
    cell.productBrand.text = Product[@"brandName"];
    cell.productPrice.text = Product[@"listPrice"];
    
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *productURLString = Product[@"image135"];
    NSString *fullProductURLString = [baseURLString stringByAppendingString:productURLString];

    NSURL *productURL = [NSURL URLWithString:fullProductURLString];
    cell.productImage.image = nil;
    [cell.productImage setImageWithURL:productURL];
    
    
    return cell;
}

//2
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.resultsArray.count;
}

//-(void)fetchProducts{
//
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
