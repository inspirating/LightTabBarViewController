//
//  LightTabBarViewController.m
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

#import "LightTabBarViewController.h"

@interface LightTabBarViewController ()

@end

@implementation LightTabBarViewController {
    NSInteger selectedIndex;
}

static LightTabBarViewController *instance = nil;

- (instancetype)initWithControllerArray:(NSArray *)viewControllers andImageArray:(NSArray *)images{
    
    if (self = [super init]) {
        _viewControllerArray = viewControllers;
        _imageArray = images;
        instance = self;
    }
    
    return self;
}

+ (LightTabBarViewController *)instance {
    return instance;
}

- (void)setTabBarHide:(BOOL)hiddenFlag animated:(BOOL)animatedFlag {
    
    __weak LightTabBarViewController *weakSelf = self;
    
    void (^block)() = ^{
        CGSize vcSize = weakSelf.view.bounds.size;
        CGFloat tabBarToShowStartY = vcSize.height;
        CGFloat viewToShowHeight = vcSize.height;
        CGFloat tabBarHeight = 50;
        
        // go to be show
        if (hiddenFlag == false) {
            tabBarToShowStartY = vcSize.height - tabBarHeight;
            viewToShowHeight -= tabBarHeight;
            weakSelf.tabBar.hidden = NO;
        }
        
        [weakSelf.tabBar setFrame:CGRectMake(0, tabBarToShowStartY, vcSize.width, tabBarHeight)];
        [[weakSelf.viewControllerArray[selectedIndex] view] setFrame:CGRectMake(0, 0, vcSize.width, viewToShowHeight)];
    };
    
    void (^completion)(BOOL) = ^(BOOL finished) {
        
        if (hiddenFlag) {
            [[weakSelf.viewControllerArray[selectedIndex] view] setFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
        } else {
            [[weakSelf.viewControllerArray[selectedIndex] view] setFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-50)];
        }
        
        [weakSelf.tabBar setHidden:hiddenFlag];
    };
    
    if (animatedFlag) {
        [UIView animateWithDuration:0.2 animations:block completion:completion];
    } else {
        block();
        completion(hiddenFlag);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tabBar = [[LightTabBar alloc] init];
    _tabBar.frame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height-50, [[UIScreen mainScreen] bounds].size.width, 50);
    [_tabBar setItems:_imageArray withStartYOfImage:8];
    _tabBar.backgroundColor = [UIColor blackColor];
    _tabBar.delegate = self;
    
    [self.view addSubview:_tabBar];
    
    selectedIndex = 0;
    
    [_tabBar setSelectedItem:selectedIndex];
    [self selectButtonAtIndex:selectedIndex];
}

- (void)selectButtonAtIndex:(NSInteger)index {
    [_tabBar unSelectedItem:selectedIndex];
    UINavigationController *nvc = _viewControllerArray[selectedIndex];
    
    [_viewControllerArray[selectedIndex] willMoveToParentViewController:nil];
    [[_viewControllerArray[selectedIndex] view] removeFromSuperview];
    [_viewControllerArray[selectedIndex] removeFromParentViewController];
    
    selectedIndex = index;
    [_tabBar setSelectedItem:index];
    
    nvc = _viewControllerArray[selectedIndex];
    
    [self addChildViewController:_viewControllerArray[selectedIndex]];
    [[_viewControllerArray[selectedIndex] view] setFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-50)];
    [self.view addSubview:[_viewControllerArray[selectedIndex] view]];
    [_viewControllerArray[selectedIndex] didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
