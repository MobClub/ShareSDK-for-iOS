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

/// 카카오스토리의 내스토리 정보 중 이미지 내용을 담고 있는 구조체
@interface KOStoryMyStoryImageInfo : NSObject

/// @abstract 원본 이미지의 url
@property(nonatomic, readonly) NSString *original;

/// @abstract xlarge 사이즈 이미지의 url
@property(nonatomic, readonly) NSString *xlarge;

/// @abstract large 사이즈 이미지의 url
@property(nonatomic, readonly) NSString *large;

/// @abstract medium 사이즈 이미지의 url
@property(nonatomic, readonly) NSString *medium;

/// @abstract small 사이즈 이미지의 url
@property(nonatomic, readonly) NSString *small;


- (id)initWithOriginal:(NSString *)original
                xlarge:(NSString *)xlarge
                 large:(NSString *)large
                medium:(NSString *)medium
                 small:(NSString *)small;

@end
