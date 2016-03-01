//
//  ViewController.m
//  PodsDemo
//
//  Created by 江雪 on 16/1/26.
//  Copyright © 2016年 Bus100_SDK. All rights reserved.
//

#import "ViewController.h"

//#import "AFNetworking.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
     NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    AFHTTPSessionManager *mananger = [AFHTTPSessionManager manager];
    
    NSString *tempStr = @"http://app.84100.com/service-mobile/interface?";
    
    [mananger POST:tempStr parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
