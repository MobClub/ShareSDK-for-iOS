/**
* Copyright 2015 Kakao Corp.
*
* Redistribution and modification in source or binary forms are not permitted without specific prior written permission.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*    http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

/*!
 @header KOAppCall.h
 카카오톡등의 카카오앱을 호출하는 클래스
 */
#import <Foundation/Foundation.h>
#import "KakaoTalkLinkObject.h"
#import "KakaoTalkLinkAction.h"

/*!
 @abstract 카카오톡등의 카카오앱을 호출하는 클래스
 */
@interface KOAppCall : NSObject

/*!
 @abstract 카카오톡 링크를 호출한다. 아래의 경우에는 아무런 동작을 하지 않는다.<br>
 1. 카카오톡이 설치되어 있지 않거나 3.9.5 버젼 미만인 경우 (The minimum requirements for KakaoTalk 3.9.5)<br>
 2. KAKAO_APP_KEY 가 plist에 등록되어 있지 않은 경우 (KAKAO_APP_KEY is not set properly in plist.)<br>
 3. 카카오 SDK 의 Custom Scheme 이 등록되어 있지 않은 경우 (URL scheme for KakaoOpenSDK is not set properly in plist.)<br>
 4. objArray가 비어있는 경우 (objArray is empty.)
 @param objArray 카카오 링크에 담을 내용. objArray 에는 KakaoTalkLinkObject 객체들을 담는다.
 */
+ (void)openKakaoTalkAppLink:(NSArray *)objArray;

/*!
 @abstract 카카오톡 링크를 호출한다. 아래의 경우에는 아무런 동작을 하지 않는다.<br>
 1. 카카오톡이 설치되어 있지 않거나 3.9.5 버젼 미만인 경우 (The minimum requirements for KakaoTalk 3.9.5)<br>
 2. KAKAO_APP_KEY 가 plist에 등록되어 있지 않은 경우 (KAKAO_APP_KEY is not set properly in plist.)<br>
 3. 카카오 SDK 의 Custom Scheme 이 등록되어 있지 않은 경우 (URL scheme for KakaoOpenSDK is not set properly in plist.)<br>
 4. objArray가 비어있는 경우 (objArray is empty.)
 @param objArray 카카오 링크에 담을 내용. objArray 에는 KakaoTalkLinkObject 객체들을 담는다.
 @param forwardable 메시지를 받은 사람이 해당 내용을 카카오톡에서 다시 전달할지의 여부. default NO.
 */
+ (void)openKakaoTalkAppLink:(NSArray *)objArray forwardable:(BOOL)forwardable;

/*!
 @abstract 카카오톡 링크를 호출할 수 있는지의 여부를 알려준다. NO 가 리턴되는 경우는 아래와 같다. 괄호 안은 NSLog로 출력되는 로그.<br>
 1. 카카오톡이 설치되어 있지 않거나 3.9.5 버젼 미만인 경우 (The minimum requirements for KakaoTalk 3.9.5)<br>
 2. KAKAO_APP_KEY 가 plist에 등록되어 있지 않은 경우 (KAKAO_APP_KEY is not set properly in plist.)<br>
 3. 카카오 SDK 의 Custom Scheme 이 등록되어 있지 않은 경우 (URL scheme for KakaoOpenSDK is not set properly in plist.)
 */
+ (BOOL)canOpenKakaoTalkAppLink;

@end
