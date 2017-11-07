/**
 * Copyright 2015-2016 Kakao Corp.
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


#ifndef KOAgeAuthQueryStringBuilder_h
#define KOAgeAuthQueryStringBuilder_h

#import "KOSession.h"

/*!
 @class KOAgeAuthQueryStringBuilder
 @discussion 연령인증시 필요한 파라미터를 Builder pattern 을 이용해서 세팅한다.
 */
@interface KOAgeAuthQueryStringBuilder : NSObject

/*!
 @property level
 @abstract 연령 인증 레벨
 */
@property (nonatomic) KOAgeAuthLevel level;

/*!
 @property limit
 @abstract 연령 인증 제한 나이
 */
@property (nonatomic) KOAgeAuthLimit limit;

/*!
 @property isWestrnAge
 @abstract 나이의 기준이 한국식인지 외국식인지의 여부(optional, default false)
 */
@property (nonatomic) BOOL isWesternAge;

/*!
 @property isSkipTerm
 @abstract 동의하기 안내화면 skip 여부(optional, default false)
 */
@property (nonatomic) BOOL isSkipTerm;   // 동의하기 안내화면 skip 여부.

/*!
 @property authFrom
 @abstract 서비스 이름(optional, client_id or app_id or service_name)
 */
@property (nonatomic, copy) NSString *authFrom;

- (NSString *) build;

@end

#endif /* KOAgeAuthQueryStringBuilder_h */
