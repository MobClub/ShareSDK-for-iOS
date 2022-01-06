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

NS_ASSUME_NONNULL_BEGIN

/// KOOrdering 정렬 정보
typedef NS_ENUM(NSInteger, KOOrdering) {
    /// 서버 기본값 사용
    KOOrderingDefault = -1,
    /// 오름차순 정렬
    KOOrderingAscending = 0,
    /// 내림차순 정렬
    KOOrderingDescending = 1,
};

extern NSString* convertOrderingString(KOOrdering type);

/// 목록 페이징의 정보를 처리하기 위한 기본 Context
@interface KOBaseContext : NSObject

/// @abstract 프로필 이미지, 썸네일 등의 리소스 url을 https로 반환할지 여부
@property (nonatomic, readonly) BOOL secureResource;

/// @abstract 요청 시 제한하는 친구의 수
@property (nonatomic, readonly) NSInteger limit;

/// @abstract 정렬 방법
@property (nonatomic, readonly) KOOrdering ordering;

/// @abstract 목록의 전체 수
@property (nonatomic, readonly) NSNumber *totalCount;

/// @abstract 이전 페이지 목록의 요청 URL
@property (nonatomic, readonly, nullable) NSString *beforeURL;

/// @abstract 이후 페이지 목록의 요청 URL
@property (nonatomic, readonly, nullable) NSString *afterURL;

/// @abstract 이후 페이지 목록이 존재하는지의 여부
@property (nonatomic, readonly) BOOL hasMoreItems;

/// @abstract 현재 요청에 대한 식별자
@property (nonatomic, readonly) NSString *contextID;

+ (instancetype)context;
+ (instancetype)contextWithLimit:(NSInteger)limit
                        ordering:(KOOrdering)ordering;
+ (instancetype)contextWithSecureResource:(BOOL)secureResource
                                    limit:(NSInteger)limit
                                 ordering:(KOOrdering)ordering;
- (instancetype)initWithLimit:(NSInteger)limit
                     ordering:(KOOrdering)ordering;
- (instancetype)initWithSecureResource:(BOOL)secureResource
                                 limit:(NSInteger)limit
                              ordering:(KOOrdering)ordering;

- (void)parseDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
