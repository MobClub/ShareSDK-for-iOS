//
//  KakaoOpenSDK.h
//  KakaoOpenSDK
//
//  Created by Richard Jeon on 2018. 6. 7..
//  Copyright © 2018년 Kakaocorp. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT double KakaoOpenSDKVersionNumber;

FOUNDATION_EXPORT const unsigned char KakaoOpenSDKVersionString[];

#import <KakaoOpenSDK/KOError.h>
#import <KakaoOpenSDK/KOImages.h>
#import <KakaoOpenSDK/KOLoginButton.h>
#import <KakaoOpenSDK/KOSession.h>
#import <KakaoOpenSDK/KOUtils.h>
#import <KakaoOpenSDK/KOAgeAuthQueryStringBuilder.h>

#import <KakaoOpenSDK/KOSessionTask+UserManagementAPI.h>
#import <KakaoOpenSDK/KOSessionTask+TalkAPI.h>
#import <KakaoOpenSDK/KOSessionTask+StoryAPI.h>
#import <KakaoOpenSDK/KOSessionTask+PushAPI.h>
#import <KakaoOpenSDK/KOSessionTask+TokenAPI.h>
#import <KakaoOpenSDK/KOSessionTask+FriendAPI.h>
#import <KakaoOpenSDK/KOSessionTask+AgeAuthAPI.h>
#import <KakaoOpenSDK/KOSessionTask+AppFriendAPI.h>

#define KAKAO_SDK_IOS_VERSION_STRING    @"1.9.0"
