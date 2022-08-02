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

- (void) wait {
    [self performSegueWithIdentifier:@"skincareCellsSegue" sender:nil];
}

- (IBAction)submitTapped:(id)sender {
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(wait) userInfo:nil repeats:NO];
}

//Categories
- (IBAction)faceWash:(id)sender {
        NSPredicate *categoryFaceWash = [NSPredicate predicateWithFormat:@"Category beginswith[c] 'face wash'"];
        NSArray *isFaceWash = [self.productResults filteredArrayUsingPredicate:categoryFaceWash];
        NSLog(@"%@",isFaceWash);
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

- (IBAction)filter3:(id)sender {
    NSPredicate *filterThree = [NSPredicate predicateWithFormat:@"Ingredients contains[c] 'alcohol'"];
    NSArray *filterAlcohol = [self.productResults filteredArrayUsingPredicate:filterThree];
    NSLog(@"%@",filterAlcohol);
    //remove from filteredProduct Results
}

- (IBAction)filter4:(id)sender {
    NSPredicate *filterFour = [NSPredicate predicateWithFormat:@"Ingredients contains[c] 'paraben'"];
    NSArray *filterParaben = [self.productResults filteredArrayUsingPredicate:filterFour];
    NSLog(@"%@",filterParaben);
    //remove from filteredProduct Results
}

- (IBAction)filter5:(id)sender {
    NSPredicate *filterFive = [NSPredicate predicateWithFormat:@"Ingredients contains[c] 'sulfate'"];
    NSArray *filterSulfate = [self.productResults filteredArrayUsingPredicate:filterFive];
    NSLog(@"%@",filterSulfate);
    //remove from filteredProduct Results
}

- (IBAction)filter6:(id)sender {
    NSPredicate *filterSix = [NSPredicate predicateWithFormat:@"Ingredients contains[c] 'formaldehydes'"];
    NSArray *filterSulfate = [self.productResults filteredArrayUsingPredicate:filterSix];
    NSLog(@"%@",filterSulfate);
    //remove from filteredProduct Results
}

- (IBAction)filter7:(id)sender {
    NSPredicate *filterSeven = [NSPredicate predicateWithFormat:@"Ingredients contains[c] 'triclocarban'"];
    NSArray *filterTriclocarban = [self.productResults filteredArrayUsingPredicate:filterSeven];
    NSLog(@"%@",filterTriclocarban);
    //remove from filteredProduct Results
}

- (IBAction)filter8:(id)sender {
    NSPredicate *filterEight = [NSPredicate predicateWithFormat:@"Ingredients contains[c] 'triclosan'"];
    NSArray *filterTriclosan = [self.productResults filteredArrayUsingPredicate:filterEight];
    NSLog(@"%@",filterTriclosan);
    //remove from filteredProduct Results
}

- (IBAction)filter9:(id)sender {
    NSPredicate *filterNine = [NSPredicate predicateWithFormat:@"Ingredients contains[c] 'benzaldehyde'"];
    NSArray *filterBenzaldehyde = [self.productResults filteredArrayUsingPredicate:filterNine];
    NSLog(@"%@",filterBenzaldehyde);
    //remove from filteredProduct Results
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//   SkincareViewController *skincareVC = [segue destinationViewController];
//    skincareVC.productResults = productResults;
}
@end
