/*
 * Copyright 2015 Kakao Corp.
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

#import "KakaoPushMessagePropertyForApns.h"
#import "KakaoPushMessagePropertyForFcm.h"

/// Push 전송 시 보낼 메시지 객체
@interface KakaoPushMessageObject : NSObject

/// @abstract iOS 기기에 보낼 메시지
@property(nonatomic, readonly) KakaoPushMessagePropertyForApns *forApns;

/// @abstract Android 기기에 보낼 메시지
@property(nonatomic, readonly) KakaoPushMessagePropertyForFcm *forFcm;

- (id)initWithApnsProperty:(KakaoPushMessagePropertyForApns *)forApns
               fcmProperty:(KakaoPushMessagePropertyForFcm *)forFcm;

- (NSDictionary *)asDictionary;

@end

