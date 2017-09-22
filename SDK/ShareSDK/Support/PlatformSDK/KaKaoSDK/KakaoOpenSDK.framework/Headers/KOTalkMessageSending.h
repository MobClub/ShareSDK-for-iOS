/**
 * Copyright 2015-2016 Kakao Corp.
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

#ifndef kakao_open_sdk_ios_KOTalkMessageSending_h
#define kakao_open_sdk_ios_KOTalkMessageSending_h

#import "KOSessionTask.h"

/*!
 @protocol KOTalkMessageSending
 @discussion 카카오톡 메시지를 전송하기 위해 구현해야 하는 프로토콜
 */
@protocol KOTalkMessageSending <NSObject>

@required
/*!
 @abstract 미리 지정된 Message Template을 사용하여, 카카오톡으로 메시지를 전송합니다. 제휴를 통해 권한이 부여된 특정 앱에서만 호출 가능합니다.
 @param templateID 미리 지정된 템플릿 메시지 ID
 @param arguments 템플릿 메시지를 만들 때, 채워줘야할 파라미터들
 @param completionHandler 요청 완료시 실행될 block. 오류 처리와 전송 완료 시 수행된다.
 */
- (KOSessionTask *)sendMessageWithTemplateID:(NSString *)templateID
                                   arguments:(NSDictionary *)arguments
                           completionHandler:(void (^)(NSError *error))completionHandler;

@optional
/*!
 @abstract 미리 지정된 Message Template을 사용하여, 카카오톡의 "나와의 채팅방"으로 메시지를 전송합니다. 모든 앱에서 호출 가능합니다.
 @param templateID 개발자 사이트를 통해 생성한 메시지 템플릿 id
 @param messageArguments 메시지 템플릿에 정의한 키/밸류의 파라미터들. 템플릿에 정의된 모든 파라미터가 포함되어야 함.
 @param completionHandler 요청 완료시 실행될 block. 오류 처리와 전송 완료시 수행된다.
 */
- (KOSessionTask *)sendMemoWithTemplateID:(NSString *)templateID
                         messageArguments:(NSDictionary *)messageArguments
                        completionHandler:(void (^)(NSError *error))completionHandler;

@end

#endif
