//
//  AppDelegate.m
//  LightTabBarViewController
//
//  Created by Duan  on 2/15/15.
//  Copyright (c) 2015 Duan . All rights reserved.
//
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "AppDelegate.h"
#import "LightTabBarViewController.h"
#import "FirstViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [self setupTabBarViewController];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (UIViewController *)setupTabBarViewController {
    UIViewController *firstViewController = [[FirstViewController alloc] init];
    firstViewController.view.backgroundColor = [UIColor redColor];
    UIViewController *firstNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    firstViewController.title = @"First";
    
    UIViewController *secondViewController = [[FirstViewController alloc] init];
    secondViewController.view.backgroundColor = [UIColor yellowColor];
    UIViewController *secondNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    secondViewController.title = @"Second";
    
    UIViewController *thirdViewController = [[FirstViewController alloc] init];
    thirdViewController.view.backgroundColor = [UIColor greenColor];
    UIViewController *thirdNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:thirdViewController];
    thirdViewController.title = @"Third";
    
    UIViewController *fourthViewController = [[FirstViewController alloc] init];
    fourthViewController.view.backgroundColor = [UIColor blueColor];
    UIViewController *fourthNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:fourthViewController];
    fourthViewController.title = @"Fourth";
    
    UIViewController *fifthViewController = [[FirstViewController alloc] init];
    fifthViewController.view.backgroundColor = [UIColor purpleColor];
    UIViewController *fifthNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:fifthViewController];
    fifthViewController.title = @"Fifth";
    
    NSArray *viewControllerArray = [NSArray arrayWithObjects:firstNavigationController, secondNavigationController, thirdNavigationController, fourthNavigationController, fifthNavigationController, nil];
    NSArray *imageArray = [NSArray arrayWithObjects:@{@"normal" : @"item_session", @"selected" : @"item_session_select", @"title" : @"Session"},
                                                   @{@"normal" : @"item_contact",  @"selected" : @"item_contact_select", @"title" : @"Contact"},
                                                   @{@"normal" : @"item_nearby",  @"selected" : @"item_nearby_select", @"title" : @"Nearby"},
                                                   @{@"normal" : @"item_discover",  @"selected" : @"item_discover_select", @"title" : @"Discover"},
                                                   @{@"normal" : @"item_setting",  @"selected" : @"item_setting_select", @"title" : @"Setting"}, nil];
    LightTabBarViewController *lightTabBarViewController = [[LightTabBarViewController alloc] initWithControllerArray:viewControllerArray andImageArray:imageArray];
    
    
    
    return lightTabBarViewController;
}

- (void)setupTabBarImages {

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
