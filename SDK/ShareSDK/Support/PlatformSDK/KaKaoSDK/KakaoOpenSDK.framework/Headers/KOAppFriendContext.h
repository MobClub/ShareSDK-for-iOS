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

#import <KakaoOpenSDK/KakaoOpenSDK.h>

NS_ASSUME_NONNULL_BEGIN

/// KOAppFriendOrderType 친구 정렬 타입
typedef NS_ENUM(NSInteger, KOAppFriendOrderType) {
    /// 서버 기본값 사용
    KOAppFriendOrderTypeDefault = -1,
    /// 닉네임 정렬
    KOAppFriendOrderTypeNickname = 0,
    /// 즐겨찾기 정렬
    KOAppFriendOrderTypeFavorite = 5,
};

extern NSString* convertAppFriendOrderTypeString(KOAppFriendOrderType type);

/// 앱 친구 목록 페이징의 정보를 처리하기 위한 Context
@interface KOAppFriendContext : KOBaseContext

/// @abstract 친구 정렬 타입
@property (nonatomic, readonly) KOAppFriendOrderType orderType;

/// @abstract 내려온 친구 목록 중 즐겨찾기에 등록되어 있는 친구 수
/// @warning 값을 가져오려면, 이 컨텍스트로 KOSessionTask 친구 목록을 조회해야 합니다.
@property (nonatomic, readonly) NSNumber *favoriteCount;

+ (instancetype)contextWithOrderType:(KOAppFriendOrderType)orderType
                               limit:(NSInteger)limit
                            ordering:(KOOrdering)ordering;
+ (instancetype)contextWithOrderType:(KOAppFriendOrderType)orderType
                      secureResource:(BOOL)secureResource
                               limit:(NSInteger)limit
                            ordering:(KOOrdering)ordering;
- (instancetype)initWithOrderType:(KOAppFriendOrderType)orderType
                            limit:(NSInteger)limit
                         ordering:(KOOrdering)ordering;
- (instancetype)initWithOrderType:(KOAppFriendOrderType)orderType
                   secureResource:(BOOL)secureResource
                            limit:(NSInteger)limit
                         ordering:(KOOrdering)ordering;

@end

NS_ASSUME_NONNULL_END
