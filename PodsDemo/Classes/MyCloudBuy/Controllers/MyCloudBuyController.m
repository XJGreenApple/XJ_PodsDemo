//
//  MyCloudBuyController.m
//  XunBuy
//
//  Created by wujianming on 16/1/6.
//  Copyright © 2016年 kimee. All rights reserved.
//  我得云购控制器

#import "MyCloudBuyController.h"

@interface MyCloudBuyController ()

@end

@implementation MyCloudBuyController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - private methods

- (void)setupController
{
    [super setupController];
    self.navigationItem.title = @"我的云购";
    
    [self.xb_button setImage:[UIImage imageNamed:@"MyCloud_setting_unselect"] forState:UIControlStateNormal];
    [self.xb_button setImage:[UIImage imageNamed:@"MyCloud_setting_select"] forState:UIControlStateHighlighted];
    
    WS(weakSelf)
    self.xb_rightButtonCallBack = ^() { // 导航右键回调
        xbLog(@"%@-rightButtonDidClick", NSStringFromClass([weakSelf class]));
    };
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com