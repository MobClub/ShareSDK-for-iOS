//
//  MOBFlickrViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/6/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBFlickrViewController.h"

@implementation MOBFlickrViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeFlickr;
    self.title = @"Flickr";
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
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
//    [parameters SSDKSetupFlickrParamsByText:@"Share SDK"
//                                      image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                      title:@"Share SDK"
//                                       tags:nil
//                                   isPublic:NO
//                                   isFriend:NO
//                                   isFamily:NO
//                                safetyLevel:1
//                                contentType:1
//                                     hidden:1];
    [self shareWithParameters:parameters];
}
@end
