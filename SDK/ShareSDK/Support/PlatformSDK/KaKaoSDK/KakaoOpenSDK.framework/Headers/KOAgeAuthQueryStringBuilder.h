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

#ifndef KOAgeAuthQueryStringBuilder_h
#define KOAgeAuthQueryStringBuilder_h

#import "KOSession.h"

/// 연령인증시 필요한 파라미터를 Builder pattern 을 이용해서 세팅한다.
/// @discussion **제휴를 통해 권한이 부여된 특정 앱에서만 사용 가능합니다.*
@interface KOAgeAuthQueryStringBuilder : NSObject

/// @abstract 연령 인증 레벨
@property (nonatomic) KOAgeAuthLevel level;

/// @abstract 연령 인증 제한 나이
@property (nonatomic) KOAgeAuthLimit limit;

/// @abstract 나이의 기준이 한국식인지 외국식인지의 여부(optional, default false)
/// @deprecated 만나이 기준으로 전체 변경되어 항상 true로 인식 됩니다.
@property (nonatomic) BOOL isWesternAge DEPRECATED_MSG_ATTRIBUTE("만나이 기준으로 전체 변경되어 항상 true로 인식 됩니다.");

/// @abstract 동의하기 안내화면 skip 여부(optional, default false)
@property (nonatomic) BOOL isSkipTerm;

/// @abstract 서비스 이름(optional, client_id or app_id or service_name)
@property (nonatomic, copy, nullable) NSString *authFrom;

/// @abstract 청소년 유해물 여부. true인 경우 여가부 가이드에 따라 서비스 이용 제한나이(age_limit)가 빨간색 텍스트/동그라미로 표시됨.
@property (nonatomic) BOOL adultsOnly;

- (nonnull NSString *) build;

@end

#endif /* KOAgeAuthQueryStringBuilder_h */
