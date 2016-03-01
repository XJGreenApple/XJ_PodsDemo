//
//  BaseController.h
//  XunBuy
//
//  Created by wujianming on 16/1/6.
//  Copyright © 2016年 kimee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^XB_rightButtonBlock)();

@interface BaseController : UIViewController
/** 导航右键*/
@property (nonatomic, strong) UIButton *xb_button;

/** 导航右键事件回调*/
@property (nonatomic, copy) XB_rightButtonBlock xb_rightButtonCallBack;

- (void)setupController;
- (void)setupRightButtonWithTitle:(NSString *)title iconName:(NSString *)name;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com