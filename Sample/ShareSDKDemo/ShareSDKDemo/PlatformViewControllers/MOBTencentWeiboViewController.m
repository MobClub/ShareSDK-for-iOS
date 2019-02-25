//
//  MOBTencentWeiboViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/6/5.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBTencentWeiboViewController.h"

@interface MOBTencentWeiboViewController ()

@end

@implementation MOBTencentWeiboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    platformType = SSDKPlatformTypeTencentWeibo;
    self.title = @"腾讯微博";
    shareIconArray = @[@"textIcon",@"imageIcon"];
    shareTypeArray = @[@"文字",@"图片"];
    selectorNameArray = @[@"shareText",@"shareImage"];
}


/**
 分享文字
 */
- (void)shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
//    [parameters SSDKSetupTencentWeiboShareParamsByText:@"Share SDK"
//                                                images:nil
//                                              latitude:0
//                                              longitude:0
//                                                  type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

/**
 分享图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    
    
    //平台定制
//    [parameters SSDKSetupTencentWeiboShareParamsByText:@"Share SDK"
//                                                images:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
//                                              latitude:0
//                                             longitude:0
//                                                  type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

@end
