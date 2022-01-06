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

#import <KakaoCommon/KCMError.h>

/// KLKErrorDomain KakaoLink API에서 발생하는 NSError 객체의 도메인
extern NSString *const KLKErrorDomain;

/// 카카오링크 SDK 오류 코드 정의
typedef NS_ENUM(NSInteger, KLKErrorCode) {
    /// 알 수 없는 오류
    KLKErrorCodeUnknown = KCMErrorCodeUnknown,
    /// 요청이 취소 됨
    KLKErrorCodeCancelled = KCMErrorCodeCancelled,
    /// 이전 요청이 아직 실행중이어서 작업을 진행할 수 없음
    KLKErrorCodeOperationInProgress = KCMErrorCodeOperationInProgress,
    /// 요청에 대한 응답에 기대하는 값이 없거나 문제가 있음
    KLKErrorCodeBadResponse = 7,
    /// 네트워크 오류
    KLKErrorCodeNetwork = 8,
    /// HTTP 프로토콜 오류
    KLKErrorCodeHTTP = 9,
    /// 파라미터 이상
    KLKErrorCodeBadParameter = KCMErrorCodeBadParameter,
    /// 개발환경 설정 오류
    KLKErrorCodeMisconfigured = KCMErrorCodeMisconfigured,
    /// SDK 내부 오류
    KLKErrorCodeInternal = KCMErrorCodeInternal,
    
    /// 카카오톡이 설치되지 않았거나 지원되지 않는 버전일 경우
    KLKErrorCodeUnsupportedTalkVersion = 201,
    /// 카카오톡 메시지 요청 URL 길이 제한 초과
    KLKErrorCodeExceedSizeLimit = 202,
};

/// 카카오링크 서버 오류 코드 정의
typedef NS_ENUM(NSInteger, KLKServerErrorCode) {
    /// 일반적인 서버 오류 응답. message를 확인해야 함
    KLKServerErrorCodeUnknown = -1,
    /// 파라미터 이상
    KLKServerErrorCodeBadParameter = -2,
    /// 지원되지 않은 API 호출
    KLKServerErrorCodeUnSupportedApi = -3,
    /// 해당 API에 대한 권한/퍼미션이 없는 경우
    KLKServerErrorCodeAccessDenied = -5,
    /// 내부 서버 오류
    KLKServerErrorCodeInternal = -9,
    /// API 호출 횟수가 제한을 초과
    KLKServerErrorCodeApiLimitExceed = -10,
    /// 등록되지 않은 앱키의 요청 또는 존재하지 않는 앱으로의 요청
    KLKServerErrorCodeInvalidAppKey = -401,
    
    /// 이미지 업로드 사이즈 제한 초과
    KLKServerErrorCodeExceedMaxUploadSize = -602,
    /// 이미지 업로드시 타임아웃
    KLKServerErrorCodeExecutionTimeOut = -603,
    /// 이미지 업로드시 허용된 업로드 파일 수가 넘을 경우
    KLKServerErrorCodeExceedMaxUploadNumber = -606,
    
    /// 서버 점검중
    KLKServerErrorCodeUnderMaintenance = -9798,
};


// NSError userInfo key names.
/// @constant NSString NSErrorUserInfoKeys 길이 제한이 초과된 카카오톡링크 URL. KLKErrorCodeExceedSizeLimit 에러에 포함될 수 있음
extern NSString *const KLKErrorExceedSizeLimitURLUserInfoKey;

/// KLKErrorHTTPStatusCodeUserInfoKey 서버로부터 받은 HTTP status code. KLKErrorCodeBadResponse 에러에 포함될 수 있음
extern NSString *const KLKErrorHTTPStatusCodeUserInfoKey;

/// KLKErrorResponseJSONUserInfoKey 서버로부터 받은 JSON 객체. KLKErrorCodeBadResponse 에러에 포함될 수 있음
extern NSString *const KLKErrorResponseJSONUserInfoKey;
