//
//  DetailViewController.m
//  LightTabBarViewController
//
//  Created by Duan  on 2/15/15.
//  Copyright (c) 2015 Duan . All rights reserved.
//

#import "DetailViewController.h"
#import "LightTabBarViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated {
    [[LightTabBarViewController instance] setTabBarHide:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[LightTabBarViewController instance] setTabBarHide:NO animated:YES];
}

@end
