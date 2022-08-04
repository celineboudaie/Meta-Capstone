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
@property (strong, nonatomic) NSMutableArray<Product *> *filteredProductResults;
@property (strong, nonatomic) IBOutlet BEMCheckBox *checkBox;


@end

@implementation FiltersViewController
-(void) viewWillAppear:(BOOL)animated{
    self.checkBox.on = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [_filteredProductResults removeAllObjects];
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
              self.productResults = objects;
              NSLog(@"%@",self.productResults);

          } else {
              NSLog(@"Error: %@ %@", error, [error userInfo]);
          }
      }];
    self.filteredProductResults =  [[NSMutableArray alloc] init];
}

- (void) waitBeforeSegue {
    [self performSegueWithIdentifier:@"skincareCellsSegue" sender:nil];
}

- (IBAction)submitTapped:(id)sender {
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(waitBeforeSegue) userInfo:nil repeats:NO];
}

//Categories
- (IBAction)faceWash:(id)sender {
        NSPredicate *categoryFaceWash = [NSPredicate predicateWithFormat:@"Category = 'face wash'"];
        NSArray *isFaceWash = [self.productResults filteredArrayUsingPredicate:categoryFaceWash];
        [self.filteredProductResults addObjectsFromArray:isFaceWash];
        NSLog(@"%@",_filteredProductResults);
}

- (IBAction)moisturizer:(id)sender {
    NSPredicate *categoryMoisturizer = [NSPredicate predicateWithFormat:@"Category = 'face moisturizer'"];
    NSArray *isMoisturizer = [self.productResults filteredArrayUsingPredicate:categoryMoisturizer];
    [self.filteredProductResults addObjectsFromArray:isMoisturizer];
    NSLog(@"%@",isMoisturizer);
}

- (IBAction)sunscreen:(id)sender {
    NSPredicate *categorySunscreen = [NSPredicate predicateWithFormat:@"Category = 'sunscreen'"];
    NSArray *isSunscreen = [self.productResults filteredArrayUsingPredicate:categorySunscreen];
    [self.filteredProductResults addObjectsFromArray:isSunscreen];
    NSLog(@"%@",isSunscreen);
}

- (IBAction)eyeCream:(id)sender {
    NSPredicate *categoryEyeCream = [NSPredicate predicateWithFormat:@"Category = 'eye cream'"];
    NSArray *isEyeCream = [self.productResults filteredArrayUsingPredicate:categoryEyeCream];
    [self.filteredProductResults addObjectsFromArray:isEyeCream];
    NSLog(@"%@",isEyeCream);
}

- (IBAction)makeupRemover:(id)sender {
    NSPredicate *categoryMakeupRemover = [NSPredicate predicateWithFormat:@"Category = 'makeup remover'"];
    NSArray *isMakeupRemover = [self.productResults filteredArrayUsingPredicate:categoryMakeupRemover];
    [self.filteredProductResults addObjectsFromArray:isMakeupRemover];
    NSLog(@"%@",isMakeupRemover);
}

- (IBAction)toner:(id)sender {
    NSPredicate *categoryToner = [NSPredicate predicateWithFormat:@"Category = 'toner'"];
    NSArray *isToner = [self.productResults filteredArrayUsingPredicate:categoryToner];
    [self.filteredProductResults addObjectsFromArray:isToner];
    NSLog(@"%@",isToner);
}


//Filters
- (IBAction)filter1:(id)sender {
    NSPredicate *filterOne = [NSPredicate predicateWithFormat:@"Ingredients contains[c] 'fragrance'"];
    NSArray *filterFragrance = [self.productResults filteredArrayUsingPredicate:filterOne];
    [self.filteredProductResults removeObjectsInArray:filterFragrance];
    NSLog(@"%@",filterFragrance);
}

- (IBAction)filter2:(id)sender {
    NSPredicate *filterTwo = [NSPredicate predicateWithFormat:@"Ingredients contains[c] 'oxybenzone'"];
    NSArray *filterOxybenzone = [self.productResults filteredArrayUsingPredicate:filterTwo];
    NSLog(@"%@",filterOxybenzone);
    [self.filteredProductResults removeObjectsInArray:filterOxybenzone];
}

- (IBAction)filter3:(id)sender {
    NSPredicate *filterThree = [NSPredicate predicateWithFormat:@"Ingredients contains[c] 'alcohol'"];
    NSArray *filterAlcohol = [self.productResults filteredArrayUsingPredicate:filterThree];
    [self.filteredProductResults removeObjectsInArray:filterAlcohol];
    NSLog(@"%@",filterAlcohol);
}

- (IBAction)filter4:(id)sender {
    NSPredicate *filterFour = [NSPredicate predicateWithFormat:@"Ingredients contains[c] 'paraben'"];
    NSArray *filterParaben = [self.productResults filteredArrayUsingPredicate:filterFour];
    [self.filteredProductResults removeObjectsInArray:filterParaben];
    NSLog(@"%@",filterParaben);
}

- (IBAction)filter5:(id)sender {
    NSPredicate *filterFive = [NSPredicate predicateWithFormat:@"Ingredients contains[c] 'sulfate'"];
    NSArray *filterSulfate = [self.productResults filteredArrayUsingPredicate:filterFive];
    [self.filteredProductResults removeObjectsInArray:filterSulfate];
    NSLog(@"%@",filterSulfate);
}

- (IBAction)filter6:(id)sender {
    NSPredicate *filterSix = [NSPredicate predicateWithFormat:@"Ingredients contains[c] 'formaldehydes'"];
    NSArray *filterFormaldehydes = [self.productResults filteredArrayUsingPredicate:filterSix];
    [self.filteredProductResults removeObjectsInArray:filterFormaldehydes];
    NSLog(@"%@",filterFormaldehydes);
}

- (IBAction)filter7:(id)sender {
    NSPredicate *filterSeven = [NSPredicate predicateWithFormat:@"Ingredients contains[c] 'triclocarban'"];
    NSArray *filterTriclocarban = [self.productResults filteredArrayUsingPredicate:filterSeven];
    [self.filteredProductResults removeObjectsInArray:filterTriclocarban];
    NSLog(@"%@",filterTriclocarban);
}

- (IBAction)filter8:(id)sender {
    NSPredicate *filterEight = [NSPredicate predicateWithFormat:@"Ingredients contains[c] 'triclosan'"];
    NSArray *filterTriclosan = [self.productResults filteredArrayUsingPredicate:filterEight];
    [self.filteredProductResults removeObjectsInArray:filterTriclosan];
    NSLog(@"%@",filterTriclosan);
}

- (IBAction)filter9:(id)sender {
    NSPredicate *filterNine = [NSPredicate predicateWithFormat:@"Ingredients contains[c] 'benzaldehyde'"];
    NSArray *filterBenzaldehyde = [self.productResults filteredArrayUsingPredicate:filterNine];
    [self.filteredProductResults removeObjectsInArray:filterBenzaldehyde];
    NSLog(@"%@",filterBenzaldehyde);
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   SkincareViewController *skincareVC = [segue destinationViewController];
    skincareVC.filteredProductResults = _filteredProductResults;
}
@end
