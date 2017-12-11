//
//  MOBMessengerViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBLineViewController.h"

@interface MOBLineViewController ()

@end

@implementation MOBLineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeLine;
    self.title = @"Line";
    shareIconArray = @[@"textIcon",@"imageIcon"];
    shareTypeArray = @[@"文字",@"图片"];
    selectorNameArray = @[@"shareText",@"shareImage"];
}


/**
 分享文字
 */
-(void)shareText
{
    //通用参数设置
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
//    [parameters SSDKSetupLineParamsByText:"Share SDK"
//                                    image:nil
//                                     type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

/**
 分享图片
 */
- (void)shareImage
{
    //只支持单张图片
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"//[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
//    [parameters SSDKSetupLineParamsByText:nil
     //                                    [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
     //                                     type:SSDKContentTypeText]
    [self shareWithParameters:parameters];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
