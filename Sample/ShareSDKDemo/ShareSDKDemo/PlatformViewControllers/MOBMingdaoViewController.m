//
//  MOBMingdaoViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/6/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBMingdaoViewController.h"

@implementation MOBMingdaoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeMingDao;
    self.title = @"明道";
    shareIconArray = @[@"webURLIcon"];
    shareTypeArray = @[@"链接"];
    selectorNameArray = @[@"shareLink"];
}

- (void)shareLink
{
    //webpage image需为 网络图片
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeWebPage];
    
    //平台定制
//    [parameters SSDKSetupMingDaoParamsByText:@"Share SDK"
//                                       image:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
//                                         url:[NSURL URLWithString:@"http://www.mob.com"]
//                                       title:@"Share SDK"
//                                        type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

@end
