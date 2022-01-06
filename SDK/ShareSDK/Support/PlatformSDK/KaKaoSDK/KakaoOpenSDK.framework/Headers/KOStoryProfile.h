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

/// 스토리 프로필의 생일 타입
typedef NS_ENUM(NSInteger, KOStoryProfileBirthdayType) {
    /// 양력
    KOStoryProfileBirthdayTypeSolar = 0,
    /// 음력
    KOStoryProfileBirthdayTypeLunar = 1
};

/// 카카오스토리 사용자 정보를 담고 있는 구조체
@interface KOStoryProfile : NSObject

/// @abstract 카카오스토리 닉네임
@property(nonatomic, readonly) NSString *nickName;

/// @abstract 카카오스토리 프로필 이미지 URL
@property(nonatomic, readonly) NSString *profileImageURL;

/// @abstract 카카오스토리 프로필 이미지 썸네일 URL
@property(nonatomic, readonly) NSString *thumbnailURL;

/// @abstract 카카오스토리 배경이미지 URL
@property(nonatomic, readonly) NSString *bgImageURL;

/// @abstract 생일. MMdd
@property(nonatomic, readonly) NSString *birthday;

/// @abstract 생일 타입. SOLAR 또는 LUNAR
@property(nonatomic, readonly) KOStoryProfileBirthdayType birthdayType;

/// @abstract 내 스토리를 방문할 수 있는 웹 page의 URL
@property(nonatomic, readonly) NSString *permalink;


- (id)initWithNickname:(NSString *)nickName
       profileImageURL:(NSString *)profileImageURL
          thumbnailURL:(NSString *)thumbnailURL
            bgImageURL:(NSString *)bgImageURL
              birthday:(NSString *)birthday
          birthdayType:(KOStoryProfileBirthdayType)birthdayType
             permalink:(NSString *)permalink;
@end
