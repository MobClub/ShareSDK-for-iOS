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
#import "KOUserInfo.h"
#import "KOSession.h"

NS_ASSUME_NONNULL_BEGIN

/// 카카오톡 사용자의 디바이스 OS 타입
/// @discussion **제휴를 통해 권한이 부여된 특정 앱에서만 사용 가능합니다.*
typedef NS_ENUM(NSInteger, KOOSPropertyType) {
    /// 알 수 없음
    KOOSPropertyTypeUnknown = 0,
    /// ios
    KOOSPropertyTypeIOS = 1,
    /// 안드로이드
    KOOSPropertyTypeAndroid = 2
};

/// 친구 관계
/// @discussion **제휴를 통해 권한이 부여된 특정 앱에서만 사용 가능합니다.*
typedef NS_ENUM(NSInteger, KORelationValue) {
    /// 친구인 상태
    KORelationValueFriend = 0,
    /// 친구가 아닌 상태
    KORelationValueNotFriend = 1,
    /// 친구인지 아닌지 알 수 없는 상태 (카카오톡 친구를 요청 했을 때, 카카오스토리 친구 관계를 알 수 없게 된다.)
    KORelationValueNotAvailable = 2
};

extern NSString* convertOSPropertyTypeString(KOOSPropertyType type);

/// 카카오톡, 카카오스토리 친구 정보를 담는 구조체
/// @discussion **제휴를 통해 권한이 부여된 특정 앱에서만 사용 가능합니다.*
@interface KOFriend : KOUserInfo

/// @abstract 친구의 앱 가입 여부
@property (nonatomic, readonly, getter=isAppRegistered) BOOL appRegistered;

/// @abstract 친구의 대표 프로필 닉네임. 앱 가입친구의 경우 앱에서 설정한 닉네임. 미가입친구의 경우 톡 또는 스토리의 닉네임
@property (nonatomic, readonly) NSString *nickName;

/// @abstract 친구의 썸네일 이미지
@property (nonatomic, readonly) NSString *thumbnailURL;

/// @abstract 즐겨찾기 추가 여부
@property (nonatomic, readonly) KOOptionalBoolean favorite;

/// @abstract 톡에 가입된 기기의 os 정보 (android / ios)
@property (nonatomic, readonly) KOOSPropertyType talkOS;

/// @abstract 메시지 수신이 허용되었는지 여부. 앱가입 친구의 경우는 feed msg에 해당. 앱미가입친구는 invite msg에 해당
@property (nonatomic, readonly, getter=isAllowedTalkMessaging) BOOL allowedTalkMessaging;

/// @abstract 나와의 카카오톡 친구 관계
@property (nonatomic, readonly) KORelationValue talkRelation;

/// @abstract 나와의 카카오스토리 친구 관계
@property (nonatomic, readonly) KORelationValue storyRelation;

+ (instancetype)responseWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
