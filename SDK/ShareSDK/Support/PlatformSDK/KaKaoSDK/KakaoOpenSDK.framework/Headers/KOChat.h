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
#import "KOTalkMessageSending.h"

/// 카카오톡 내의 채팅방을 나타내는 정보 구조체
/// @discussion **제휴를 통해 권한이 부여된 특정 앱에서만 사용 가능합니다.*
@interface KOChat : NSObject <KOTalkMessageSending>

/// @abstract 카카오톡 채팅방 ID
@property (nonatomic, readonly) NSNumber *ID;

/// @abstract 카카오톡 채팅방 Title
@property (nonatomic, readonly) NSString *title;

/// @abstract 카카오톡 채팅방 썸네일 이미지 URL
@property (nonatomic, readonly) NSString *thumbnailURL;

/// @abstract 카카오톡 채팅방 참여자의 수
@property (nonatomic, readonly) NSNumber *memberCount;

/// @abstract 이미지가 존재하는 카카오톡 채팅방 멤버들의 썸네일 이미지 URL 목록 (최대 5대 까지)
@property (nonatomic, readonly) NSArray *displayMemberImages;

/// @abstract 카카오톡 채팅방의 종류 (오픈채팅(open), 일반채팅(regular))
@property (nonatomic, readonly) NSString *chatType;

@property (nonatomic, readonly) NSArray *memberImageURLs DEPRECATED_MSG_ATTRIBUTE("Use 'displayMemberImages' property.");

+ (instancetype)responseWithDictionary:(NSDictionary *)dictionary;

@end
