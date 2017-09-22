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
 @header KOBaseContext.h
 목록 페이징의 정보를 처리하기 위한 기본 Context를 정의한다.
 */
#import <Foundation/Foundation.h>

/*!
 @abstract KOOrdering 정렬 정보.
 @constant KOOrderingAscending 오름차순 정렬.
 @constant KOOrderingDescending 내림차순 정렬.
 */
typedef NS_ENUM(NSInteger, KOOrdering) {
    KOOrderingAscending = 0,
    KOOrderingDescending
};

extern NSString* convertOrderingString(KOOrdering type);

/*!
 @class KOBaseContext
 @discussion 목록 페이징의 정보를 처리하기 위한 기본 Context.
 */
@interface KOBaseContext : NSObject

/*!
 @property totalCount
 @abstract 목록의 전체 수.
 */
@property (nonatomic, readonly) NSNumber *totalCount;

/*!
 @property beforeURL
 @abstract 이전 페이지 목록의 요청 URL.
 */
@property (nonatomic, readonly) NSString *beforeURL;

/*!
 @property afterURL
 @abstract 이후 페이지 목록의 요청 URL.
 */
@property (nonatomic, readonly) NSString *afterURL;

/*!
 @property hasMoreItems
 @abstract 이후 페이지 목록이 존재하는지의 여부.
 */
@property (nonatomic, readonly) BOOL hasMoreItems;

@property (nonatomic, readonly) NSString *contextID;

- (void)parseDictionary:(NSDictionary *)dictionary;

@end
