//
//  ProductCell.h
//  capstone
//
//  Created by Celine Boudaie on 7/8/22.
//

#import <UIKit/UIKit.h>
#import "Product.h"

NS_ASSUME_NONNULL_BEGIN
@protocol ProductTableViewCellDelegate
    - (void)didDoubleTap:(Product *)product;

@end
@interface ProductCell : UITableViewCell
@property (nonatomic, weak) id<ProductTableViewCellDelegate> delegate;
@property (strong, nonatomic) Product *product;
@property (strong, nonatomic) IBOutlet UILabel *productName;
@property (strong, nonatomic) IBOutlet UIImageView *productImage;
@property (strong, nonatomic) IBOutlet UILabel *productBrand;
@property (strong, nonatomic) IBOutlet UILabel *productPrice;
@property (strong, nonatomic) IBOutlet UIButton *upvote;
@property (strong, nonatomic) IBOutlet UIButton *downvote;
@property (strong, nonatomic) IBOutlet UIButton *bookmark;

@end

NS_ASSUME_NONNULL_END
