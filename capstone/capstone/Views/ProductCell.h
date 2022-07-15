//
//  ProductCell.h
//  capstone
//
//  Created by Celine Boudaie on 7/8/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *productName;
@property (strong, nonatomic) IBOutlet UIImageView *productImage;
@property (strong, nonatomic) IBOutlet UILabel *productBrand;
@property (strong, nonatomic) IBOutlet UILabel *productPrice;
@property (strong, nonatomic) IBOutlet UIButton *upvote;
@property (strong, nonatomic) IBOutlet UIButton *downvote;
@property (strong, nonatomic) IBOutlet UIButton *bookmark;

@end

NS_ASSUME_NONNULL_END
