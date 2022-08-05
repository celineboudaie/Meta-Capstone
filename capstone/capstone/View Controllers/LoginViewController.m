//
//  LoginViewController.m
//  capstone
//
//  Created by Celine Boudaie on 7/11/22.
//

#import "LoginViewController.h"
#import "Parse/Parse.h"

@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)loginUser:(id)sender {
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
       
       [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
           if (error != nil) {
               NSLog(@"User log in failed: %@", error.localizedDescription);
           } else {
               
               NSLog(@"User logged in successfully");
               [self performSegueWithIdentifier:@"loginSegue" sender:nil];
           }
       }];
}

- (IBAction)registerUser:(id)sender {
    // initialize a user object
       PFUser *newUser = [PFUser user];
       
       // set user properties
       newUser.username = self.usernameField.text;
       newUser.password = self.passwordField.text;
       
       // call sign up function on the object
       [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
           if (error != nil) {
               NSLog(@"Error: %@", error.localizedDescription);
           }
           else {
               NSLog(@"User registered successfully");
               [self performSegueWithIdentifier:@"loginSegue" sender:nil];
           }
       }];
}


@end
