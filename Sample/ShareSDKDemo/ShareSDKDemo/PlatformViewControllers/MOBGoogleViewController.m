//
//  MOBGoogle+ViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/5/26.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBGoogleViewController.h"

@interface MOBGoogleViewController ()

@end

@implementation MOBGoogleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeGooglePlus;
    self.title = @"Google+";
    shareIconArray = @[@"textIcon",@"webURLIcon"];
    shareTypeArray = @[@"文字",@"链接"];
    selectorNameArray = @[@"shareText",@"shareWebPage"];
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
//    [parameters SSDKSetupGooglePlusParamsByText:@"Share SDK"
//                                            url:nil
//                                           type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

/**
 分享链接
 */
- (void)shareWebPage
{
    //只支持单张图片
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
//    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
//                                    images:nil
//                                       url:[NSURL URLWithString:@"http://sharesdk.mob.com/"]
//                                     title:@"Share SDK"
//                                      type:SSDKContentTypeWebPage];
    //平台定制
    [parameters SSDKSetupGooglePlusParamsByText:@"Share SDK"
                                            url:[NSURL URLWithString:@"http://sharesdk.mob.com/"]
                                           type:SSDKContentTypeWebPage];
    [self shareWithParameters:parameters];
}

@end
