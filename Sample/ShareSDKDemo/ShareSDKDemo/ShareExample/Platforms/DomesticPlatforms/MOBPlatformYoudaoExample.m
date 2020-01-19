//
//  MOBPlatformYoudaoExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformYoudaoExample.h"

@implementation MOBPlatformYoudaoExample

/**
 文字
 */
-(void)shareText
{
    //通用参数设置
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:nil
                                     title:SHARESDKDEMO_TITLE
                                      type:SSDKContentTypeText];
    //平台定制
//    [parameters SSDKSetupYouDaoNoteParamsByText:@"Share SDK"
//                                         images:nil
//                                          title:@"Share SDK"
//                                         source:@"MOB"
//                                         author:@"mob"
//                                       notebook:nil];
    [self shareWithParameters:parameters];
}

/**
 文字图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
//    [parameters SSDKSetupShareParamsByText:@"Share SDK"
//                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                       url:nil
//                                     title:@"Share SDK"
//                                      type:SSDKContentTypeImage];
    //平台定制
    [parameters SSDKSetupYouDaoNoteParamsByText:SHARESDKDEMO_TEXT
                                         images:SHARESDKDEMO_IMAGE_LOCALPATH
                                          title:SHARESDKDEMO_TITLE
                                         source:@"MOB"
                                         author:@"mob"
                                       notebook:nil];
    [self shareWithParameters:parameters];
}


+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeYouDaoNote;
}
@end
