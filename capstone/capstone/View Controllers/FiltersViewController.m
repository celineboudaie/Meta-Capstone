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
#import "HomeViewController.h"

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

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    [self viewDidLoad];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.filteredProductResults = [[NSMutableArray alloc]init];
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
    [NSTimer scheduledTimerWithTimeInterval:0.8 target:self selector:@selector(waitBeforeSegue) userInfo:nil repeats:NO];
}

-  (void) filterProductsBasedOnCategory:(NSString*)category {
   NSString * categoryFormatString = [NSString stringWithFormat:@"Category = '%@'", category];
    NSPredicate *categoryPredicate = [NSPredicate predicateWithFormat:categoryFormatString];
    NSArray *isCategoryArray = [self.productResults filteredArrayUsingPredicate:categoryPredicate];
    [self.filteredProductResults addObjectsFromArray:isCategoryArray];
}

//Categories
- (IBAction)faceWash:(id)sender {
    [self filterProductsBasedOnCategory:@"face wash"];
}

- (IBAction)moisturizer:(id)sender {
    [self filterProductsBasedOnCategory:@"face moisturizer"];

}

- (IBAction)sunscreen:(id)sender {
    [self filterProductsBasedOnCategory:@"sunscreen"];
}

- (IBAction)eyeCream:(id)sender {
    [self filterProductsBasedOnCategory:@"eye cream"];
}

- (IBAction)makeupRemover:(id)sender {
    [self filterProductsBasedOnCategory:@"makeup remover"];
}

- (IBAction)toner:(id)sender {
    [self filterProductsBasedOnCategory:@"toner"];
}


//Filters
-  (void) filterOutProductsBasedOnIngredients:(NSString*)ingredients {
   NSString * ingredientsFormatString = [NSString stringWithFormat:@"Ingredients contains[c] '%@'", ingredients];
    NSPredicate *ingredientsPredicate = [NSPredicate predicateWithFormat:ingredientsFormatString];
    NSArray *isIngredientsArray = [self.productResults filteredArrayUsingPredicate:ingredientsPredicate];
    [self.filteredProductResults removeObjectsInArray:isIngredientsArray];
}



- (IBAction)filter1:(id)sender {
    [self filterOutProductsBasedOnIngredients:@"fragrance"];
}

- (IBAction)filter2:(id)sender {
    [self filterOutProductsBasedOnIngredients:@"oxybenzone"];
}

- (IBAction)filter3:(id)sender {
    [self filterOutProductsBasedOnIngredients:@"alcohol"];
}

- (IBAction)filter4:(id)sender {
    [self filterOutProductsBasedOnIngredients:@"paraben"];
}

- (IBAction)filter5:(id)sender {
    [self filterOutProductsBasedOnIngredients:@"sulfate"];
}

- (IBAction)filter6:(id)sender {
    [self filterOutProductsBasedOnIngredients:@"formaldehydes"];
}

- (IBAction)filter7:(id)sender {
    [self filterOutProductsBasedOnIngredients:@"triclocarban"];
}

- (IBAction)filter8:(id)sender {
    [self filterOutProductsBasedOnIngredients:@"triclosan"];
}

- (IBAction)filter9:(id)sender {
    [self filterOutProductsBasedOnIngredients:@"benzaldehyde"];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   SkincareViewController *skincareVC = [segue destinationViewController];
    skincareVC.filteredProductResults = _filteredProductResults;
    
}
@end
