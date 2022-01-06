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

#import "KOBaseContext.h"

NS_ASSUME_NONNULL_BEGIN

/// 친구 목록을 가져올 서비스 타입
/// @discussion **제휴를 통해 권한이 부여된 특정 앱에서만 사용 가능합니다.*
typedef NS_ENUM(NSInteger, KOFriendServiceType) {
    /// 서버 기본값 사용
    KOFriendServiceTypeDefault = -1,
    /// 카카오톡 친구
    KOFriendServiceTypeTalk = 0,
    /// 카카오스토리 친구
    KOFriendServiceTypeStory = 1,
    /// 카카오톡 + 카카오스토리 친구
    KOFriendServiceTypeTalkAndStory = 2
};

/// 친구 필터링 타입
/// @discussion **제휴를 통해 권한이 부여된 특정 앱에서만 사용 가능합니다.*
typedef NS_ENUM(NSInteger, KOFriendFilterType) {
    /// 서버 기본값 사용
    KOFriendFilterTypeDefault = -1,
    /// 전체 친구
    KOFriendFilterTypeAll = 0,
    /// 앱 가입 친구
    KOFriendFilterTypeRegistered = 1,
    /// 앱 미가입 친구
    KOFriendFilterTypeInvitableNotRegistered = 2
};

/// 친구 정렬 타입
/// @discussion **제휴를 통해 권한이 부여된 특정 앱에서만 사용 가능합니다.*
typedef NS_ENUM(NSInteger, KOFriendOrderType) {
    /// 서버 기본값 사용
    KOFriendOrderTypeDefault = -1,
    /// 닉네임 정렬
    KOFriendOrderTypeNickName = 0,
    /// 최근 대화순 정렬
    /// @deprecated 서버에서 더 이상 사용되지 않는 값이므로 요청 파라미터에 추가되지 않습니다.
    KOFriendOrderTypeRecentChatting DEPRECATED_MSG_ATTRIBUTE("서버에서 더 이상 사용되지 않는 값이므로 요청 파라미터에 추가되지 않습니다.") = 1,
    /// 카카오톡 가입일 순 정렬
    /// @deprecated 서버에서 더 이상 사용되지 않는 값이므로 요청 파라미터에 추가되지 않습니다.
    KOFriendOrderTypeTalkUserCreatedAt DEPRECATED_MSG_ATTRIBUTE("서버에서 더 이상 사용되지 않는 값이므로 요청 파라미터에 추가되지 않습니다.") = 2,
    /// 나이 정렬
    KOFriendOrderTypeAge = 3,
    /// 친밀도 정렬
    /// @deprecated 서버에서 더 이상 사용되지 않는 값이므로 요청 파라미터에 추가되지 않습니다.
    KOFriendOrderTypeAffinity DEPRECATED_MSG_ATTRIBUTE("서버에서 더 이상 사용되지 않는 값이므로 요청 파라미터에 추가되지 않습니다.") = 4,
    /// 즐겨찾기 정렬
    KOFriendOrderTypeFavorite = 5,
};

extern NSString* convertFriendServiceTypeString(KOFriendServiceType type);
extern NSString* convertFriendFilterTypeString(KOFriendFilterType type);
extern NSString* convertFriendOrderTypeString(KOFriendOrderType type);

/// 친구 목록 페이징의 정보를 처리하기 위한 Context
/// @discussion **제휴를 통해 권한이 부여된 특정 앱에서만 사용 가능합니다.*
@interface KOFriendContext : KOBaseContext

/// @abstract 친구 목록을 가져올 서비스 타입
@property (nonatomic, readonly) KOFriendServiceType serviceType;

/// @abstract 친구 필터링 타입
@property (nonatomic, readonly) KOFriendFilterType filterType;

/// @abstract 친구 정렬 타입
@property (nonatomic, readonly) KOFriendOrderType orderType;

/// @abstract 내려온 친구 목록 중 즐겨찾기에 등록되어 있는 친구 수
/// @warning 값을 가져오려면, 이 컨텍스트로 KOSessionTask 친구 목록을 조회해야 합니다.
@property (nonatomic, readonly) NSNumber *favoriteCount;

/// @abstract 친구 페이징 Context 를 생성한다.
/// @param serviceType 친구 목록을 가져올 서비스 타입
/// @param filterType 친구 필터링 타입
+ (instancetype)contextWithServiceType:(KOFriendServiceType)serviceType
                            filterType:(KOFriendFilterType)filterType;

/// @abstract 친구 페이징 Context 를 생성한다.
/// @param serviceType 친구 목록을 가져올 서비스 타입
/// @param filterType 친구 필터링 타입
/// @param limit 요청 시 제한하는 친구의 수
+ (instancetype)contextWithServiceType:(KOFriendServiceType)serviceType
                            filterType:(KOFriendFilterType)filterType
                                 limit:(NSInteger)limit;

/// @abstract 친구 페이징 Context 를 생성한다.
/// @param serviceType 친구 목록을 가져올 서비스 타입
/// @param filterType 친구 필터링 타입
/// @param limit 요청 시 제한하는 친구의 수
/// @param orderType 친구 정렬 타입
/// @param ordering 정렬 방법
+ (instancetype)contextWithServiceType:(KOFriendServiceType)serviceType
                            filterType:(KOFriendFilterType)filterType
                                 limit:(NSInteger)limit
                             orderType:(KOFriendOrderType)orderType
                              ordering:(KOOrdering)ordering;

/// @abstract 친구 페이징 Context 를 초기화한다.
/// @param serviceType 친구 목록을 가져올 서비스 타입
/// @param filterType 친구 필터링 타입
/// @param limit 요청 시 제한하는 친구의 수
/// @param orderType 친구 정렬 타입
/// @param ordering 정렬 방법
- (instancetype)initWithServiceType:(KOFriendServiceType)serviceType
                         filterType:(KOFriendFilterType)filterType
                              limit:(NSInteger)limit
                          orderType:(KOFriendOrderType)orderType
                           ordering:(KOOrdering)ordering;
@end

NS_ASSUME_NONNULL_END
