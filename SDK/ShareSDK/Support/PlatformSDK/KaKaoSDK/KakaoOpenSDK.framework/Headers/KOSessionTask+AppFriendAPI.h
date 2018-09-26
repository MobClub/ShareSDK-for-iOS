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

#import "KOSessionTask.h"
#import "KOAppFriend.h"
#import "KOBaseContext.h"

@class KOAppFriendContext;

/*!
 @abstract App Friend API 요청 완료시 호출되는 콜백 핸들러.
 @param appFriends 앱 친구 목록.
 @param error 호출 실패시의 오류 정보.
 */
typedef void(^KOAppFriendsTaskCompletionHandler)(NSError *error, NSArray<KOAppFriend *> *appFriends);

@interface KOSessionTask (AppFriendAPI)

/*!
 @abstract 앱에 가입한 카카오톡 친구 목록을 얻어온다.
 @param context 친구 목록 페이징 Context.
 @param completionHandler 카카오 앱 친구 목록 정보를 얻어 처리하는 핸들러.
 */
+ (instancetype)appFriendsWithContext:(KOAppFriendContext *)context
                    completionHandler:(KOAppFriendsTaskCompletionHandler)completionHandler;

@end

/*!
 @class KOAppFriendContext
 @abstract 앱 친구 목록 페이징의 정보를 처리하기 위한 Context
 */
@interface KOAppFriendContext : KOBaseContext

@end
