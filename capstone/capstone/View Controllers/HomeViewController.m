//
//  HomeViewController.m
//  capstone
//
//  Created by Celine Boudaie on 7/8/22.
//

#import "HomeViewController.h"
#import "Parse/Parse.h"
#import "Product.h""


@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"https://www.sephora.com/api/catalog/search?type=keyword&content=true&includeRegionsMap=true&targetSearchEngine=nlp&countryCode=US&q=skincare"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
}
//ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCell" forIndexPath:indexPath];
//NSDictionary *Product = self.resultsArray[indexPath.row];
//NSLog(@"%@", Product[@"productName"]);
//cell.productName.text = Product[@"productName"];
//cell.productBrand.text = Product[@"brandName"];
//cell.productPrice.text = Product[@"listPrice"];
//
//NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
//NSString *productURLString = Product[@"image135"];
//NSString *fullProductURLString = [baseURLString stringByAppendingString:productURLString];
//
//NSURL *productURL = [NSURL URLWithString:fullProductURLString];
//cell.productImage.image = nil;
//[cell.productImage setImageWithURL:productURL];


- (IBAction)transferData:(id)sender {
    //newProduct.Name = Product[@"productName"];
    //newProduct.Brand = Product[@"brandName"];
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
