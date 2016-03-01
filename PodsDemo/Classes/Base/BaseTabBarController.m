//
//  BaseTabBarController.m
//  Orange
//
//  Created by JMiOSDevelop on 15/9/16.
//  Copyright (c) 2015年 teshehui. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "HomePageController.h"
#import "AllCommodityController.h"
#import "NewFindController.h"
#import "ShoppingCartController.h"
#import "MyCloudBuyController.h"


@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTabBarControllerAppearance];
    [self setupRootViewControllers];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - private methods

- (void)setupTabBarControllerAppearance
{
    // TabBar背景颜色 (没设置背景图片的时候起作用)
    [UITabBar appearance].barTintColor = [UIColor whiteColor];
    // TabBar背景图片
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"1"]];
//    [UITabBar appearance].tintColor = [UIColor colorWithRed:255/255.0 green:102/255.0 blue:0 alpha:1]; // TabBar图标及文字颜色
}

- (void)setupRootViewControllers
{
    HomePageController *homePageController = [[HomePageController alloc] init];
    BaseNavigationController *homeNavContoller = [[BaseNavigationController alloc] initWithRootViewController:homePageController];
    homeNavContoller.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页"
                                                                image:[self getOriginalImageWithName:@"tab_home_page_nomal"]
                                                        selectedImage:[self getOriginalImageWithName:@"tab_home_page_pressed"]]; // 44px@2x
    
    AllCommodityController *allCommodityController = [[AllCommodityController alloc] init];
    BaseNavigationController *commodityNavContoller = [[BaseNavigationController alloc] initWithRootViewController:allCommodityController];
    commodityNavContoller.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"所有"
                                                                image:[self getOriginalImageWithName:@"tab_product_list_nomal"]
                                                        selectedImage:[self getOriginalImageWithName:@"tab_product_list_pressed"]]; // 44px@2x
    
    NewFindController *newFindController = [[NewFindController alloc] init];
    BaseNavigationController *newFindNavContoller = [[BaseNavigationController alloc] initWithRootViewController:newFindController];
    newFindNavContoller.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"最新"
                                                                image:[self getOriginalImageWithName:@"tab_latest_ann_nomal"]
                                                        selectedImage:[self getOriginalImageWithName:@"tab_latest_ann_pressed"]]; // 44px@2x
    
    ShoppingCartController *shoppingCartController = [[ShoppingCartController alloc] init];
    BaseNavigationController *shopNavContoller = [[BaseNavigationController alloc] initWithRootViewController:shoppingCartController];
    shopNavContoller.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"购物车"
                                                                 image:[self getOriginalImageWithName:@"tab_shopping_cart_nomal"]
                                                         selectedImage:[self getOriginalImageWithName:@"tab_shopping_cart_pressed"]]; // 44px@2x
    
    MyCloudBuyController *myCloudBuyController = [[MyCloudBuyController alloc] init];
    BaseNavigationController *myCloudBuyNavContoller = [[BaseNavigationController alloc] initWithRootViewController:myCloudBuyController];
    myCloudBuyNavContoller.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的"
                                                                 image:[self getOriginalImageWithName:@"tab_my_cloud_nomal"]
                                                         selectedImage:[self getOriginalImageWithName:@"tab_my_cloud_pressed"]]; // 44px@2x
    
    
    
    self.viewControllers = [NSArray arrayWithObjects:homeNavContoller,
                            commodityNavContoller,
                            newFindNavContoller,
                            shopNavContoller,
                            myCloudBuyNavContoller,nil];
    
    // 统一设置Item标题颜色及距离
    for (UIViewController *vc in self.viewControllers) {
        [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor grayColor],
                                                NSFontAttributeName : [UIFont boldSystemFontOfSize:10.0]}
                                     forState:UIControlStateNormal]; // 设置Item未选中颜色
        [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:255/255.0 green:102/255.0 blue:0 alpha:1]}
                                     forState:UIControlStateSelected]; // 设置Item选中颜色
        [vc.tabBarItem setTitlePositionAdjustment: UIOffsetMake(0, -3)];
    }
}


- (UIImage *)getOriginalImageWithName:(NSString *)name
{
    return [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com