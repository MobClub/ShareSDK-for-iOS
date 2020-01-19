//
//  MOBPlatformAppleAccountExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/23.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformAppleAccountExample.h"
#import <AppleAccountConnector/AppleAccountConnector.h>

/**
 
1. 需要依赖AuthenticationServices.framework
2. 需要在ios
3.  只支持iOS13以上系统
 */


@implementation MOBPlatformAppleAccountExample


- (void)setup{
    //在观察者销毁时，移除监听
    [AppleAccountConnector addObserve:self isFirstAddCallBack:YES forAppleAccountLoginStateHandler:^(SSDKAppleAccountState state, SSDKUser * _Nonnull user, NSError * _Nonnull error) {
        NSString *code = user.credential.token;
        id codeInfo  = [MOBPlatformAppleAccountExample jwtDecodeWithidentifyToken:code];
        
        //其中的sub为 userinfo的uid
        /*
         
         header: 包括了key id 与加密算法
         payload:
         iss: 签发机构，苹果
         aud: 接收者，目标app
         exp: 过期时间
         iat: 签发时间
         sub: 用户id
         c_hash: 一个哈希数列，作用未知
         auth_time: 签名时间
         signature: 用于验证JWT的签名
         
         
         验证是通过利用https://appleid.apple.com/auth/keys中的公钥转换为pem解密singature，与前两项信息一样的则为通过。
         
         */
        NSLog(@"%@", codeInfo);
        
        NSLog(@"监听回调: %@  \n用户信息: %@ \n  失败信息: %@ ",@(state), user.dictionaryValue, error);
        
        if (state != SSDKAppleAccountStateAuthorized) {
            [self cancelAuth];
        }

    }];
    
    self.authHandler = ^(SSDKResponseState state, SSDKUser * _Nonnull user, NSError * _Nonnull error) {
        NSLog(@"授权回调: %@  \n用户信息: %@ \n  失败信息: %@",@(state), user.dictionaryValue, error);
    };
    self.getUserInfoHandler = ^(SSDKResponseState state, SSDKUser * _Nonnull user, NSError * _Nonnull error) {
        NSLog(@"获取用户信息回调: %@  \n用户信息: %@ \n  失败信息: %@",@(state), user.dictionaryValue, error);
    };
}


+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeAppleAccount;
}

+ (id)jwtDecodeWithidentifyToken:(NSString *)identifyToken{
    if (!identifyToken) return nil;
    NSArray * segments = [identifyToken componentsSeparatedByString:@"."];
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    info[@"header"] = [self decodeInfoWithString:segments[0]];
    info[@"payload"] = [self decodeInfoWithString:segments[1]];
    return info;
}

+ (id)decodeInfoWithString:(NSString *)encodeString{
    NSString * base64String = encodeString;
    int requiredLength = (int)(4 *ceil((float)[base64String length]/4.0));
    int nbrPaddings = requiredLength - (int)[base64String length];
    if(nbrPaddings > 0) {
        NSString * pading = [[NSString string] stringByPaddingToLength:nbrPaddings withString:@"=" startingAtIndex:0];
        base64String = [base64String stringByAppendingString:pading];
    }
    base64String = [base64String stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
    base64String = [base64String stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
    NSData * decodeData =  [NSData dataWithBase64EncodedString:base64String];
    NSString * decodeString = [decodeData utf8String];
    NSDictionary * jsonDict = [decodeString jsonObject];
    
    
    return jsonDict;
}

@end
