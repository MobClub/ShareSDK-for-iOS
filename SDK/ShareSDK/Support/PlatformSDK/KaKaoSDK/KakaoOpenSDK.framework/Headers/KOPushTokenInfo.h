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

#import <Foundation/Foundation.h>

/// 푸시 토큰의 정보를 담고 있는 구조체
@interface KOPushTokenInfo : NSObject

/// @abstract 해당 사용자의 uuid
@property(nonatomic, readonly) NSString *uuid;

/// @abstract 해당 사용자의 아이디
/// @deprecated 'userId'는 더 이상 사용하지 않습니다. 'uuid'를 대신 사용하세요.
@property(nonatomic, readonly) NSString *userId DEPRECATED_MSG_ATTRIBUTE("'userId'는 더 이상 사용하지 않습니다. 'uuid'를 대신 사용하세요.");

/// @abstract 해당 사용자의 등록된 디바이스 아이디
@property(nonatomic, readonly) NSString *deviceId;

/// @abstract 푸시 토큰의 타입 "apns" 또는 "fcm"
@property(nonatomic, readonly) NSString *pushType;

/// @abstract 푸시 토큰
@property(nonatomic, readonly) NSString *pushToken;

/// @abstract 푸시 토큰의 생성 시간
@property(nonatomic, readonly) NSString *createdAt;

/// @abstract 푸시 토큰의 수정된 시간
@property(nonatomic, readonly) NSString *updatedAt;

- (id)initWithUuid:(NSString *)uuid
            UserId:(NSString *)userId
          deviceId:(NSString *)deviceId
          pushType:(NSString *)pushType
         pushToken:(NSString *)pushToken
         createdAt:(NSString *)createdAt
         updatedAt:(NSString *)updatedAt;

@end
