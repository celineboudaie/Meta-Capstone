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

@end

@implementation FiltersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)submitTapped:(id)sender {
    
}

- (IBAction)faceWash:(id)sender {
        NSPredicate *categoryFaceWash = [NSPredicate predicateWithFormat:@"Category beginswith[c] 'face wash'"];
        NSArray *isFaceWash = [productResults filteredArrayUsingPredicate:categoryFaceWash];
        NSLog(@"%@",isFaceWash);
        
}

//for filters:
//NSPredicate *sPredicate =
//[NSPredicate predicateWithFormat:@"Ingredients contains[c] 'a'"];
//[array filterUsingPredicate:sPredicate];

//- (IBAction)moisturizer:(id)sender {
//}
//
//- (IBAction)suncreen:(id)sender {
//}
//
//- (IBAction)eyeCream:(id)sender {
//}
//
//- (IBAction)makeupRemover:(id)sender {
//}
//
//- (IBAction)toner:(id)sender {
//[query whereKey:@"Category" equalTo:@"toner"];

//}
//


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
