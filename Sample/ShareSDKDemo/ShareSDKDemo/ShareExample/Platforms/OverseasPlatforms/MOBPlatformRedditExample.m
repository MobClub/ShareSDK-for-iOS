//
//  MOBPlatformRedditExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/20.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformRedditExample.h"
#import <RedditConnector/RedditConnector.h>
@implementation MOBPlatformRedditExample


- (void)setup{
    [self setAuthSetting:@{@"duration":@"permanent"}];
    
    //授权设置是否返回refresh_token  请设置duration为permanent
    //[ShareSDK authorize:self.platformType settings:@{@"duration":@"permanent"} onStateChanged:nil];
    //如果有refreshtoken可以主动刷新token
//    [RedditConnector refreshAccessTokenComplete:^(NSString *accessToken, NSError *error) {
//           NSLog(@"mmmmmmmmm-===%@", accessToken);
//    }];
//    [RedditConnector refreshAccessTokenWithRefreshToken:@"151223708895-7614skuuE9TPNe5IyejisfOrgsA" complete:^(NSString *accessToken, NSError *error) {
//        NSLog(@"mmmmmmm --------%@", accessToken);
//    }];
}

+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeReddit;
}
/**
 分享文字
 */
- (void)shareText
{
    //通用参数设置
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:nil
                                     title:@"mob"
                                      type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

/**
 分享链接
 */
- (void)shareLink
{
    //通用参数设置
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:nil
                                    images:nil
                                       url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                     title:@"mob"
                                      type:SSDKContentTypeWebPage];
    [self shareWithParameters:parameters];
    
}

/**
 分享图片
 */
- (void)shareImage
{
    //通用参数设置
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:nil
                                    images:nil
                                       url:[NSURL URLWithString:SHARESDKDEMO_IMAGE_STRING]
                                     title:@"mob"
                                      type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
    
}
@end
