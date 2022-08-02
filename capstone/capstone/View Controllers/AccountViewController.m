//
//  AccountViewController.m
//  capstone
//
//  Created by Celine Boudaie on 7/8/22.
//

#import "AccountViewController.h"
#import "LoginViewController.h"
#import "SceneDelegate.h"
#import "Parse/Parse.h"


@interface AccountViewController ()
@property (strong, nonatomic) IBOutlet UITextField *fullName;
@property (strong, nonatomic) IBOutlet UITextField *userLocation;

@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)submitInfo:(id)sender {
    [PFUser.currentUser setValue:self.fullName.text forKey:@"fullName"];
    [PFUser.currentUser setValue:self.userLocation.text forKey:@"city"];
    [PFUser.currentUser save];
}



- (IBAction)didTapLogout:(id)sender {
    SceneDelegate *mySceneDelegate = (SceneDelegate * )
    UIApplication.sharedApplication.connectedScenes.allObjects.firstObject.delegate;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    mySceneDelegate.window.rootViewController = loginViewController;
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error){}];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
