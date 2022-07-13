//
//  SkincareViewController.m
//  capstone
//
//  Created by Celine Boudaie on 7/8/22.
//

#import "SkincareViewController.h"
#import "ProductCell.h"


@interface SkincareViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *resultsArray;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *refreshCell;

@end

@implementation SkincareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    

    
    NSURL *url = [NSURL URLWithString:@"https://www.sephora.com/api2/catalog/products/P297132"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (error != nil) {
               NSLog(@"%@", [error localizedDescription]);
               UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Cannot Get Products" message:@"The internet appears to offline. Try to connect again!" preferredStyle:UIAlertControllerStyleAlert];

               UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                       //button click event
                                   }];
               
               [alert addAction:ok];
               [self presentViewController:alert animated:YES completion:nil];
           }
           else {
               NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

               NSArray *resultsArray = dataDictionary[@"results"];
               self.resultsArray = resultsArray;
               [self.tableView reloadData];
             
           }
        [self.refreshControl endRefreshing];
       }];
    [self.refreshCell stopAnimating];

    [task resume];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCell" forIndexPath:indexPath];
   
    NSDictionary *product = self.resultsArray[indexPath.row];
    cell.productName.text = product[@"productName"];
    return  cell;
}

//2
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.resultsArray.count;
}

-(void)fetchProducts{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
