//
//  SkincareViewController.h
//  capstone
//
//  Created by Celine Boudaie on 7/8/22.
//

#import <UIKit/UIKit.h>
#import "FiltersViewController.h"
#import "Product.h"

NS_ASSUME_NONNULL_BEGIN


@interface SkincareViewController : UIViewController
@property (strong, nonatomic) NSArray<Product *> *filteredProductResults;


@end

NS_ASSUME_NONNULL_END





