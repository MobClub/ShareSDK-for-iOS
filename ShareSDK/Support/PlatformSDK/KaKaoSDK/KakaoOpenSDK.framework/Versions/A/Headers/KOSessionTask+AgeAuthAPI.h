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

#ifndef kakao_open_sdk_ios_KOSessionTask_AgeAuthAPI_h
#define kakao_open_sdk_ios_KOSessionTask_AgeAuthAPI_h

/*!
 @header KOSessionTask+AgeAuthAPI.h
 인증된 세션정보로 연령인증 관련 API를 정의합니다. 제휴를 통해 권한이 부여된 특정 앱에서만 호출 가능합니다.
 */

#import "KOSessionTask.h"

/*!
 인증된 세션정보로 연령인증 관련 API를 정의한다. 제휴를 통해 권한이 부여된 특정 앱에서만 호출 가능합니다.
 */
@interface KOSessionTask (AgeAuthAPI)

/*!
 @abstract 연령인증 정보를 얻는다.
 @param completionHandler 연령인증 정보를 가져와서 처리하는 핸들러.
 */
+ (instancetype)ageAuthTaskWithCompletionHandler:(KOSessionTaskCompletionHandler)completionHandler;

@end

#endif
