//
//  LightTabBar.m
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

#import "LightTabBar.h"

@implementation LightTabBar {
}


- (instancetype)init {

    if (self = [super init]) {
        
    }
    
    return self;
}

- (void)setItems:(NSArray *)array withStartYOfImage:(NSInteger)start_y {
    CGFloat width = [[UIScreen mainScreen] bounds].size.width/array.count;
    for (NSDictionary *dict in array) {
        NSLog(@"%@ %@", dict[@"normal"], dict[@"selected"]);
        UIButton *item = [[UIButton alloc] initWithFrame:CGRectMake([array indexOfObject:dict]*width, 0, width, 50)];
        UIImage *normal = [UIImage imageNamed:dict[@"normal"]];
        [item setImage:[UIImage imageNamed:dict[@"normal"]] forState:UIControlStateNormal];
        [item setImage:[UIImage imageNamed:dict[@"selected"]] forState:UIControlStateHighlighted];
        [item setImage:[UIImage imageNamed:dict[@"selected"]] forState:UIControlStateSelected];
        item.backgroundColor = [UIColor clearColor];
        [item addTarget:self action:@selector(butnAction:) forControlEvents:UIControlEventTouchUpInside];
        item.imageEdgeInsets = UIEdgeInsetsMake(start_y, (width - normal.size.width)/2, 50 - normal.size.height - start_y, (width - normal.size.width)/2);
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 35, width, 15)];
        titleLabel.text = dict[@"title"];
        titleLabel.font = [UIFont systemFontOfSize:11.0];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor grayColor];
        [item addSubview:titleLabel];
        
        [self addSubview:item];
    }
}

- (void)butnAction:(id)sender {
    [self.delegate selectButtonAtIndex:[[self subviews] indexOfObject:sender]];
}

- (void)setSelectedItem:(NSInteger)index {
    UIButton * butn = (UIButton *)[self subviews][index];
    butn.selected = YES;
}

- (void)unSelectedItem:(NSInteger)index {
    UIButton * butn = (UIButton *)[self subviews][index];
    butn.selected = NO;
}

@end
