/**
* Copyright 2015-2016 Kakao Corp.
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
 @header KakaoTalkLinkObject.h
 카카오 링크를 호출할때 필요한 내용을 담을 객체입니다.
 아래 4가지 형태의 객체를 생성할 수 있습니다.
 1. 레이블형 : 일반 텍스트를 사용합니다.
 2. 이미지형 : 메시지에 보여줄 이미지의 url을 지정할 수 있습니다.
 3. 링크형 : 메시지에 사용자가 클릭해여 Action을 취할 수 있는 링크를 만들 수 있습니다.
 4. 버튼형 : 링크형과 거의 유사하지만 하이퍼 링크를 버튼이미지로 표시할 수 있습니다.
 */

@class KakaoTalkLinkAction;

/*!
 * @class KakaoTalkLinkObject
 * @abstract 카카오톡 LINK 를 호출할떄 필요한 내용을 포함하는 객체
 */
@interface KakaoTalkLinkObject : NSObject

@property(nonatomic, readonly) NSString *type;
@property(nonatomic, readonly) NSString *text;
@property(nonatomic, readonly) NSString *src;
@property(nonatomic, readonly) int width;
@property(nonatomic, readonly) int height;
@property(nonatomic, copy) NSString *disptype;
@property(nonatomic, readonly) NSString *actiontype;
@property(nonatomic, readonly) NSArray<KakaoTalkLinkAction *> *actions;

/*!
 @abstract 레이블 객체를 생성한다.
 @param text 메시지에 표시될 text content
 */
+ (KakaoTalkLinkObject *)createLabel:(NSString *)text;

/*!
 @abstract 이미지 객체를 생성한다.
 @param src 메시지에 표시될 image 의 url 정보. <br>ex) "http://abcd.com/thumb.png"
 @param width 이미지의 가로 픽셀 사이즈.
 @param height 이미지의 세로 픽셀 사이즈.
 */
+ (KakaoTalkLinkObject *)createImage:(NSString *)src
                               width:(int)width
                              height:(int)height;

/*!
 @abstract 웹용 링크 객체를 생성한다.
 @param text 링크에 표시될 텍스트
 @param url 이동할 web url
 */
+ (KakaoTalkLinkObject *)createWebLink:(NSString *)text
                                   url:(NSString *)url;

/*!
 @abstract 앱용 링크 객체를 생성한다.
 @param text 링크에 표시될 텍스트
 @param actions array of {@link KakaoTalkLinkAction}
 */
+ (KakaoTalkLinkObject *)createAppLink:(NSString *)text
                               actions:(NSArray<KakaoTalkLinkAction *> *)actions;


/*!
 @abstract 웹용 버튼 객체를 생성한다.
 @param text 버튼에 표시될 텍스트
 @param url 이동할 web url
 */
+ (KakaoTalkLinkObject *)createWebButton:(NSString *)text
                                     url:(NSString *)url;

/*!
 @abstract 앱용 버튼 객체를 생성한다.
 @param text 버튼에 표시될 텍스트
 @param actions array of {@link KakaoTalkLinkAction}
 */
+ (KakaoTalkLinkObject *)createAppButton:(NSString *)text
                                 actions:(NSArray<KakaoTalkLinkAction *> *)actions;
@end
