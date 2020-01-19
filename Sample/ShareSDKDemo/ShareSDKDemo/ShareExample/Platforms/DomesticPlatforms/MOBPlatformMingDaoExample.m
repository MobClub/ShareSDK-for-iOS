//
//  MOBPlatformMingDaoExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/20.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformMingDaoExample.h"

@implementation MOBPlatformMingDaoExample

- (void)shareLink
{
    //webpage image需为 网络图片
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                     title:SHARESDKDEMO_TITLE
                                      type:SSDKContentTypeWebPage];
    
    //平台定制
//    [parameters SSDKSetupMingDaoParamsByText:@"Share SDK"
//                                       image:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
//                                         url:[NSURL URLWithString:@"http://www.mob.com"]
//                                       title:@"Share SDK"
//                                        type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}


+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeMingDao;
}
@end
