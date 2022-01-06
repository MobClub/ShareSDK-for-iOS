/*
 * Copyright 2017 Kakao Corp.
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

/// KCMErrorDomain KakaoCommon API에서 발생하는 NSError 객체의 도메인
extern NSString *const KCMErrorDomain;

/// 오류 코드 정의
typedef NS_ENUM(NSInteger, KCMErrorCode) {
    /// KCMErrorCodeUnknown 알 수 없는 오류
    KCMErrorCodeUnknown = 1,
    /// 작업이 취소 됨
    KCMErrorCodeCancelled = 2,
    /// 동시 작업이 지원되지 않는 API에서 다른 요청이 이미 실행중임
    KCMErrorCodeOperationInProgress = 3,
    /// 요청에 대한 응답에 기대하는 값이 없거나 문제가 있음
    KCMErrorCodeBadResponse = 7,
    /// 네트워크 오류
    KCMErrorCodeNetwork = 8,
    /// 지원되지 않는 기능
    KCMErrorCodeNotSupported = 10,
    /// 파라미터 이상
    KCMErrorCodeBadParameter = 11,
    /// 개발환경 설정 오류
    KCMErrorCodeMisconfigured = 12,
    /// SDK 내부 오류
    KCMErrorCodeInternal = 13,
    /// 작업을 실행하기에 적절하지 않은 상태
    KCMErrorCodeIllegalState = 14,
};

extern NSString *const KCMErrorUnexpectedExceptionUserInfoKey;
extern NSString *const KCMErrorMalformedURLStringUserInfoKey;
