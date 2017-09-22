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

#ifndef kakao_open_sdk_ios_KOSessionTask_StorageAPI_h
#define kakao_open_sdk_ios_KOSessionTask_StorageAPI_h

/*!
 @header KOSessionTask+StorageAPI.h
 인증된 세션정보로 Storage API 를 사용할 수 있습니다. 제휴를 통해 권한이 부여된 특정 앱에서만 호출 가능합니다.
 */

#import "KOSessionTask.h"
#import "KOStorageImageInfo.h"

/*!
 @abstract Storage API 이미지 업로드 요청 완료시 호출되는 콜백 핸들러.
 @param imageInfo 이미지 URL 정보.
 @param error 호출 실패시의 오류 정보.
 */
typedef void(^KOSessionStorageImageTaskCompletionHandler)(KOStorageImageInfo *imageInfo, NSError *error);

/*!
 인증된 세션정보로 Storage API 를 사용할 수 있습니다. 제휴를 통해 권한이 부여된 특정 앱에서만 호출 가능합니다.
 */
@interface KOSessionTask (StorageAPI)

/*!
 @abstract 이미지를 저장소에 업로드합니다.
 @param image 이미지 객체.
 @param secureResource 이미지 URL 정보를 https로 반환할지 여부.
 @param completionHandler 요청 완료시 실행될 핸들러.
 */
+ (instancetype)storageImageUploadTaskWithImage:(UIImage *)image
                                 secureResource:(BOOL)secureResource
                              completionHandler:(KOSessionStorageImageTaskCompletionHandler)completionHandler;


@end

#endif