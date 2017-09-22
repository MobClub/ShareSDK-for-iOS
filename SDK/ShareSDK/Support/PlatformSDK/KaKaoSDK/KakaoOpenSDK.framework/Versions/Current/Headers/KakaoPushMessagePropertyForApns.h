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
 @header KakaoPushMessagePropertyForApns.h
 Push 전송 시 보낼 메시지 객체 (iOS 파트)
 */

/*!
 @class KakaoPushMessagePropertyForApns
 @discussion Push 전송 시 보낼 메시지 객체 (iOS 파트)
 */
@interface KakaoPushMessagePropertyForApns : NSObject

/*!
 * @property badgeCount
 * @abstract 앱 배치에 표시할 숫자
 */
@property(nonatomic, readonly) NSInteger badgeCount;

/*!
 * @property sound
 * @abstract 푸시 수신 시 재생할 알림음. 앱에 해당 알림음 파일이 없으면 기본 알림음 재생됨
 */

@property(nonatomic, readonly) NSString *sound;

/*!
 * @property pushAlert
 * @abstract 음소거, 알림센터에 뜨지 않는 상태로 Push 전송. 푸시 음소거 및 알림센터에 띄우지는 않되, badge 수는 바꾸고 싶을 때 사용
 */
@property(nonatomic, readonly) BOOL pushAlert;

/*!
 * @property message
 * @abstract 알림 센터에 표시할 메시지. NSString 혹은 NSDictionary가 들어감. 참조: https://developer.apple.com/library/ios/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/Chapters/ApplePushService.html
 */
@property(nonatomic, readonly) NSObject *message;

/*!
 * @property customField
 * @abstract 푸시 알림을 통해 앱 실행 시 같이 넘길 파라미터들
 */
@property(nonatomic, readonly) NSDictionary *customField;


- (id)initWithBadgeCount:(NSInteger)badgeCount
                   sound:(NSString *)sound
               pushAlert:(BOOL)pushAlert
           messageString:(NSString *)message
             customField:(NSDictionary *)customField;


- (id)initWithBadgeCount:(NSInteger)badgeCount
                   sound:(NSString *)sound
               pushAlert:(BOOL)pushAlert
       messageDictionary:(NSDictionary *)message
             customField:(NSDictionary *)customField;


- (NSDictionary *)asDictionary;

@end
