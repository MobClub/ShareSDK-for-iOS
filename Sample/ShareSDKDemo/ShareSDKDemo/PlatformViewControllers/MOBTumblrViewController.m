//
//  MOBMessengerViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBTumblrViewController.h"

@interface MOBTumblrViewController ()

@end

@implementation MOBTumblrViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeTumblr;
    self.title = @"Tumblr";
    shareIconArray = @[@"textIcon",@"imageIcon"];
    shareTypeArray = @[@"文字",@"图片"];
    selectorNameArray = @[@"shareText",@"shareImage"];
}


/**
 授权
 */
- (void)authAct
{
    [super authAct];
}

/**
 分享文字
 */
-(void)shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
//    [parameters SSDKSetupTumblrParamsByText:@"Share SDK"
//                                      image:nil
//                                        url:nil
//                                      title:nil
//                                   blogName:nil
//                                       type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

/**
 分享图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
//    [parameters SSDKSetupTumblrParamsByText:nil
//                                      image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                        url:nil
//                                      title:@"Share SDK"
//                                   blogName:nil
//                                       type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
