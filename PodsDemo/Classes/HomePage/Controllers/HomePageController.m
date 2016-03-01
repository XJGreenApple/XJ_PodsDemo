//
//  HomePageController.m
//  PodsDemo
//
//  Created by 江雪 on 16/1/27.
//  Copyright © 2016年 Bus100_SDK. All rights reserved.
//

#import "HomePageController.h"
#import "BarCodeVC.h"

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kCodeImageViewHeight  [UIScreen mainScreen].bounds.size.width

@interface HomePageController ()

@property (nonatomic, strong) UIImageView *codeImageView;

@end

@implementation HomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupController];
    [self.view addSubview:self.codeImageView];
    // Do any additional setup after loading the view.
}

- (UIImageView *)codeImageView
{
    NSLog(@"%f  %f  %f",kCodeImageViewHeight,kScreenHeight,(kScreenHeight - kCodeImageViewHeight) / 2);
    if (nil == _codeImageView) {
        _codeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,(kScreenHeight - kCodeImageViewHeight) / 2 - 64, kCodeImageViewHeight, kCodeImageViewHeight)];
        _codeImageView.backgroundColor = [UIColor redColor];
        _codeImageView.image = [self generateQRCode:@"123456" width:kCodeImageViewHeight+ 10 height:kCodeImageViewHeight + 10];
        _codeImageView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture)];
        [_codeImageView addGestureRecognizer:tap];
        
    }
    
    return _codeImageView;
}

- (void)tapGesture
{
    BarCodeVC *tempVC = [[BarCodeVC alloc] init];
    [self.navigationController pushViewController:tempVC animated:YES];
}

- (UIImage *)generateQRCode:(NSString *)code width:(CGFloat)width height:(CGFloat)height {
    
    // 生成二维码图片
    CIImage *qrcodeImage;
    NSData *data = [code dataUsingEncoding:NSISOLatin1StringEncoding allowLossyConversion:false];
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    [filter setValue:data forKey:@"inputMessage"];
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];
    qrcodeImage = [filter outputImage];
    
    // 消除模糊
    CGFloat scaleX = width / qrcodeImage.extent.size.width; // extent 返回图片的frame
    CGFloat scaleY = height / qrcodeImage.extent.size.height;
    CIImage *transformedImage = [qrcodeImage imageByApplyingTransform:CGAffineTransformScale(CGAffineTransformIdentity, scaleX, scaleY)];
    
    return [UIImage imageWithCIImage:transformedImage];
}


- (void)setupController
{
    [super setupController];
    self.navigationItem.title = @"首页";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
