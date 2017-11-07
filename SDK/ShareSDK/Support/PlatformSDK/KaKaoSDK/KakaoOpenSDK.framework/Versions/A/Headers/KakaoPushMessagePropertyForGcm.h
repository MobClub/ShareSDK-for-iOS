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
 @header KakaoPushMessagePropertyForGcm.h
 Push 전송 시 보낼 메시지 객체 (Android 파트)
 */

/*!
 @class KakaoPushMessagePropertyForGcm
 @discussion Push 전송 시 보낼 메시지 객체 (Android 파트)
 */
@interface KakaoPushMessagePropertyForGcm : NSObject

/*!
 @class collapse
 @discussion 푸시 메시지 구분자. 같은 값을 가지는 푸시 알림이 여러 개일 때 마지막 하나만 사용자 기기로 전송.(GCM 공식 문서 참조)
 */
@property(nonatomic, readonly) NSString *collapse;

/*!
 @class delayWhileIdle
 @discussion false(NO)일 경우, 사용자 기기의 idle 상태 상관없이 즉시 푸시 알림 전송. 반대로 true(YES)로 하면 GCM 서버 상태에 따라 어느 정도 시간이 지난 후 푸시 알림이 전송됨
 */
@property(nonatomic, readonly) BOOL delayWhileIdle;

/*!
 @class returnUrl
 @discussion 푸시 알림의 전송 실패에 대한 피드백 처리가 필요할 때 사용
 */
@property(nonatomic, readonly) NSString *returnUrl;

/*!
 @class customField
 @discussion 메시지 외 앱에 부가적인 정보를 전달하고자 할 때 사용
 */
@property(nonatomic, readonly) NSDictionary *customField;

- (id)initWithCollapse:(NSString *)collapse
        delayWhileIdle:(BOOL)delayWhileIdle
             returnUrl:(NSString *)returnUrl
           customField:(NSDictionary *)customField;

- (NSDictionary *)asDictionary;

@end
