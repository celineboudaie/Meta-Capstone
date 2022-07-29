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

@interface FiltersViewController ()

@end

@implementation FiltersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)faceWash:(id)sender {
    if(self.faceWash == NO){
        self.faceWash = YES;
        [query whereKey:@"Category" equalTo:@"face wash"];
        //[self.faceWash setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        
    }
    else{

    }
}

//- (IBAction)moisturizer:(id)sender {
    //[query whereKey:@"Category" equalTo:@"face moisturizer"];
//}
//
//- (IBAction)suncreen:(id)sender {
//[query whereKey:@"Category" equalTo:@"sunscreen"];
//}
//
//- (IBAction)eyeCream:(id)sender {
//[query whereKey:@"Category" equalTo:@"eye cream"];

//}
//
//- (IBAction)makeupRemover:(id)sender {
//[query whereKey:@"Category" equalTo:@"makeup remover"];
//}
//
//- (IBAction)toner:(id)sender {
//[query whereKey:@"Category" equalTo:@"toner"];

//}
//
//
//- (IBAction)submitTapped:(id)sender {

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
