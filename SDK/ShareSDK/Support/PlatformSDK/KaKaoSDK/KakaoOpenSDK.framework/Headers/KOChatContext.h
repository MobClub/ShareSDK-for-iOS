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
 @header KOChatContext.h
 채팅방 목록 페이징의 정보를 처리하기 위한 Context를 정의한다.
 */
#import "KOBaseContext.h"

/*!
 @abstract KOChatType 카카오톡 채팅방 타입.
 @constant KOChatTypeGroup 카카오톡 그룹방.
 @deprecated in the near future.
 */
typedef NS_ENUM(NSInteger, KOChatType) {
    KOChatTypeGroup = 0
};

/*!
 @abstract KOChatType 을 문자열로 변환하는 함수
 @deprecated in the near future.
 */
extern NSString* convertChatTypeString(KOChatType type);

/*!
 @abstract KOChatFilter 챗목록 필터링 옵션들.
 @constant KOChatFilterNone     필터링 하지 않는다 (서버에서 내려주는 목록을 그대로 결과로 받는다).
 @constant KOChatFilterDirect   1:1 채팅방만 필터링하여 결과에 포함시킨다.
 @constant KOChatFilterMulti    그룹 채팅방만 필터링하여 결과에 포함시킨다.
 @constant KOChatFilterRegular  일반 채팅방만 필터링하여 결과에 포함시킨다.
 @constant KOChatFilterOpen     오픈 채팅방만 필터링하여 결과에 포함시킨다.
 */
typedef NS_OPTIONS(NSInteger, KOChatFilters) {
    KOChatFilterNone = 0,
    KOChatFilterDirect  = 1,
    KOChatFilterMulti   = 1 << 1,
    KOChatFilterRegular = 1 << 2,
    KOChatFilterOpen    = 1 << 3
};

NSString* convertChatFilterString(KOChatFilters filters); 

/*!
 @class KOChatContext
 @discussion 채팅방 목록 페이징의 정보를 처리하기 위한 Context.
 */
@interface KOChatContext : KOBaseContext

/*!
 @property chatType
 @abstract 카카오톡 채팅방 타입.
 @deprecated in the near future.
 */
@property (nonatomic, readonly) KOChatType chatType;

/*!
 @property chatFilters
 @abstract 챗리스트 필터링 옵션.
 */
@property (nonatomic, readonly) KOChatFilters chatFilters;

/*!
 @property limit
 @abstract 요청 시 제한하는 채팅방의 수.
 */
@property (nonatomic, readonly) NSInteger limit;

/*!
 @property ordering
 @abstract 정렬 방법.
 */
@property (nonatomic, readonly) KOOrdering ordering;

/*!
 채팅방 페이징 Context 를 생성한다.
 @param chatType 카카오톡 채팅방 타입.
 @param limit 요청 시 제한하는 채팅방의 수. (채팅방은 30개 까지만 가져올 수 있습니다.)
 @param ordering 정렬 방법.
 @deprecated in the near future.
 */
- (instancetype)initWithChatType:(KOChatType)chatType
                           limit:(NSInteger)limit
                        ordering:(KOOrdering)ordering;

/*!
 채팅방 페이징 Context 를 생성한다.
 @param chatType 카카오톡 채팅방 타입.
 @deprecated in the near future.
 */
+ (instancetype)contextWithChatType:(KOChatType)chatType;

/*!
 채팅방 페이징 Context 를 생성한다.
 @param chatType 카카오톡 채팅방 타입.
 @param limit 요청 시 제한하는 채팅방의 수. (채팅방은 30개 까지만 가져올 수 있습니다.)
 @param ordering 정렬 방법.
 @deprecated in the near future.
 */
+ (instancetype)contextWithChatType:(KOChatType)chatType
                             limit:(NSInteger)limit
                          ordering:(KOOrdering)ordering;

/*!
 채팅방 페이징 Context 를 생성한다.
 @param chatFilters 챗리스트 필터링 옵션.
 @param limit 요청 시 제한하는 채팅방의 수. (채팅방은 30개 까지만 가져올 수 있습니다.)
 @param ordering 정렬 방법.
 */
- (instancetype)initWithChatFilters:(KOChatFilters)chatFilters
                              limit:(NSInteger)limit
                           ordering:(KOOrdering)ordering;

/*!
 채팅방 페이징 Context 를 생성한다.
 @param chatFilters 챗리스트 필터링 옵션.
 */
+ (instancetype)contextWithChatFilters:(KOChatFilters)chatFilters;

/*!
 채팅방 페이징 Context 를 생성한다.
 @param chatFilters 챗리스트 필터링 옵션.
 @param limit 요청 시 제한하는 채팅방의 수. (채팅방은 30개 까지만 가져올 수 있습니다.)
 @param ordering 정렬 방법.
 */
+(instancetype)contextWithChatFilters:(KOChatFilters)chatFilters
                                limit:(NSInteger)limit
                             ordering:(KOOrdering)ordering;

@end
