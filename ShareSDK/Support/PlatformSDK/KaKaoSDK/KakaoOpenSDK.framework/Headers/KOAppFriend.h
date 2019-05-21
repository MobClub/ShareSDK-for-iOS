/**
 * Copyright 2018 Kakao Corp.
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

@interface KOAppFriend : NSObject

/*!
 * @property ID
 * @abstract 친구의 사용자 아이디
 */
@property (readonly, nullable) NSString *ID;
/*!
 * @property nickname
 * @abstract 친구의 닉네임
 */
@property (readonly, nullable) NSString *nickname;
/*!
 * @property thumbnailImageURL
 * @abstract 썸네일 이미지 URL
 */
@property (readonly, nullable) NSURL *thumbnailImageURL;

- (NSDictionary<NSString *, id> *)dictionary;
+ (instancetype)appFriendWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
