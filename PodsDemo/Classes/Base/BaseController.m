//
//  BaseController.m
//  XunBuy
//
//  Created by wujianming on 16/1/6.
//  Copyright © 2016年 kimee. All rights reserved.
//

#import "BaseController.h"
#import "AFNetworking.h"

@interface BaseController ()

@property (nonatomic, strong) UIBarButtonItem *xb_rightButton;

@end

@implementation BaseController

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
    self.view.backgroundColor              = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = self.xb_rightButton;
}

- (void)setupRightButtonWithTitle:(NSString *)title iconName:(NSString *)name
{
    [self.xb_button setTitle:title forState:UIControlStateNormal];
    [self.xb_button setTitleColor:[UIColor colorWithRed:87/255.0 green:148/255.0 blue:125/255.0 alpha:1] forState:UIControlStateNormal];
    [self.xb_button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    self.xb_button.titleLabel.font = [UIFont boldSystemFontOfSize:15.0];
    [self.xb_button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [self.xb_button setImage:[UIImage imageNamed:name] forState:UIControlStateHighlighted];
    [self.xb_button setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    [self.xb_button setImageEdgeInsets:UIEdgeInsetsMake(0, 70, -5, 0)];
}

#pragma pravite methods

- (void)rightButtonDidClick:(UIButton *)button
{
    if (self.xb_rightButtonCallBack) {
        _xb_rightButtonCallBack();
    }
}

#pragma mark - setters

- (UIBarButtonItem *)xb_rightButton
{
    if (!_xb_rightButton) {
        _xb_button                  = [UIButton buttonWithType:UIButtonTypeCustom];
        _xb_button.frame                      = CGRectMake(0, 0, 80, 30);
        _xb_button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _xb_rightButton                = [[UIBarButtonItem alloc] initWithCustomView:_xb_button];
        
        [_xb_button addTarget:self action:@selector(rightButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _xb_rightButton;
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com