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

/*!
 @header KOUser.h
 사용자 정보를 담고 있는 구조체.
 */
#import <Foundation/Foundation.h>
#import "KOUserInfo.h"

NS_ASSUME_NONNULL_BEGIN

DEPRECATED_MSG_ATTRIBUTE("이 클래스는 v1 user/me용 클래스입니다. v2가 적용된 KOSessionTask.userMeTask 메소드와 KOUserMe 클래스를 사용해주세요.")
@interface KOUser : KOUserInfo

@property(nonatomic, readonly, nullable) NSString *email;
@property(nonatomic, readonly, getter=isVerifiedEmail) BOOL verifiedEmail;
@property(nonatomic, readonly, nullable) NSDictionary *properties;

- (id)propertyForKey:(NSString *)key;

+ (instancetype)responseWithDictionary:(NSDictionary *)dictionary;

@end

/*!
 프로퍼티 키 이름
 */
extern NSString *const KOUserNicknamePropertyKey DEPRECATED_ATTRIBUTE;
extern NSString *const KOUserProfileImagePropertyKey DEPRECATED_ATTRIBUTE;
extern NSString *const KOUserThumbnailImagePropertyKey DEPRECATED_ATTRIBUTE;
extern NSString *const KOUserEmailPropertyKey DEPRECATED_ATTRIBUTE;
extern NSString *const KOUserIsVerifiedEmailPropertyKey DEPRECATED_ATTRIBUTE;

NS_ASSUME_NONNULL_END
