//
//  MOBCopyViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/5/25.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBCopyViewController.h"

@interface MOBCopyViewController ()

@end

@implementation MOBCopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    platformType = SSDKPlatformTypeCopy;
    self.title = @"拷贝";
    shareIconArray = @[@"textIcon",@"imageIcon",@"webURLIcon"];
    shareTypeArray = @[@"文字",@"图片",@"链接"];
    selectorNameArray = @[@"shareText",@"shareImage",@"shareWebpage"];
}

/**
 拷贝文字
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
//    [parameters SSDKSetupCopyParamsByText:@"Share SDK"
//                                   images:nil
//                                      url:nil
//                                     type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

/**
 拷贝图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
    //    [parameters SSDKSetupCopyParamsByText:nil
    //                                   images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                      url:nil
    //                                     type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}


- (void)shareWebpage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:nil
                                       url:[NSURL URLWithString:@"https://www.mob.com"]
                                     title:nil
                                      type:SSDKContentTypeWebPage];
    //平台定制
//    [parameters SSDKSetupCopyParamsByText:nil
//                                   images:nil
//                                      url:[NSURL URLWithString:@"https://www.mob.com"]
//                                     type:SSDKContentTypeWebPage];
    [self shareWithParameters:parameters];
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
