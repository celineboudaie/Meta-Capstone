//
//  FiltersViewController.m
//  capstone
//
//  Created by Celine Boudaie on 7/8/22.
//

#import "FiltersViewController.h"
#import "Product.h"
#import "ProductCell.h"
#import "SkincareViewController.h"
#import "BEMCheckBox.h"


@interface FiltersViewController ()
@property (strong, nonatomic) NSArray<Product *> *productResults;
@property (strong, nonatomic) NSArray<Product *> *filteredProductResults;


@end

@implementation FiltersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

          } else {
              NSLog(@"Error: %@ %@", error, [error userInfo]);
          }
      }];
}



- (IBAction)submitTapped:(id)sender {

}

//Categories
- (IBAction)faceWash:(id)sender {
        NSPredicate *categoryFaceWash = [NSPredicate predicateWithFormat:@"Category beginswith[c] 'face wash'"];
        NSArray *isFaceWash = [self.productResults filteredArrayUsingPredicate:categoryFaceWash];
        NSLog(@"%@",isFaceWash);
        [self performSegueWithIdentifier:@"skincareCellsSegue" sender:nil];
}

- (IBAction)moisturizer:(id)sender {
    NSPredicate *categoryMoisturizer = [NSPredicate predicateWithFormat:@"Category beginswith[c] 'face moisturizer'"];
    NSArray *isMoisturizer = [self.productResults filteredArrayUsingPredicate:categoryMoisturizer];
    NSLog(@"%@",isMoisturizer);
    [self performSegueWithIdentifier:@"skincareCellsSegue" sender:nil];
}

- (IBAction)suncreen:(id)sender {
    NSPredicate *categorySunscreen = [NSPredicate predicateWithFormat:@"Category beginswith[c] 'sunscreen'"];
    NSArray *isSunscreen = [self.productResults filteredArrayUsingPredicate:categorySunscreen];
    NSLog(@"%@",isSunscreen);
    [self performSegueWithIdentifier:@"skincareCellsSegue" sender:nil];
}

- (IBAction)eyeCream:(id)sender {
    NSPredicate *categoryEyeCream = [NSPredicate predicateWithFormat:@"Category beginswith[c] 'eye cream'"];
    NSArray *isEyeCream = [self.productResults filteredArrayUsingPredicate:categoryEyeCream];
    NSLog(@"%@",isEyeCream);
    [self performSegueWithIdentifier:@"skincareCellsSegue" sender:nil];
}

- (IBAction)makeupRemover:(id)sender {
    NSPredicate *categoryMakeupRemover = [NSPredicate predicateWithFormat:@"Category beginswith[c] 'makeup remover'"];
    NSArray *isMakeupRemover = [self.productResults filteredArrayUsingPredicate:categoryMakeupRemover];
    NSLog(@"%@",isMakeupRemover);
    [self performSegueWithIdentifier:@"skincareCellsSegue" sender:nil];
}

- (IBAction)toner:(id)sender {
    NSPredicate *categoryToner = [NSPredicate predicateWithFormat:@"Category beginswith[c] 'toner'"];
    NSArray *isToner = [self.productResults filteredArrayUsingPredicate:categoryToner];
    NSLog(@"%@",isToner);
    [self performSegueWithIdentifier:@"skincareCellsSegue" sender:nil];
}

//Filters
- (IBAction)filter1:(id)sender {
    NSPredicate *filterOne = [NSPredicate predicateWithFormat:@"Ingredients contains[c] 'fragrance'"];
    NSArray *filterFragrance = [self.productResults filteredArrayUsingPredicate:filterOne];
    NSLog(@"%@",filterFragrance);
    //remove from filteredProduct Results
}

- (IBAction)filter2:(id)sender {
    NSPredicate *filterTwo = [NSPredicate predicateWithFormat:@"Ingredients contains[c] 'oxybenzone'"];
    NSArray *filterOxybenzone = [self.productResults filteredArrayUsingPredicate:filterTwo];
    NSLog(@"%@",filterOxybenzone);
    //remove from filteredProduct Results
}





#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//   SkincareViewController *skincareVC = [segue destinationViewController];
//   skincareVC.filteredProductResults = filteredProductResults;
}
@end
