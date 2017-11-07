//
//  MOBPinterestViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/6/8.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBPinterestViewController.h"

@implementation MOBPinterestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypePinterest;
    self.title = @"Pinterest";
    shareIconArray = @[@"imageIcon"];
    shareTypeArray = @[@"图片"];
    selectorNameArray = @[@"shareImage"];
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
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                     title:nil
                                      type:SSDKContentTypeImage];
    
    
    //平台定制
//        [parameters SSDKSetupPinterestParamsByImage:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
//                                               desc:@"Share SDK"
//                                                url:[NSURL URLWithString:@"http://www.mob.com"]
//                                          boardName:@"aadaa11111"];
    [self shareWithParameters:parameters];
}
@end
