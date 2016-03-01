//
//  GlobalDefine.h
//  XunBuy
//
//  Created by wujianming on 15/12/31.
//  Copyright © 2015年 kimee. All rights reserved.
//

#ifndef GlobalDefine_h
#define GlobalDefine_h

// 应用API

// 日志输出宏定义
#ifdef DEBUG
#define xbLog(...) NSLog(__VA_ARGS__)// 调试状态
#else
#define xbLog(...)// 发布状态
#endif

// 设备尺寸
#define kScreen_Bounds   [[UIScreen mainScreen] bounds]
#define kScreen_Width    [[UIScreen mainScreen] bounds].size.width
#define kScreen_Height   [[UIScreen mainScreen] bounds].size.height

#define IS_IPHONE_4  (kScreen_Height == 480.0)
#define IS_IPHONE_5  (kScreen_Height == 568.0)
#define IS_IPHONE_6  (kScreen_Height == 667.0)
#define IS_IPHONE_6P (kScreen_Height == 736.0)
#define IS_IPHONE_6Above  (kScreen_Height >= 667.0) // i6以上

// 判断系统版本
#define IOS7_OR_LATER   ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending)
#define IOS7            ([[[UIDevice currentDevice] systemVersion] integerValue] >= 7)
#define IOS8            ([[[UIDevice currentDevice] systemVersion] integerValue] >= 8)
#define IOS9            ([[[UIDevice currentDevice] systemVersion] integerValue] >= 9)

// 各系统版本导航高度
#define NavBar_Height   (IOS7_OR_LATER ? 64 : 44)
#define Status_Height   (IOS7_OR_LATER ? 20 : 0)
#define TabBar_Height   49

// 判断空
#define NotNilAndNull(_ref)  (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]))

// 弱引用
#define WS(weakSelf) __weak __typeof(&*self) weakSelf = self;

// 颜色
#define UIColorFromRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

// 导航栏字体颜色
// 导航栏阴影颜色
// TabBar字体颜色


#endif /* GlobalDefine_h */
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com