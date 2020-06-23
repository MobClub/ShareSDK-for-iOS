//
//  MOBPlatformKuaiShouExapmle.m
//  ShareSDKDemo
//
//  Created by maxl on 2020/5/15.
//  Copyright © 2020 mob. All rights reserved.
//

#import "MOBPlatformKuaiShouExapmle.h"

@implementation MOBPlatformKuaiShouExapmle
+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeKuaiShou;
}

- (void)shareImage{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:@[[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"],[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]]//SHARESDKDEMO_IMAGE_STRING //[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //    [parameters SSDKEnableExtensionShare];
    
    
    //平台定制
    //    [parameters SSDKSetupQQParamsByText:@"Share SDK"
    //                                  title:nil
    //                                    url:nil
    //                          audioFlashURL:nil
    //                          videoFlashURL:nil
    //                             thumbImage:nil
    //                                 images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                   type:SSDKContentTypeImage
    //                     forPlatformSubType:SSDKPlatformSubTypeQQFriend];
    
    [self shareWithParameters:parameters];
}


- (void)shareVideo{
    NSURL *url_1 = [[NSBundle mainBundle] URLForResource:@"cat" withExtension:@"mp4"];
//    NSData *data = [NSData dataWithContentsOfURL:url_1];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"123" images:nil url:url_1 title:nil type:SSDKContentTypeVideo];
    [self shareWithParameters:parameters];
}
@end
