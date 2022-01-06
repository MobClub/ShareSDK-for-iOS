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

/*!
 @header KOError.h
 KakaoOpenSDK 를 통해 카카오계정을 인증하거나 API를 호출할 때 발생하는 오류들을 정의합니다.
 */
#import <Foundation/Foundation.h>

extern NSString *const KOErrorDomain;

/// 오류 코드 정의
typedef enum {
    
    // client errors
    
    /// 알 수 없는 오류
    KOErrorUnknown = 1,
    /// 오퍼레이션 취소를 나타냄
    KOErrorCancelled = 2,
    /// 오퍼레이션이 진행 중간에 있음을 나타냄
    KOErrorOperationInProgress = 3,
    /// 로그인 상태를 기대하는 상황에서 인증 토큰이 없는 오류
    KOErrorTokenNotFound = 4,
    /// 세션이 만료된(access_token, refresh_token이 모두 만료된 경우) 상태
    KOErrorDeactivatedSession = 5,
    /// 로그인 된 상태(access_token, refresh_token이 존재 하는 경우)에서 다시 로그인 하려고 할때 발생하는 오류
    KOErrorAlreadyLoginedUser = 6,
    /// 요청에 대한 응답에 기대하는 값이 없거나 문제가 있음
    KOErrorBadResponse = 7,
    /// 네트워크 오류
    KOErrorNetworkError = 8,
    /// http 프로토콜 오류
    KOErrorHTTP = 9,
    /// 지원하지 않는 기능
    KOErrorNotSupported = 10,
    /// 파라미터 이상
    KOErrorBadParameter = 11,
    /// 작업을 실행하기에 적절하지 않은 상태
    KOErrorIllegalState = 14,
    
    
    // server errors
    
    /// 일반적인 서버 오류 응답. message를 확인해야 함
    KOServerErrorInternal = -1,
    /// 파라미터 이상
    KOServerErrorBadParameter = -2,
    /// 지원되지 않은 API 호출
    KOServerErrorUnSupportedApi = -3,
    /// 계정 제재 또는 특정 서비스에서 해당 사용자의 제재로 인해 API 호출이 금지된 경우
    KOServerErrorBlocked = -4,
    /// 해당 API에 대한 권한/퍼미션이 없는 경우
    KOServerErrorPermission = -5,
    /// 개발환경 설정 오류 (bundle id 등)
    KOServerErrorMisConfigured = -6,
    /// 삭제 예정 API인 경우. 대상 API의 기존 사용처 중 일부 화이트리스트 조건을 만족하는 앱키에 대해서는 정해진 유예기간 동안 보호를 받아 이 에러가 발생하지 않습니다. 자세한 내용은 API 삭제가 진행될 경우 해당 공지사항을 참고해주세요.
    KOServerErrorDeprecatedApi = -9,
    /// API 호출 횟수가 제한을 초과
    KOServerErrorApiLimitExceed = -10,

    /// 미가입(가가입) 사용자
    KOServerErrorNotSignedUpUser = -101,
    /// 이미 가입된 사용자. 가입된 사용자에 대해 다시 가입 요청(앱 연결 요청)을 한 경우
    KOServerErrorAlreadySignedUpUser = -102,
    /// 카카오계정 유저가 아닐때
    KOServerErrorNotKakaoAccountUser = -103,

    /// 등록되지 않은 user property key
    KOServerErrorInvalidUserPropertyKey = -201,

    /// 존재하지 않는 앱
    KOServerErrorNoSuchApp = -301,

    /// access_token이 비정상적이거나 만료된 경우
    KOServerErrorInvalidAccessToken = -401,
    /// 해당 API에 대한 사용자의 동의 퍼미션이 없는 경우
    KOServerErrorInsufficientScope = -402,
    /// 연령인증이 필요한 경우
    KOServerErrorNotAgeAuthorized = -450,
    /// 현재 앱의 연령제한보다 사용자의 연령이 낮은 경우
    KOServerErrorLowerAgeLimit = -451,
    /// 이미 연령인증이 완료된 경우
    KOServerErrorAlreadyAgeAuthorized = -452,
    /// 연령인증 최대 횟수를 초과한 경우
    KOServerErrorAgeCheckLimitExceed = -453,
    /// 이전에 인증했던 정보와 불일치 한 경우
    KOServerErrorAgeResultMismatched = -480,
    /// CI 정보가 불일치 할 경우
    KOServerErrorCIResultMismatched = -481,

    /// 카카오톡 유저가 아닐때
    KOServerErrorNotTalkUser = -501,
    /// 유저 디바이스가 해당 기능을 지원하지 않는 경우
    KOServerErrorUserDeviceUnsupported = -504,
    /// 받는이가 메시지 수신 거부를 설정한 경우
    KOServerErrorTalkMessageDisabled = -530,
    /// 한명이 특정앱에 대해 특정인에게 보낼 수 있는 한달 쿼터 초과시 발생
    KOServerErrorTalkSendMessageMonthlyLimitExceed = -531,
    /// 한명이 특정앱에 대해 보낼 수 있는 하루 쿼터(받는 사람 관계없이) 초과시 발생
    KOServerErrorTalkSendMessageDailyLimitExceed = -532,

    /// 카카오스토리 유저가 아닐때
    KOServerErrorNotStoryUser = -601,
    /// 카카오스토리 이미지 업로드 사이즈 제한 초과
    KOServerErrorStoryImageUploadSizeExceed = -602,
    /// 카카오스토리 이미지 업로드시 타임아웃
    KOServerErrorStoryUploadTimeout = -603,
    /// 카카오스토리 스크랩시 잘못된 스크랩 URL로 호출할 경우
    KOServerErrorStoryInvalidScrapUrl = -604,
    /// 카카오스토리의 내정보 요청시 잘못된 내스토리 아이디(포스트 아이디)로 호출할 경우
    KOServerErrorStoryInvalidPostId = -605,
    /// 카카오스토리 이미지 업로드시 허용된 업로드 파일 수가 넘을 경우
    KOServerErrorStoryMaxUploadNumberExceed = -606,

    /// 존재하지 않는 푸시 토큰으로 푸시 전송을 하였을 경우
    KOServerErrorPushNotExistPushToken = -901,

    /// 서버 점검중
    KOServerErrorUnderMaintenance = -9798,

} KOErrorCode;
