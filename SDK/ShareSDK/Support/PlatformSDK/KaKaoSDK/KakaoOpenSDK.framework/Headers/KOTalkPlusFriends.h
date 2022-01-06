/*
 * Copyright 2019 Kakao Corp.
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

NS_ASSUME_NONNULL_BEGIN

/// 사용자와 카카오톡 채널과의 관계
typedef NS_ENUM(NSUInteger, KOPlusFriendRelation) {
    /// 추가된 상태
    KOPlusFriendRelationAdded,
    /// 관계없음
    KOPlusFriendRelationNone,
    /// 알수없음 (default)
    KOPlusFriendRelationUnknown,
    /// 차단된 상태
    KOPlusFriendRelationBlocked,
};

@class KOPlusFriend;

/// 카카오톡 채널 추가상태 API 응답 클래스
@interface KOTalkPlusFriends : NSObject

/// @abstract 사용자의 고유 아이디
/// @see [KOUserMe ID]
@property (nonatomic, readonly, nullable) NSString *userId;

/// @abstract 요청한 사용자와 카카오톡 채널과의 상태 정보 목록
/// @see KOPlusFriend
@property (nonatomic, readonly, nullable) NSArray<KOPlusFriend *> *plusFriends;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

/// 카카오톡 채널 정보 클래스
@interface KOPlusFriend : NSObject

/// @abstract 카카오톡 채널 uuid
@property (nonatomic, readonly, nullable) NSString *uuid;

/// @abstract 카카오톡 채널 public ID
@property (nonatomic, readonly, nullable) NSString *publicId;

/// @abstract 채널관의 관계. 추가된 상태/관계없음/알수없음
/// @see KOPlusFriendRelation
@property (nonatomic, readonly) KOPlusFriendRelation relation;

/// relation 변경 시각 (현재는 ADDED 상태의 친구 추가시각만 의미)
/// @discussion RFC3339 internet date/time format (yyyy-mm-dd'T'HH:mm:ss'Z', yyyy-mm-dd'T'HH:mm:ss'+'HH:mm, yyyy-mm-dd'T'HH:mm:ss'-'HH:mm 가능)
@property (nonatomic, readonly, nullable) NSDate *updatedAt;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
