//
//  AppDelegate.m
//  capstone
//
//  Created by Celine Boudaie on 7/6/22.
//

#import "AppDelegate.h"
#import "Parse/Parse.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ParseClientConfiguration *config = [ParseClientConfiguration  configurationWithBlock:^(id<ParseMutableClientConfiguration> configuration) {

            configuration.applicationId = @"WAVphoQM8Ap3MNrtuljK7xbqnbEkP07RbfBad7x2";
            configuration.clientKey = @"2AduyVaUHqLE5yK2kj2UIAYexCk8UBlGxhNLudXC";
            configuration.server = @"https://parseapi.back4app.com";
        }];

        [Parse initializeWithConfiguration:config];
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}



@end
