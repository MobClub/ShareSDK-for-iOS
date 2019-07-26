//
//  MOBInstapaperViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/6/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBInstapaperViewController.h"

@implementation MOBInstapaperViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeInstapaper;
    self.title = @"Instapaper";
    shareIconArray = @[@"webURLIcon"];
    shareTypeArray = @[@"链接"];
    selectorNameArray = @[@"shareLink"];
}


/**
 分享链接
 */
- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                     title:SHARESDKDEMO_TITLE
                                      type:SSDKContentTypeWebPage];
    //平台定制
//    [parameters SSDKSetupInstapaperParamsByUrl:[NSURL URLWithString:@"http://www.mob.com"]
//                                         title:@"Share SDK"
//                                          desc:@"Share SDK Link Desc"
//                                       content:@"Share SDK Link Desc"
//                           isPrivateFromSource:NO
//                                      folderId:0
//                               resolveFinalUrl:YES];
    [self shareWithParameters:parameters];
}

@end
