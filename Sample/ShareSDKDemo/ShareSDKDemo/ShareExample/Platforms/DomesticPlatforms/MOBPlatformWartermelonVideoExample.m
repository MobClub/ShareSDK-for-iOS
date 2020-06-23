//
//  MOBPlatformWartermelonVideoExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2020/5/15.
//  Copyright © 2020 mob. All rights reserved.
//

#import "MOBPlatformWartermelonVideoExample.h"

@implementation MOBPlatformWartermelonVideoExample


- (void)shareVideo{
    NSURL *url_1 = [[NSBundle mainBundle] URLForResource:@"cat" withExtension:@"mp4"];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"123"
                                    images:nil
                                       url:url_1
                                     title:nil
                                      type:SSDKContentTypeVideo];
    [self shareWithParameters:parameters];
}

+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeWatermelonVideo;
}
@end
