//
//  AppDelegate.m
//  PodsDemo
//
//  Created by 江雪 on 16/1/26.
//  Copyright © 2016年 Bus100_SDK. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarController.h"

//static char szListenTabbarViewMove[] = "listenTabViewMove";

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    [NSThread sleepForTimeInterval:1.0]; // 休眠1秒
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 根控制器
    BaseTabBarController *tabBarController = [[BaseTabBarController alloc] init];
    
    tabBarController.delegate = self;
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    
    self.screenshotView = [[ScreenShotView alloc] initWithFrame:CGRectMake(0, 0, self.window.bounds.size.width, self.window.bounds.size.height)];
    [self.window insertSubview:_screenshotView atIndex:0];
//    [self.window.rootViewController.view addObserver:self forKeyPath:@"transform" options:NSKeyValueObservingOptionNew context:szListenTabbarViewMove];
    
    self.screenshotView.hidden = YES;
    
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    // 未读消息的个数
    viewController.tabBarItem.badgeValue = @"0";
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
