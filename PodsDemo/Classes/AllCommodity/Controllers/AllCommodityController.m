//
//  AllCommodityController.m
//  XunBuy
//
//  Created by wujianming on 16/1/5.
//  Copyright © 2016年 kimee. All rights reserved.
//  所有商品控制器

#import "AllCommodityController.h"

@interface AllCommodityController ()

@end

@implementation AllCommodityController

#pragma mark - life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - private methods

- (void)setupController
{
    [super setupController];
    self.navigationItem.title = @"所有商品";
    
    [self.xb_button setImage:[UIImage imageNamed:@"search_bt_bg_unselect"] forState:UIControlStateNormal];
    [self.xb_button setImage:[UIImage imageNamed:@"search_bt_bg_select"] forState:UIControlStateHighlighted];
    
    WS(weakSelf)
    self.xb_rightButtonCallBack = ^() { // 导航右键回调
        xbLog(@"%@-rightButtonDidClick", NSStringFromClass([weakSelf class]));
    };
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com