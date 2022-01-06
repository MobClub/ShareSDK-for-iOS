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

/// 스토리의 미디어 형식
typedef NS_ENUM(NSInteger, KOStoryMediaType) {
    /// 알 수 없는 미디어 형식
    KOStoryMediaTypeUnknown = 0,
    /// 지원되지 않는 미디어 형식
    KOStoryMediaTypeNotSupported = 1,
    /// 텍스트 같은 노트 형식
    KOStoryMediaTypeNote = 2,
    /// 사진 이미지 같은 포토 형식
    KOStoryMediaTypePhoto = 3
};

/// 스토리의 공개 범위
typedef NS_ENUM(NSInteger, KOStoryPermission) {
    /// 알수 없는 공개 범위
    KOStoryPermissionUnknown = 0,
    /// 전체공개
    KOStoryPermissionPublic = 1,
    /// 친구공개
    KOStoryPermissionFriend = 2,
    /// 나만보기
    KOStoryPermissionOnlyMe = 3
};

@class KOStoryMyStoryImageInfo;
@class KOStoryCommentInfo;
@class KOStoryLikeInfo;

/// 카카오스토리의 내스토리 정보를 담고 있는 구조체
@interface KOStoryMyStoryInfo : NSObject

/// @abstract 내스토리 정보의 id (포스트 id)
@property(nonatomic, readonly) NSString *ID;

/// @abstract 내스토리 정보의 내용
@property(nonatomic, readonly) NSString *content;

/// @abstract 내스토리 정보의 미디어타입. 예) NOTE, PHOTO, LINK, UNKNOWN
@property(nonatomic, readonly) KOStoryMediaType mediaType;

/// @abstract 내스토리 정보의 생성시간. RFC3339를 따름
@property(nonatomic, readonly) NSString *createdAt;

/// @abstract 내스토리 정보의 미디어타입이 PHOTO일 경우 이미지 내용의 array. KOStoryMyStoryImageInfo 객체의 array
@property(nonatomic, readonly) NSArray<KOStoryMyStoryImageInfo *> *media;

/// @abstract 내스토리 정보의 url
@property(nonatomic, readonly) NSString *url;

/// @abstract 내스토리 정보의 comment 숫자
@property(nonatomic, readonly) NSNumber *commentCount;

/// @abstract 내스토리 정보의 like 숫자
@property(nonatomic, readonly) NSNumber *likeCount;

/// @abstract 댓글 정보들을 담고 있는 array. KOStoryCommentInfo 객체의 array. 내스토리 정보 요청을 통해 값이 채워짐
@property(nonatomic, readonly) NSArray<KOStoryCommentInfo *> *comments;

/// @abstract 좋아요 등 느낌(감성표현)에 대한 정보들을 담고 있는 array. KOStoryLikeInfo 객체의 array. 내스토리 정보 요청을 통해 값이 채워짐
@property(nonatomic, readonly) NSArray<KOStoryLikeInfo *> *likes;

/// @abstract 내스토리 정보의 공개 범위. 예) PUBLIC, FRIEND, ONLY_ME, UNKNOWN
@property(nonatomic, readonly) KOStoryPermission permission;


- (id)initWithID:(NSString *)myStoryID
         content:(NSString *)content
       mediaType:(KOStoryMediaType)mediaType
       createdAt:(NSString *)createdAt
           media:(NSArray<KOStoryMyStoryImageInfo *> *)media
             url:(NSString *)url
    commentCount:(NSNumber *)commentCount
       likeCount:(NSNumber *)likeCount
        comments:(NSArray<KOStoryCommentInfo *> *)comments
           likes:(NSArray<KOStoryLikeInfo *> *)likes
      permission:(KOStoryPermission)permission;

- (NSString *)convertMediaTypeToString:(KOStoryMediaType)mediaType;

- (NSString *)convertPermissionToString:(KOStoryPermission)permission;

@end
