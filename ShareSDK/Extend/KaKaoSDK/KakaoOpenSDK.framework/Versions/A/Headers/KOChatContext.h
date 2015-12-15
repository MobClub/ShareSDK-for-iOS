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
 */
typedef NS_ENUM(NSInteger, KOChatType) {
    KOChatTypeGroup = 0
};

extern NSString* convertChatTypeString(KOChatType type);

/*!
 @class KOChatContext
 @discussion 채팅방 목록 페이징의 정보를 처리하기 위한 Context.
 */
@interface KOChatContext : KOBaseContext

/*!
 @property chatType
 @abstract 카카오톡 채팅방 타입.
 */
@property (nonatomic, readonly) KOChatType chatType;

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
 */
- (instancetype)initWithChatType:(KOChatType)chatType
                           limit:(NSInteger)limit
                        ordering:(KOOrdering)ordering;

/*!
 채팅방 페이징 Context 를 생성한다.
 @param chatType 카카오톡 채팅방 타입.
 */
+ (instancetype)contextWithChatType:(KOChatType)chatType;

/*!
 채팅방 페이징 Context 를 생성한다.
 @param chatType 카카오톡 채팅방 타입.
 @param limit 요청 시 제한하는 채팅방의 수. (채팅방은 30개 까지만 가져올 수 있습니다.)
 @param ordering 정렬 방법.
 */
+ (instancetype)contextWithChatType:(KOChatType)chatType
                              limit:(NSInteger)limit
                           ordering:(KOOrdering)ordering;

@end
