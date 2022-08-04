//
//  ProductCell.m
//  capstone
//
//  Created by Celine Boudaie on 7/8/22.
//

#import "ProductCell.h"
#import "UIImageView+AFNetworking.h"
#import "AppDelegate.h"
#import "Product.h"
#import "SkincareViewController.h"



@implementation ProductCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setProduct:(PFObject *)product{
    _product = [[Product alloc] initWithPFObject:product];
    self.productName.text = self.product.Name;
    self.productBrand.text = self.product.Brand;
    self.productPrice.text = self.product.Price;
    
    
    NSString *URLString = self.product.ImageURL;
    NSURL *url = [NSURL URLWithString:URLString];
    self.productImage.image = nil;
    [self.productImage setImageWithURL:url];
    
    
    [self refreshData];
}

-(void) refreshData{
    NSString* upvoteString = [[NSString alloc] initWithFormat:@"%d", _product.upvoteCount];
    NSString* downvoteString = [[NSString alloc] initWithFormat:@"%d", _product.downvoteCount];
    
    [self.upvote setTitle:upvoteString forState:UIControlStateNormal];
    [self.downvote setTitle:downvoteString forState:UIControlStateNormal];
}



//-(instancetype)initWithCoder:(NSCoder *)coder{
//    if(self = [super initWithCoder:coder]){
//        UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didDoubleTap:)];
//        [doubleTapGesture setNumberOfTapsRequired:2];
//        [self addGestureRecognizer:doubleTapGesture];
//    }
//    return self;
//}
//
//-(void) didDoubleTap: (UITapGestureRecognizer *)recognizer {
//    [self.delegate tappedUpvote:self.product];
//}

//- (void) didDoubleTap {
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
//    tapGesture.numberOfTapsRequired = 2;
//    [self.view addGestureRecognizer:tapGesture];
//    [tapGesture release];
//}

- (IBAction)tappedUpvote:(UITapGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateRecognized) {
//        //Ading UserID and ProductID to parse
//        PFObject *newVote = [PFObject vote];
//        
//        // set user properties
//        newVote.ProductID = ;
//        newVote.UserID = current;
//        current
//        
//        [PFUser.currentUser setValue:self.fullName.text forKey:@"fullName"];
//        [PFUser.currentUser setValue:self.userLocation.text forKey:@"city"];
//        [PFUser.currentUser save];
        
        
        self.product.upvoted = YES;
        self.product.upvoteCount += 1;
        [self.upvote setImage:[UIImage imageNamed:@"arrow.up.heart.fill"] forState:UIControlStateNormal];
        [self refreshData];
    }
    else{
        self.product.upvoted = NO;
        self.product.upvoteCount -= 1;
        [self.upvote setImage:[UIImage imageNamed:@"arrow.up.heart"] forState:UIControlStateNormal];
        [self refreshData];
    }
}

- (IBAction)tappedDownvote:(id)sender forEvent:(UIEvent *)event {
    UITouch* touch = [[event allTouches] anyObject];
       if (touch.tapCount == 2) {
           self.product.downvoted = YES;
           self.product.downvoteCount += 1;
           [self.downvote setImage:[UIImage imageNamed:@"arrow.down.heart.fill"] forState:UIControlStateNormal];
           [self refreshData];

       }
       else{
           self.product.downvoted = NO;
           self.product.downvoteCount -= 1;
           [self.downvote setImage:[UIImage imageNamed:@"arrow.down.heart"] forState:UIControlStateNormal];
           [self refreshData];
       }
}



- (IBAction)tapBookmark:(id)sender {
    
}

@end
