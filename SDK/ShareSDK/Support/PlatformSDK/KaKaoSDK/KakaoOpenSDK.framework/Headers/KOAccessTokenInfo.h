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

/// access token의 정보를 담고 있는 구조체
@interface KOAccessTokenInfo : NSObject

/// @abstract 해당 access token에 해당되는 사용자의 ID
@property(nonatomic, readonly, nullable) NSNumber *ID;

@property(nonatomic, readonly, nullable) NSNumber *expiresInMillis DEPRECATED_MSG_ATTRIBUTE("대신 expiresIn 을 사용해주세요.");

/// @abstract 해당 access token의 남은 만료시간. 0보다 큰 second가 반환됨
@property(nonatomic, readonly, nullable) NSNumber *expiresIn;

+ (nonnull instancetype)responseWithDictionary:(nullable NSDictionary *)dictionary;

@end
