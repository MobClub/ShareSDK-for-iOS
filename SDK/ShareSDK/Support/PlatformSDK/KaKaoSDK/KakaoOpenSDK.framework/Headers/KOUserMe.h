/*
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

#import <Foundation/Foundation.h>
#import "KOTalkMessageSending.h"
#import "KOSession.h"

NS_ASSUME_NONNULL_BEGIN

@class KOUserMeAccount;

/// 사용자 정보를 나타내는 최상위 클래스. ID, 카카오계정 정보, 프로퍼티 등으로 구성됩니다.
@interface KOUserMe : NSObject <NSCopying, KOTalkMessageSending>

/// @abstract 현재 로그인한 사용자가 앱에 연결[KOSessionTask signupTaskWithProperties:completionHandler:]되어 있는지 여부
/// @discussion 사용자관리 설정에서 자동연결 옵션을 off한 앱에서만 사용되는 값입니다. 자동연결의 기본값은 on이며 이 경우 값이 null로 반환되고 이미 연결되어 있음을 의미합니다.
@property (readonly) KOOptionalBoolean hasSignedUp;

/// @abstract 사용자의 고유 아이디
/// @discussion 사용자 ID는 최초 로그인에 성공하면 발급됩니다.<br>
///             **사용자 아이디 고정**이 활성화되지 않은 앱이 연결해제[KOSessionTask unlinkTaskWithCompletionHandler:]를 실행한 후 다시 로그인하면 새로운 값으로 재발급됩니다.<br>
///             **사용자 아이디 고정**이 활성화된 앱은 동일 앱, 동일 카카오계정에 대하여 항상 같은 아이디가 부여됩니다.
@property (readonly, nullable) NSString *ID;

/// @abstract 로그인한 카카오계정 정보. 이메일 등
/// @see KOUserMeAccount
@property (readonly, nullable) KOUserMeAccount *account;

/// @abstract 카카오싱크 간편가입을 통해 카카오 로그인 한 시각
@property (readonly, nullable) NSDate *synchedAt;

/// @abstract 해당 서비스에 연결된 시각
@property (readonly, nullable) NSDate *connectedAt;

/// @abstract 사용자의 닉네임
/// @discussion properties에서 "nickname" 값을 가져옵니다.
/// 초기 값은 카카오계정 프로필에 있는 값으로 저장됩니다. 카카오계정에 닉네임이 없을 경우 개발자사이트의 *사용자 관리 > 앱 연동 설정* 에 따라 카카오톡 또는 카카오스토리에 설정된 닉네임으로 저장되며 이후 해당 프로필 정보와 동기화되지 않습니다.
/// 카카오톡이나 카카오스토리의 최신 프로필 정보를 가져오려면 [KOSessionTask talkProfileTaskWithCompletionHandler:], [KOSessionTask storyProfileTaskWithCompletionHandler:] 를 이용해주세요.
/// @deprecated 실시간 카카오계정 프로필 정보를 얻을 수 있는 account.profile 을 활용해보세요.
/// @see account
/// @see properties
@property (readonly, nullable) DEPRECATED_MSG_ATTRIBUTE("실시간 카카오계정 프로필 정보를 얻을 수 있는 me.account.profile 속성을 활용해보세요. 자세한 사용법은 KOUserMeProfile 클래스 설명을 참고하시기 바랍니다.") NSString *nickname;

/// @abstract 원본 프로필 이미지 URL
/// @discussion properties에 있는 "profile_image" 값을 이용하여 생성된 NSURL 인스턴스를 제공합니다.
/// 초기 값은 카카오계정 프로필에 있는 값으로 저장됩니다. 카카오계정에 프로필 이미지가 없을 경우 개발자사이트의 *사용자 관리 > 앱 연동 설정* 에 따라 카카오톡 또는 카카오스토리에 설정된 프로필 이미지 URL로 저장되며 이후 해당 프로필 정보와 동기화되지 않습니다.
/// 카카오톡이나 카카오스토리의 최신 프로필 정보를 가져오려면 [KOSessionTask talkProfileTaskWithCompletionHandler:], [KOSessionTask storyProfileTaskWithCompletionHandler:] 를 이용해주세요.
/// @deprecated 실시간 카카오계정 프로필 정보를 얻을 수 있는 account.profile 을 활용해보세요.
/// @see account
/// @see properties
@property (readonly, nullable) DEPRECATED_MSG_ATTRIBUTE("실시간 카카오계정 프로필 정보를 얻을 수 있는 me.account.profile 속성을 활용해보세요. 자세한 사용법은 KOUserMeProfile 클래스 설명을 참고하시기 바랍니다.") NSURL *profileImageURL;

/// @abstract 썸네일 이미지 URL
/// @discussion properties에 있는 "thumbnail_image" 값을 이용하여 생성된 NSURL 인스턴스를 제공합니다.
/// 초기 값은 카카오계정 프로필에 있는 값으로 저장됩니다. 카카오계정에 프로필 이미지가 없을 경우 개발자사이트의 *사용자 관리 > 앱 연동 설정* 에 따라 카카오톡 또는 카카오스토리에 설정된 프로필 이미지 URL로 저장되며 이후 해당 프로필 정보와 동기화되지 않습니다.
/// 카카오톡이나 카카오스토리의 최신 프로필 정보를 가져오려면 [KOSessionTask talkProfileTaskWithCompletionHandler:], [KOSessionTask storyProfileTaskWithCompletionHandler:] 를 이용해주세요.
/// @deprecated 실시간 카카오계정 프로필 정보를 얻을 수 있는 account.profile 을 활용해보세요.
/// @see account
/// @see properties
@property (readonly, nullable) DEPRECATED_MSG_ATTRIBUTE("실시간 카카오계정 프로필 정보를 얻을 수 있는 me.account.profile 속성을 활용해보세요. 자세한 사용법은 KOUserMeProfile 클래스 설명을 참고하시기 바랍니다.") NSURL *thumbnailImageURL;

/// @abstract 앱 별로 제공되는 사용자 부가정보 데이터베이스
/// @discussion 사용자에 대해 추가 정보를 저장할 수 있도록 데이터베이스를 제공합니다.
/// @discussion 이 데이터베이스를 통해 사용자의 프로필 정보를 제공 받을 수 있습니다.
/// 로그인한 사용자의 카카오계정 프로필에 있는 닉네임과 프로필 이미지 정보를 앱 연결 시점에 복사하여 초기값으로 제공되며 이후 해당 카카오계정 프로필에 변경이 발생한 경우 변경된 정보와 동기화되지 않습니다.
/// **실시간 프로필 정보**를 원하는 경우 account.profile 속성으로 닉네임 및 프로필 이미지를 조회하시기 바랍니다.<br>
/// 기본 제공되는 사용자 프로필 정보의 키 이름은 아래와 같습니다.<br>
///  1. nickname : 카카오계정에 설정된 닉네임<br>
///  2. profile_image : 프로필 이미지 URL 문자열<br>
///  3. thumbnail_image : 썸네일 사이즈의 프로필 이미지 URL 문자열<br><br>
/// 프로필 정보 외에 다른 정보를 추가 저장하거나 기본 제공되는 정보를 수정하고 싶은 경우 KOSessionTask의 profileUpdateTask 메소드를 사용할 수 있습니다.
@property (readonly, nullable) NSDictionary<NSString *, NSString *> *properties;

/// @abstract 제휴를 통해 권한이 부여된 특정 앱에서 사용
@property (readonly, nullable) NSDictionary<NSString *, id> *forPartner;

/// @abstract 앱이 그룹에 속해 있는 경우 그룹 내 사용자 식별 토큰
/// @discussion 앱의 그룹정보가 변경될 경우 토큰 값도 변경됩니다. 제휴를 통해 권한이 부여된 특정 앱에만 제공됩니다.
@property (readonly, nullable) NSString *groupToken;

- (nonnull NSDictionary<NSString *, id> *)dictionary;
+ (instancetype)meWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end



/// 연령대 정보
typedef NS_ENUM(NSUInteger, KOUserAgeRange) {
    /// 연령대 값이 없음
    KOUserAgeRangeNull,
    /// 0세~9세
    KOUserAgeRangeType0,
    /// 10세~14세
    KOUserAgeRangeType10,
    /// 15세~19세
    KOUserAgeRangeType15,
    /// 20세~29세
    KOUserAgeRangeType20,
    /// 30세~39세
    KOUserAgeRangeType30,
    /// 40세~49세
    KOUserAgeRangeType40,
    /// 50세~59세
    KOUserAgeRangeType50,
    /// 60세~69세
    KOUserAgeRangeType60,
    /// 70세~79세
    KOUserAgeRangeType70,
    /// 80세~89세
    KOUserAgeRangeType80,
    /// 90세 이상
    KOUserAgeRangeType90,
};

/// 성별 정보
typedef NS_ENUM(NSUInteger, KOUserGender) {
    /// 성별 값이 없음
    KOUserGenderNull,
    /// 남자
    KOUserGenderMale,
    /// 여자
    KOUserGenderFemale,
};

/// 생일의 양력,음력 정보
typedef NS_ENUM(NSUInteger, KOUserBirthdayType) {
    /// 양력,음력 값이 없음
    KOUserBirthdayTypeNull,
    /// 양력
    KOUserBirthdayTypeSolar,
    /// 음력
    KOUserBirthdayTypeLunar,
};



/// 사용자의 카카오계정 프로필 정보
/// @discussion 기존에 properties에서 제공된 프로필 정보과 달리 카카오계정에 등록된 값을 실시간 조회합니다. 실제 프로필 정보는 https://accounts.kakao.com에서 해당 계정으로 로그인 후 확인 가능합니다.
@interface KOUserMeProfile : NSObject <NSCopying>

/// @abstract 카카오계정에 등록된 닉네임
@property (readonly) NSString *nickname;

/// @abstract 카카오계정에 등록된 프로필 이미지 URL
/// @discussion 사용자가 프로필 이미지를 등록하지 않은 경우 nil이 내려옵니다. 사용자가 등록한 프로필 이미지가 사진인 경우 640 * 640 규격의 이미지가, 동영상인 경우 480 * 480 규격의 스냅샷 이미지가 제공됩니다.
@property (readonly, nullable) NSURL *profileImageURL;

/// @abstract 카카오계정에 등록된 프로필 이미지의 썸네일 규격 이미지 URL
/// @discussion 사용자가 프로필 이미지를 등록하지 않은 경우 nil이 내려옵니다. 사용자가 등록한 프로필 이미지가 사진인 경우 110 * 110 규격의 이미지가, 동영상인 경우 100 * 100 규격의 스냅샷 이미지가 제공됩니다.
@property (readonly, nullable) NSURL *thumbnailImageURL;

- (nonnull NSDictionary<NSString *, id> *)dictionary;

@end


/// 카카오계정 정보를 나타내는 클래스
/// @discussion 이 클래스에서 제공하는 카카오계정의 모든 개인정보는 사용자의 동의를 받지 않은 경우 nil이 반환됩니다.<br>
///             개인정보 필드의 값이 없으면 해당 필드와 매칭되는 {property}NeedsAgreement 속성 값을 확인하여 사용자에게 정보 제공에 대한 동의를 요청하고 정보 획득을 시도해 볼 수 있습니다.<br>
///             {property}NeedsAgreement 값이 true인 경우 새로운 동의 요청이 가능한 상태이며 [KOSession updateScopes:completionHandler:] 메소드를 이용하여 동의를 받을 수 있습니다. 동의를 받은 후 [KOSessionTask userMeTaskWithCompletion:]를 다시 호출하면 해당 값이 반환될 것입니다.<br>
///             {property}NeedsAgreement 값이 false인 경우 사용자의 계정에 해당 정보가 없어서 값을 얻을 수 없음을 의미합니다.<br>
@interface KOUserMeAccount : NSObject <NSCopying>

/// @abstract 카카오계정에 등록한 프로필 정보
/// @discussion 프로필 정보는 사용자의 동의를 받지 않은 경우 nil이 반환됩니다.<br>
///             프로필이 nil이면 profileNeedsAgreement 값을 확인하여 사용자에게 정보 제공에 대한 동의를 요청하고 정보 획득을 시도해 볼 수 있습니다.<br>
///             동의를 받은 후 [KOSessionTask userMeTaskWithCompletion:]를 다시 호출하면 프로필 값이 반환됩니다.<br>
/// @see KOUserMeProfile
/// @see profileNeedsAgreement
@property (readonly, nullable) KOUserMeProfile *profile;

/// @abstract 카카오계정 프로필 제공에 대한 사용자 동의 필요 여부
/// @discussion profile이 nil로 내려왔는데 정보를 제공받기 원한다면 이 값을 확인해야 합니다.<br>
///             true이면 [KOSession updateScopes:completionHandler:] 메소드로 사용자 동의를 받고 [KOSessionTask userMeTaskWithCompletion:]를 재요청하여 프로필 정보를 받을 수 있습니다. 개발자사이트 동의항목 설정에서 수집 기능이 활성화된 경우 사용자로부터 해당 정보를 수집합니다.<br>
///             프로필 동의항목에 대한 scope ID는 "profile"입니다.<br>
/// @see profile
@property (readonly) BOOL profileNeedsAgreement;

/// @abstract 카카오계정에 등록한 이메일 정보
/// @discussion 이메일은 사용자의 동의를 받지 않은 경우 nil이 반환됩니다.<br>
///             이메일이 nil이면 emailNeedsAgreement 속성 값을 확인하여 사용자에게 정보 제공에 대한 동의를 요청하고 정보 획득을 시도해 볼 수 있습니다.<br>
///             동의를 받은 후 [KOSessionTask userMeTaskWithCompletion:]를 다시 호출하면 이메일 값이 반환됩니다.<br>
/// @see emailNeedsAgreement
/// @see isEmailVerified
@property (readonly, nullable) NSString *email;

/// @abstract 카카오계정에 이메일 등록 시 이메일 인증을 받았는지 여부
/// @see email
@property (readonly) KOOptionalBoolean isEmailVerified;

/// @abstract 이메일 제공에 대한 사용자 동의 필요 여부
/// @discussion email 이 nil로 내려왔는데 정보를 제공받기 원한다면 이 값을 확인해야 합니다.<br>
///             true이면 [KOSession updateScopes:completionHandler:] 메소드로 사용자 동의를 받고 [KOSessionTask userMeTaskWithCompletion:]를 재요청하여 이메일 정보를 받을 수 있습니다. 개발자사이트 동의항목 설정에서 수집 기능이 활성화된 경우 사용자로부터 해당 정보를 수집합니다.<br>
///             이메일 동의항목에 대한 scope ID는 "account_email"입니다.<br>
/// @see email
@property (readonly) BOOL emailNeedsAgreement;

/// @abstract 카카오톡 서비스 가입 여부
/// @discussion 제휴를 통해 권한이 부여된 특정 앱에서만 획득할 수 있습니다. 제휴되어 있지 않은 경우 null이 반환됩니다.<br>
///             카카오톡 카카오계정 설정에 연결되어 있는 카카오계정은 true가 반환됩니다.<br>
///             사용자에게 동의를 받지 않았을 경우 null이 반환되며 [KOSession updateScopes:completionHandler:] 메소드를 이용하여 사용자로부터 카카오톡 가입 여부에 대한 동의를 받을 수 있습니다.<br>
///             카카오톡 서비스 가입 여부 scope ID는 "is_kakaotalk_user"입니다.
@property (readonly) KOOptionalBoolean isKakaotalkUser;
@property (readonly) BOOL isKakaotalkUserNeedsAgreement;

/// @abstract 카카오톡에서 인증한 전화번호
/// @discussion 제휴를 통해 권한이 부여된 특정 앱에서만 획득할 수 있습니다. 카카오톡에 연결되어 있지 않은 카카오계정은 전화번호가 존재하지 않습니다.<br>
///             phoneNumber 는 사용자의 동의를 받지 않은 경우 nil이 반환됩니다.<br>
///             phoneNumber 가 nil이면 phoneNumberNeedsAgreement 속성 값을 확인하여 사용자에게 정보 제공에 대한 동의를 요청하고 정보 획득을 시도해 볼 수 있습니다.<br>
///             동의를 받은 후 [KOSessionTask userMeTaskWithCompletion:]를 다시 호출하면 phoneNumber 값이 반환됩니다.<br>
/// @see phoneNumberNeedsAgreement
@property (readonly, nullable) NSString *phoneNumber;

/// @abstract phoneNumber 제공에 대한 사용자 동의 필요 여부
/// @discussion phoneNumber 가 nil로 내려왔는데 정보를 제공받기 원한다면 이 값을 확인해야 합니다.<br>
///             true이면 [KOSession updateScopes:completionHandler:] 메소드로 사용자 동의를 받고 [KOSessionTask userMeTaskWithCompletion:]를 재요청하여 전화번호 정보를 받을 수 있습니다. 개발자사이트 동의항목 설정에서 수집 기능이 활성화된 경우 사용자로부터 해당 정보를 수집합니다.<br>
///             전화번호 동의항목에 대한 scope ID는 "phone_number"입니다.<br>
/// @see phoneNumber
@property (readonly) BOOL phoneNumberNeedsAgreement;

/// @abstract 카카오계정의 대표 정보. 이메일 또는 전화번호
/// @discussion 제휴를 통해 권한이 부여된 특정 앱에서만 획득할 수 있습니다. 계정 상태에 이상이 생긴 경우 텍스트 일부가 마스킹 처리되어 반환됩니다.
/// @see email
/// @see phoneNumber
@property (readonly, nullable) NSString *displayID;

/// @abstract 사용자의 연령대 정보
/// @discussion 카카오계정에 등록된 사용자의 생일 정보를 기반으로 제공됩니다.<br>
///             ageRange 는 사용자의 동의를 받지 않은 경우 nil이 반환됩니다.<br>
///             ageRange 가 nil이면 ageRangeNeedsAgreement 속성 값을 확인하여 사용자에게 정보 제공에 대한 동의를 요청하고 정보 획득을 시도해 볼 수 있습니다.<br>
///             동의를 받은 후 [KOSessionTask userMeTaskWithCompletion:]를 다시 호출하면 ageRange 값이 반환됩니다.<br>
/// @see ageRangeNeedsAgreement
@property (readonly) KOUserAgeRange ageRange;

/// @abstract ageRange 제공에 대한 사용자 동의 필요 여부
/// @discussion ageRange 가 nil로 내려왔는데 정보를 제공받기 원한다면 이 값을 확인해야 합니다.<br>
///             true이면 [KOSession updateScopes:completionHandler:] 메소드로 사용자 동의를 받고 [KOSessionTask userMeTaskWithCompletion:]를 재요청하여 연령대 정보를 받을 수 있습니다. 개발자사이트 동의항목 설정에서 수집 기능이 활성화된 경우 사용자로부터 해당 정보를 수집합니다.<br>
///             연령대 동의항목에 대한 scope ID는 "age_range"입니다.<br>
/// @see ageRange
@property (readonly) BOOL ageRangeNeedsAgreement;

/// @abstract 사용자의 출생 연도
/// @discussion 카카오계정에 등록된 사용자의 출생 연도 정보를 기반으로 제공됩니다. (yyyy형식)<br>
///             birthyear 는 사용자의 동의를 받지 않은 경우 nil이 반환됩니다.<br>
///             birthyear 가 nil이면 birthyearNeedsAgreement 속성 값을 확인하여 사용자에게 정보 제공에 대한 동의를 요청하고 정보 획득을 시도해 볼 수 있습니다.<br>
///             동의를 받은 후 [KOSessionTask userMeTaskWithCompletion:]를 다시 호출하면 birthyear 값이 반환됩니다.<br>
/// @see birthyearNeedsAgreement
@property (readonly, nullable) NSString *birthyear;

/// @abstract birthyear 제공에 대한 사용자 동의 필요 여부
/// @discussion birthyear 가 nil로 내려왔는데 정보를 제공받기 원한다면 이 값을 확인해야 합니다.<br>
///             true이면 [KOSession updateScopes:completionHandler:] 메소드로 사용자 동의를 받고 [KOSessionTask userMeTaskWithCompletion:]를 재요청하여 출생 연도 정보를 받을 수 있습니다. 개발자사이트 동의항목 설정에서 수집 기능이 활성화된 경우 사용자로부터 해당 정보를 수집합니다.<br>
///             출생 연도 동의항목에 대한 scope ID는 "birthyear"입니다.<br>
/// @see birthyear
@property (readonly) BOOL birthyearNeedsAgreement;

/// @abstract 사용자의 생일
/// @discussion 카카오계정에 등록된 사용자의 생일 정보를 기반으로 제공됩니다. (MMDD형식)<br>
///             birthday 는 사용자의 동의를 받지 않은 경우 nil이 반환됩니다.<br>
///             birthday 가 nil이면 birthdayNeedsAgreement 속성 값을 확인하여 사용자에게 정보 제공에 대한 동의를 요청하고 정보 획득을 시도해 볼 수 있습니다.<br>
///             동의를 받은 후 [KOSessionTask userMeTaskWithCompletion:]를 다시 호출하면 birthday 값이 반환됩니다.<br>
/// @see birthdayNeedsAgreement
@property (readonly, nullable) NSString *birthday;

/// @abstract 생일의 양력,음력
/// @see birthday
@property (readonly) KOUserBirthdayType birthdayType;

/// @abstract birthday 제공에 대한 사용자 동의 필요 여부
/// @discussion birthday 가 nil로 내려왔는데 정보를 제공받기 원한다면 이 값을 확인해야 합니다.<br>
///             true이면 [KOSession updateScopes:completionHandler:] 메소드로 사용자 동의를 받고 [KOSessionTask userMeTaskWithCompletion:]를 재요청하여 생일 정보를 받을 수 있습니다. 개발자사이트 동의항목 설정에서 수집 기능이 활성화된 경우 사용자로부터 해당 정보를 수집합니다.<br>
///             생일 동의항목에 대한 scope ID는 "birthday"입니다.<br>
/// @see birthday
/// @see birthdayType
@property (readonly) BOOL birthdayNeedsAgreement;

/// @abstract 사용자의 성별
/// @discussion 카카오계정에 등록된 사용자의 성별 정보가 제공됩니다.<br>
///             gender는 사용자의 동의를 받지 않은 경우 nil이 반환됩니다.<br>
///             gender가 nil이면 genderNeedsAgreement 속성 값을 확인하여 사용자에게 정보 제공에 대한 동의를 요청하고 정보 획득을 시도해 볼 수 있습니다.<br>
///             동의를 받은 후 [KOSessionTask userMeTaskWithCompletion:]를 다시 호출하면 gender 값이 반환됩니다.<br>
/// @see genderNeedsAgreement
@property (readonly) KOUserGender gender;

/// @abstract gender 제공에 대한 사용자 동의 필요 여부
/// @discussion gender 가 nil로 내려왔는데 정보를 제공받기 원한다면 이 값을 확인해야 합니다.<br>
///             true이면 [KOSession updateScopes:completionHandler:] 메소드로 사용자 동의를 받고 [KOSessionTask userMeTaskWithCompletion:]를 재요청하여 성별 정보를 받을 수 있습니다. 개발자사이트 동의항목 설정에서 수집 기능이 활성화된 경우 사용자로부터 해당 정보를 수집합니다.<br>
///             성별 동의항목에 대한 scope ID는 "gender"입니다.<br>
/// @see gender
@property (readonly) BOOL genderNeedsAgreement;

/// @property ci
/// @abstract 사용자 연계정보
/// @discussion 카카오계정에 등록된 사용자의 ci가 제공됩니다. (base64형식)<br>
///             ci는 사용자의 동의를 받지 않은 경우 nil이 반환됩니다.<br>
///             ci가 nil이면 ciNeedsAgreement 속성 값을 확인하여 사용자에게 정보 제공에 대한 동의를 요청하고 정보 획득을 시도해 볼 수 있습니다.<br>
///             동의를 받은 후 [KOSessionTask userMeTaskWithCompletion:]를 다시 호출하면 ci 값이 반환됩니다.<br>
/// @see ciNeedsAgreement
@property (readonly, nullable) NSString *ci;

/// @abstract ci 제공에 대한 사용자 동의 필요 여부
/// @discussion ci 가 nil로 내려왔는데 정보를 제공받기 원한다면 이 값을 확인해야 합니다.<br>
///             true이면 [KOSession updateScopes:completionHandler:] 메소드로 사용자 동의를 받고 [KOSessionTask userMeTaskWithCompletion:]를 재요청하여 ci 정보를 받을 수 있습니다. 개발자사이트 동의항목 설정에서 수집 기능이 활성화된 경우 사용자로부터 해당 정보를 수집합니다.<br>
///             ci 동의항목에 대한 scope ID는 "account_ci"입니다.<br>
/// @see ci
@property (readonly) BOOL ciNeedsAgreement;

/// @abstract 사용자가 ci를 획득한 시간.
/// @discussion 카카오계정에 등록된 사용자의 ci획득시간이 제공됩니다.
/// @see ci
@property (readonly, nullable) NSDate *ciAuthenticatedAt;

/// @abstract 실명
/// @discussion 카카오계정에 등록된 사용자의 실명이 제공됩니다.<br>
///             이 값은 사용자의 동의를 받지 않은 경우 nil이 반환됩니다.<br>
///             값이 nil이면 legalNameNeedsAgreement 속성 값을 확인하여 사용자에게 정보 제공에 대한 동의를 요청하고 정보 획득을 시도해 볼 수 있습니다.<br>
///             동의를 받은 후 [KOSessionTask userMeTaskWithCompletion:]를 다시 호출하면 값이 반환됩니다.<br>
/// @see legalNameNeedsAgreement
@property (readonly, nullable) NSString *legalName;

/// @abstract legalName 제공에 대한 사용자 동의 필요 여부
/// @discussion legalName 이 nil로 내려왔는데 정보를 제공받기 원한다면 이 값을 확인해야 합니다.<br>
///             true이면 [KOSession updateScopes:completionHandler:] 메소드로 사용자 동의를 받고 [KOSessionTask userMeTaskWithCompletion:]를 재요청하여 실명 정보를 받을 수 있습니다. 개발자사이트 동의항목 설정에서 수집 기능이 활성화된 경우 사용자로부터 해당 정보를 수집합니다.<br>
///             실명 동의항목에 대한 scope ID는 "legal_name"입니다.<br>
/// @see legalName
@property (readonly) BOOL legalNameNeedsAgreement;

/// @abstract 법정생년월일
/// @discussion 카카오계정에 등록된 사용자의 법정생년월일 정보가 제공됩니다.<br>
///             이 값은 사용자의 동의를 받지 않은 경우 nil이 반환됩니다.<br>
///             값이 nil이면 legalBirthDateNeedsAgreement 속성 값을 확인하여 사용자에게 정보 제공에 대한 동의를 요청하고 정보 획득을 시도해 볼 수 있습니다.<br>
///             동의를 받은 후 [KOSessionTask userMeTaskWithCompletion:]를 다시 호출하면 값이 반환됩니다.<br>
/// @see legalBirthDateNeedsAgreement
@property (readonly, nullable) NSString *legalBirthDate;

/// @abstract legalBirthDate 제공에 대한 사용자 동의 필요 여부
/// @discussion legalBirthDate 가 nil로 내려왔는데 정보를 제공받기 원한다면 이 값을 확인해야 합니다.<br>
///             true이면 [KOSession updateScopes:completionHandler:] 메소드로 사용자 동의를 받고 [KOSessionTask userMeTaskWithCompletion:]를 재요청하여 법정생년월일 정보를 받을 수 있습니다. 개발자사이트 동의항목 설정에서 수집 기능이 활성화된 경우 사용자로부터 해당 정보를 수집합니다.<br>
///             법정생년월일 동의항목에 대한 scope ID는 "legal_birth_date"입니다.<br>
/// @see legalBirthDate
@property (readonly) BOOL legalBirthDateNeedsAgreement;

/// @abstract 법정성별
/// @discussion 카카오계정에 등록된 사용자의 법정성별 정보가 제공됩니다.<br>
///             이 값은 사용자의 동의를 받지 않은 경우 nil이 반환됩니다.<br>
///             값이 nil이면 legalGenderNeedsAgreement 속성 값을 확인하여 사용자에게 정보 제공에 대한 동의를 요청하고 정보 획득을 시도해 볼 수 있습니다.<br>
///             동의를 받은 후 [KOSessionTask userMeTaskWithCompletion:]를 다시 호출하면 값이 반환됩니다.<br>
/// @see legalGenderNeedsAgreement
@property (readonly) KOUserGender legalGender;

/// @abstract legalGender 제공에 대한 사용자 동의 필요 여부
/// @discussion legalGender 가 nil로 내려왔는데 정보를 제공받기 원한다면 이 값을 확인해야 합니다.<br>
///             true이면 [KOSession updateScopes:completionHandler:] 메소드로 사용자 동의를 받고 [KOSessionTask userMeTaskWithCompletion:]를 재요청하여 법정성별 정보를 받을 수 있습니다. 개발자사이트 동의항목 설정에서 수집 기능이 활성화된 경우 사용자로부터 해당 정보를 수집합니다.<br>
///             법정성별 동의항목에 대한 scope ID는 "legal_gender"입니다.<br>
/// @see legalGender
@property (readonly) BOOL legalGenderNeedsAgreement;

/// @abstract 내국인 여부
/// @discussion 카카오계정에 등록된 사용자의 내국인 여부 정보가 제공됩니다.<br>
///             이 값은 사용자의 동의를 받지 않은 경우 nil이 반환됩니다.<br>
///             값이 nil이면 isKoreanNeedsAgreement 속성 값을 확인하여 사용자에게 정보 제공에 대한 동의를 요청하고 정보 획득을 시도해 볼 수 있습니다.<br>
///             동의를 받은 후 [KOSessionTask userMeTaskWithCompletion:]를 다시 호출하면 값이 반환됩니다.<br>
/// @see isKoreanNeedsAgreement
@property (readonly) KOOptionalBoolean isKorean;

/// @abstract isKorean 제공에 대한 사용자 동의 필요 여부
/// @discussion isKorean 가 nil로 내려왔는데 정보를 제공받기 원한다면 이 값을 확인해야 합니다.<br>
///             true이면 [KOSession updateScopes:completionHandler:] 메소드로 사용자 동의를 받고 [KOSessionTask userMeTaskWithCompletion:]를 재요청하여 내국인 여부 정보를 받을 수 있습니다. 개발자사이트 동의항목 설정에서 수집 기능이 활성화된 경우 사용자로부터 해당 정보를 수집합니다.<br>
///             내국인 여부 동의항목에 대한 scope ID는 "is_korean"입니다.<br>
/// @see isKorean
@property (readonly) BOOL isKoreanNeedsAgreement;




- (nonnull NSDictionary<NSString *, id> *)dictionary;




#pragma mark - Deprecated


@property (readonly) KOOptionalBoolean hasEmail DEPRECATED_MSG_ATTRIBUTE("emailNeedsAgreement 프로퍼티로 대체 되었습니다.");
@property (readonly) KOOptionalBoolean hasPhoneNumber DEPRECATED_MSG_ATTRIBUTE("phoneNumberNeedsAgreement 프로퍼티로 대체 되었습니다.");
@property (readonly) KOOptionalBoolean hasAgeRange DEPRECATED_MSG_ATTRIBUTE("ageRangeNeedsAgreement 프로퍼티로 대체 되었습니다.");
@property (readonly) KOOptionalBoolean hasBirthday DEPRECATED_MSG_ATTRIBUTE("birthdayNeedsAgreement 프로퍼티로 대체 되었습니다.");
@property (readonly) KOOptionalBoolean hasGender DEPRECATED_MSG_ATTRIBUTE("genderNeedsAgreement 프로퍼티로 대체 되었습니다.");
- (BOOL)needsScopeAccountEmail DEPRECATED_MSG_ATTRIBUTE("emailNeedsAgreement 프로퍼티로 대체 되었습니다.");
- (BOOL)needsScopePhoneNumber DEPRECATED_MSG_ATTRIBUTE("phoneNumberNeedsAgreement 프로퍼티로 대체 되었습니다.");
- (BOOL)needsScopeAgeRange DEPRECATED_MSG_ATTRIBUTE("ageRangeNeedsAgreement 프로퍼티로 대체 되었습니다.");
- (BOOL)needsScopeBirthday DEPRECATED_MSG_ATTRIBUTE("birthdayNeedsAgreement 프로퍼티로 대체 되었습니다.");
- (BOOL)needsScopeGender DEPRECATED_MSG_ATTRIBUTE("genderNeedsAgreement 프로퍼티로 대체 되었습니다.");
- (BOOL)needsScopeIsKakaotalkUser DEPRECATED_MSG_ATTRIBUTE("isKakaotalkUserNeedsAgreement 프로퍼티로 대체 되었습니다.");

@end

NS_ASSUME_NONNULL_END
