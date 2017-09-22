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
 @header KOStorageImageInfo.h
 Storage API를 통해서 이미지를 업로드 후, 이미지 URL 정보를 얻을 수 있습니다.
 */

#import <Foundation/Foundation.h>

/*!
 @class KOStorageImageInfo
 @discussion 저장소에 업로드된 이미지 URL 정보를 얻을 수 있습니다.
 */

@interface KOStorageImageInfo : NSObject

/*!
 @property originImageURL
 @abstract 원본 이미지 URL
 */
@property (nonatomic, readonly) NSString *originImageURL;

/*!
 @property profileImageURL
 @abstract 프로필 이미지 URL. 사이즈 640px * 640px
 */
@property (nonatomic, readonly) NSString *profileImageURL;

/*!
 @property thumbnailImageURL
 @abstract 썸네일 이미지 URL. 사이즈 110px * 110px
 */
@property (nonatomic, readonly) NSString *thumbnailImageURL;

+ (instancetype)responseWithDictionary:(NSDictionary *)dictionary;

@end
