//
//  BaseNavigationController.m
//  YYHealth
//
//  Created by xkun on 15/6/13.
//  Copyright (c) 2015年 xkun. All rights reserved.
//

#import "BaseNavigationController.h"
#import "AppDelegate.h"

#define DISTANCETOPOP 80

@interface BaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationController

#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // 设置主题
    [self setupNavigationControllerAppearance];
    
    // POP动画
    self.arrayScreenshot = [NSMutableArray array];
    self.panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesIng:)];
    _panGes.delegate = self;
    [self.view addGestureRecognizer:_panGes];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -- UIGestureDelegate

- (void)panGesIng:(UIPanGestureRecognizer *)panGes
{
    
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    UIViewController *rootVC = appdelegate.window.rootViewController;
    UIViewController *presentedVC = rootVC.presentedViewController;
    
    if (self.viewControllers.count == 1)
    {
        return;
    }
    if (panGes.state == UIGestureRecognizerStateBegan)
    {
        appdelegate.screenshotView.hidden = NO;
    }
    else if (panGes.state == UIGestureRecognizerStateChanged)
    {
        CGPoint pt = [panGes translationInView:self.view];
        
        if (pt.x >= 10)
        {
            rootVC.view.transform = CGAffineTransformMakeTranslation(pt.x - 10, 0);
            presentedVC.view.transform = CGAffineTransformMakeTranslation(pt.x - 10, 0);
        }
    }
    else if (panGes.state == UIGestureRecognizerStateEnded)
    {
        CGPoint pt = [panGes translationInView:self.view];
        if (pt.x >= DISTANCETOPOP)
        {
            [UIView animateWithDuration:0.3 animations:^{
                rootVC.view.transform = CGAffineTransformMakeTranslation(320, 0);
                presentedVC.view.transform = CGAffineTransformMakeTranslation(320, 0);
            } completion:^(BOOL finished) {
                [self popViewControllerAnimated:NO];
                rootVC.view.transform = CGAffineTransformIdentity;
                presentedVC.view.transform = CGAffineTransformIdentity;
                appdelegate.screenshotView.hidden = YES;
            }];
        }
        else
        {
            [UIView animateWithDuration:0.3 animations:^{
                rootVC.view.transform = CGAffineTransformIdentity;
                presentedVC.view.transform = CGAffineTransformIdentity;
                appdelegate.screenshotView.hidden = YES;
            } completion:^(BOOL finished) {
            }];
        }
    }
    
    //    [self popViewControllerAnimated:YES];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(appdelegate.window.bounds.size.width, appdelegate.window.bounds.size.height), YES, 0);
    [appdelegate.window.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.arrayScreenshot addObject:viewImage];
    
    appdelegate.screenshotView.imgView.image = viewImage;
    [super pushViewController:viewController animated:animated];
}


#pragma mark - private methods
- (void)setupNavigationControllerAppearance
{
    //设置Nav的背景色和title色
    UINavigationBar *navigationBarAppearance    = [UINavigationBar appearance];

    // 导航栏背景颜色 (没设置背景图片的时候起作用)
    navigationBarAppearance.barTintColor        = [UIColor whiteColor];
    // 导航栏背景图片
    [navigationBarAppearance setBackgroundImage:[self getImageWithColor:[UIColor whiteColor]]
                                  forBarMetrics:UIBarMetricsDefault];
    // 导航栏阴影 (只有设置了背景图片才生效)
//    [navigationBarAppearance setShadowImage:[self getImageWithColor:[UIColor clearColor]]];

    NSDictionary *textAttributes                = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:20.0],
                                                    NSForegroundColorAttributeName:[UIColor colorWithRed:99/255.0 green:99/255.0 blue:99/255.0 alpha:1]};
    navigationBarAppearance.titleTextAttributes = textAttributes; // 导航栏标题字体大小及颜色
    
    navigationBarAppearance.tintColor           = [UIColor colorWithRed:255/255.0 green:102/255.0 blue:0 alpha:1]; // 返回按钮的箭头及导航左右文字颜色

//    [[UITextField appearance] setTintColor:[UIColor orangeColor]]; //设置UITextField的光标颜色
//    [[UITextView appearance] setTintColor:[UIColor orangeColor]]; //设置UITextView的光标颜色

    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault]; //隐藏导航栏返回按钮的titile
}

- (UIImage *)getImageWithColor:(UIColor *)color
{
    CGRect aFrame = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(aFrame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, aFrame);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com