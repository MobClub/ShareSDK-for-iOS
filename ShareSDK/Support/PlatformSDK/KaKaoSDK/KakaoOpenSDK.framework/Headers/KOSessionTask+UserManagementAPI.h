/**
 * Copyright 2015-2018 Kakao Corp.
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
#import "KOUserMe.h"

/*!
 @header KOSessionTask+UserManagementAPI.h
 @abstract 인증된 session 정보를 바탕으로 각종 사용자 관리 API를 호출할 수 있습니다.
 */

typedef void (^KOSessionTaskUserMeCompletionHandler)(NSError *error, KOUserMe *me);

/*!
 인증된 session 정보를 바탕으로 각종 사용자 관리 API를 호출할 수 있습니다.
 */
@interface KOSessionTask (UserManagementAPI)
#pragma mark - UserManagement

/*!
 * @method userMeTaskWithCompletion:
 * @abstract 현재 로그인된 사용자에 대한 정보를 얻을 수 있습니다.
 * @param completion 사용자 정보를 얻어 처리하는 핸들러
 */
+ (instancetype)userMeTaskWithCompletion:(KOSessionTaskUserMeCompletionHandler)completion;

/*!
 * @method userMeTaskWithPropertyKeys:completion:
 * @abstract 현재 로그인된 사용자에 대한 정보를 얻을 수 있습니다.
 * @param propertyKeys 특정 프로퍼티를 지정하여 받고 싶을 경우 요청할 프로퍼티 키 이름 목록.
 * @param completion 사용자 정보를 얻어 처리하는 핸들러
 */
+ (instancetype)userMeTaskWithPropertyKeys:(NSArray<NSString *> *)propertyKeys completion:(KOSessionTaskUserMeCompletionHandler)completion;

/*!
 @abstract 현재 로그인된 사용자의 속성(Property)를 설정할 수 있습니다.
 @param properties 갱신할 사용자 정보
 @param completionHandler 요청 완료시 실행될 핸들러
 */
+ (instancetype)profileUpdateTaskWithProperties:(NSDictionary<NSString *, NSString *> *)properties
                              completionHandler:(void (^)(BOOL success, NSError *error))completionHandler;

/*!
 @abstract 카카오 플랫폼 서비스와 앱을 연결합니다(가입).
 @param properties 가입시 함께 설정할 사용자 정보
 @param completionHandler 요청 완료시 실행될 핸들러
 */
+ (instancetype)signupTaskWithProperties:(NSDictionary<NSString *, NSString *> *)properties
                       completionHandler:(void (^)(BOOL success, NSError *error))completionHandler;

/*!
 @abstract 카카오 플랫폼 서비스와 앱 연결을 해제합니다(탈퇴).
 @param completionHandler 요청 완료시 실행될 핸들러
 */
+ (instancetype)unlinkTaskWithCompletionHandler:(void (^)(BOOL success, NSError *error))completionHandler;



+ (instancetype)meTaskWithCompletionHandler:(KOSessionTaskCompletionHandler)completionHandler DEPRECATED_MSG_ATTRIBUTE("전화번호 로그인이 오픈되면서 이메일이 없는 카카오계정이 존재할 수 있습니다. 다양한 상황에 대처할 수 있는 /v2/user/me가 적용된 userMeTaskWithCompletion: 메소드를 사용해주세요.");
+ (instancetype)meTaskWithSecureResource:(BOOL)secureResource
                       completionHandler:(KOSessionTaskCompletionHandler)completionHandler DEPRECATED_MSG_ATTRIBUTE("전화번호 로그인이 오픈되면서 이메일이 없는 계정이 존재할 수 있습니다. 다양한 상황에 대처할 수 있는 /v2/user/me가 적용된 userMeTaskWithCompletion: 메소드를 사용해주세요.");
+ (instancetype)meTaskWithPropertyKeys:(NSArray<NSString *> *)propertyKeys
                     completionHandler:(KOSessionTaskCompletionHandler)completionHandler DEPRECATED_MSG_ATTRIBUTE("전화번호 로그인이 오픈되면서 이메일이 없는 계정이 존재할 수 있습니다. 다양한 상황에 대처할 수 있는 /v2/user/me가 적용된 userMeTaskWithCompletion: 메소드를 사용해주세요.");
+ (instancetype)meTaskWithSecureResource:(BOOL)secureResource
                            propertyKeys:(NSArray<NSString *> *)propertyKeys
                       completionHandler:(KOSessionTaskCompletionHandler)completionHandler DEPRECATED_MSG_ATTRIBUTE("전화번호 로그인이 오픈되면서 이메일이 없는 계정이 존재할 수 있습니다. 다양한 상황에 대처할 수 있는 /v2/user/me가 적용된 userMeTaskWithCompletion: 메소드를 사용해주세요.");

@end
