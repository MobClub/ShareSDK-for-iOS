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
#import "KOStoryActorInfo.h"

/// KOStoryEmotion 느낌(감정표현)에 대한 정의
typedef NS_ENUM(NSInteger, KOStoryEmotion) {
    /// 알수 없는 형식
    KOStoryEmotionUnknown = 0,
    /// 좋아요
    KOStoryEmotionLike = 1,
    /// 멋져요
    KOStoryEmotionCool = 2,
    /// 기뻐요
    KOStoryEmotionHappy = 3,
    /// 슬퍼요
    KOStoryEmotionSad = 4,
    /// 힘내요
    KOStoryEmotionCheerUp = 5
};

/// 카카오스토리의 좋아요 등 느낌(감정표현)에 대한 정보를 담고 있는 구조체
@interface KOStoryLikeInfo : NSObject

/// @abstract 느낌에 대한 정보. 예) 좋아요, 멋져요, 기뻐요, 슬퍼요, 힘내요
@property(nonatomic, readonly) KOStoryEmotion emotion;

/// @abstract 느낌의 작성자
@property(nonatomic, readonly) KOStoryActorInfo *actor;

- (id)initWithEmotion:(KOStoryEmotion)emotion
                actor:(KOStoryActorInfo *)actor;

- (NSString *)convertEmotionToString:(KOStoryEmotion)emotion;

@end
