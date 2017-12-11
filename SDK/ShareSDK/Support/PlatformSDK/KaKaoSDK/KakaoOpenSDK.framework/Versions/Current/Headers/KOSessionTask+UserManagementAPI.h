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

#import "KOSessionTask.h"
#import "KOUser.h"

/*!
 @header KOSessionTask+UserManagementAPI.h
 인증된 session 정보를 바탕으로 각종 사용자 관리 API를 호출할 수 있습니다.
 */

/*!
 인증된 session 정보를 바탕으로 각종 사용자 관리 API를 호출할 수 있습니다.
 */
@interface KOSessionTask (UserManagementAPI)
#pragma mark - UserManagement

/*!
 @abstract 현재 로그인된 사용자에 대한 정보를 얻을 수 있습니다.
 @param completionHandler 사용자 정보를 얻어 처리하는 핸들러
 @discussion
 */
+ (instancetype)meTaskWithCompletionHandler:(KOSessionTaskCompletionHandler)completionHandler;

/*!
 @abstract 현재 로그인된 사용자에 대한 정보를 얻을 수 있습니다.
 @param secureResource 프로필, 썸네일 이미지 등의 리소스 정보들에 대해 https를 지원하는 형식으로 응답을 받을지의 여부. YES일 경우 https지원, NO일 경우 http지원.
 @param completionHandler 사용자 정보를 얻어 처리하는 핸들러
 @discussion
 */
+ (instancetype)meTaskWithSecureResource:(BOOL)secureResource
                       completionHandler:(KOSessionTaskCompletionHandler)completionHandler;

/*!
 @abstract 현재 로그인된 사용자의 속성(Property)를 설정할 수 있습니다.
 @param properties 갱신할 사용자 정보
 @param completionHandler 요청 완료시 실행될 핸들러
 */
+ (instancetype)profileUpdateTaskWithProperties:(NSDictionary *)properties
                              completionHandler:(void (^)(BOOL success, NSError *error))completionHandler;

/*!
 @abstract 카카오 플랫폼 서비스와 앱을 연결합니다(가입).
 @param properties 가입시 함께 설정할 사용자 정보
 @param completionHandler 요청 완료시 실행될 핸들러
 */
+ (instancetype)signupTaskWithProperties:(NSDictionary *)properties
                       completionHandler:(void (^)(BOOL success, NSError *error))completionHandler;

/*!
 @abstract 카카오 플랫폼 서비스와 앱 연결을 해제합니다(탈퇴).
 @param completionHandler 요청 완료시 실행될 핸들러
 */
+ (instancetype)unlinkTaskWithCompletionHandler:(void (^)(BOOL success, NSError *error))completionHandler;

@end