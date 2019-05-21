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

/*!
 * @header KOUserMe.h
 * @abstract 사용자 정보 요청(user/me) API로 얻어오는 사용자 정보 관련 클래스
 */

#import <Foundation/Foundation.h>
#import "KOTalkMessageSending.h"
#import "KOSession.h"

NS_ASSUME_NONNULL_BEGIN

@class KOUserMeAccount;

/*!
 * @class KOUserMe
 * @abstract 사용자 정보를 나타내는 최상위 클래스. ID, 카카오계정 정보, 프로퍼티 등으로 구성됩니다.
 */
@interface KOUserMe : NSObject <NSCopying, KOTalkMessageSending>

/*!
 * @property hasSignedUp
 * @abstract 현재 로그인한 사용자가 앱에 연결(signup)되어 있는지 여부
 * @discussion 사용자관리 설정에서 자동연결 옵션을 off한 앱에서만 사용되는 값입니다. 자동연결의 기본값은 on이며 이 경우 값이 null로 반환되고 이미 연결되어 있음을 의미합니다.
 */
@property (readonly) KOOptionalBoolean hasSignedUp;
/*!
 * @property ID
 * @abstract 사용자의 고유 아이디
 * @discussion 사용자 ID는 앱 연결(signup)을 기준으로 발급됩니다.<br>
 *             1. 최초 로그인했을 때 발급<br>
 *             2. 자동연결을 off한 상태로 signup 호출에 성공했을 때 발급<br>
 *             3. 연결해제(unlink) 이후 1,2번 작업을 다시 수행하면 다른 값으로 재발급
 */
@property (readonly, nullable) NSString *ID;
/*!
 * @property account
 * @abstract 로그인한 카카오계정 정보. 이메일 등
 * @seealso KOUserMeAccount
 */
@property (readonly, nullable) KOUserMeAccount *account;
/*!
 * @property nickname
 * @abstract 사용자의 닉네임
 * @discussion properties에서 "nickname" 값을 가져옵니다.<br>
 *             초기 값은 개발자사이트의 사용자 관리 > 앱 연동 설정에 따라 카카오톡 또는 카카오스토리에 설정된 닉네임으로 저장되며 이후 해당 프로필 정보와 동기화되지 않습니다.
 *             카카오톡이나 카카오스토리의 최신 프로필 정보를 가져오려면 talkProfileTaskWithCompletionHandler:, storyProfileTaskWithCompletionHandler: 를 이용해주세요.
 * @seealso properties
 */
@property (readonly, nullable) NSString *nickname;
/*!
 * @property profileImageURL
 * @abstract 원본 프로필 이미지 URL
 * @discussion properties에 있는 "profile_image" 값을 이용하여 생성된 NSURL 인스턴스를 제공합니다.<br>
 *             초기 값은 개발자사이트의 사용자 관리 > 앱 연동 설정에 따라 카카오톡 또는 카카오스토리에 설정된 프로필 이미지 URL로 저장되며 이후 해당 프로필 정보와 동기화되지 않습니다.
 *             카카오톡이나 카카오스토리의 최신 프로필 정보를 가져오려면 talkProfileTaskWithCompletionHandler:, storyProfileTaskWithCompletionHandler: 를 이용해주세요.
 * @seealso properties
 */
@property (readonly, nullable) NSURL *profileImageURL;
/*!
 * @property thumbnailImageURL
 * @abstract 썸네일 이미지 URL
 * @discussion properties에 있는 "thumbnail_image" 값을 이용하여 생성된 NSURL 인스턴스를 제공합니다.<br>
 *             초기 값은 개발자사이트의 사용자 관리 > 앱 연동 설정에 따라 카카오톡 또는 카카오스토리에 설정된 썸네일 이미지 URL로 저장되며 이후 해당 프로필 정보와 동기화되지 않습니다.
 *             카카오톡이나 카카오스토리의 최신 프로필 정보를 가져오려면 talkProfileTaskWithCompletionHandler:, storyProfileTaskWithCompletionHandler: 를 이용해주세요.
 * @seealso properties
 */
@property (readonly, nullable) NSURL *thumbnailImageURL;
/*!
 * @property properties
 * @abstract 앱 별로 제공되는 사용자 정보 데이터베이스
 * @discussion 사용자에 대해 추가 정보를 저장할 수 있도록 데이터베이스를 제공합니다.<br>
 *             개발자사이트의 사용자 관리 > 앱 연동 설정에 따라 카카오톡 또는 카카오스토리에 있는 닉네임과 프로필 이미지 정보를 앱 연결 시점에 복사하여 초기값으로 제공되며 이후 해당 프로필 정보와 동기화되지 않습니다.<br>
 *             1. nickname : 카카오톡 또는 카카오스토리에 설정된 닉네임<br>
 *             2. profile_image : 프로필 이미지 URL 문자열<br>
 *             3. thumbnail_image : 썸네일 사이즈의 프로필 이미지 URL 문자열
 */
@property (readonly, nullable) NSDictionary<NSString *, NSString *> *properties;
/*!
 * @property forPartner
 * @abstract 제휴를 통해 권한이 부여된 특정 앱에서 사용
 */
@property (readonly, nullable) NSDictionary<NSString *, id> *forPartner;

- (nonnull NSDictionary<NSString *, id> *)dictionary;
+ (instancetype)meWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end



/*!
 * @abstract KOUserAgeRange 연령대 정보
 * @constant KOUserAgeRangeNull 연령대 값이 없음
 * @constant KOUserAgeRangeType15 15세~19세
 * @constant KOUserAgeRangeType20 20세~29세
 * @constant KOUserAgeRangeType30 30세~39세
 * @constant KOUserAgeRangeType40 40세~49세
 * @constant KOUserAgeRangeType50 50세~59세
 * @constant KOUserAgeRangeType60 60세~69세
 * @constant KOUserAgeRangeType70 70세~79세
 * @constant KOUserAgeRangeType80 80세~89세
 * @constant KOUserAgeRangeType90 90세 이상
 */
typedef NS_ENUM(NSUInteger, KOUserAgeRange) {
    KOUserAgeRangeNull,
    KOUserAgeRangeType15,
    KOUserAgeRangeType20,
    KOUserAgeRangeType30,
    KOUserAgeRangeType40,
    KOUserAgeRangeType50,
    KOUserAgeRangeType60,
    KOUserAgeRangeType70,
    KOUserAgeRangeType80,
    KOUserAgeRangeType90,
};

/*!
 * @abstract KOUserGender 성별 정보
 * @constant KOUserGenderNull 성별 값이 없음
 * @constant KOUserGenderMale 남자
 * @constant KOUserGenderFemale 여자
 */
typedef NS_ENUM(NSUInteger, KOUserGender) {
    KOUserGenderNull,
    KOUserGenderMale,
    KOUserGenderFemale,
};

/*!
 * @class KOUserMeAccount
 * @abstract 카카오계정 정보를 나타내는 클래스
 * @discussion 사용자의 동의를 받지 않은 개인정보는 값이 반환되지 않을 수 있습니다.
 *             동의를 받지 않아도 값의 존재여부는 has- 프로퍼티로 확인할 수 있습니다.<br>
 *             값이 내려오지 않은 정보의 has- 프로퍼티가 true인 경우 사용자 동의가 필요한 상황임을 의미하며 KOSession의 updateScopes 메소드를 이용하여 동의를 받을 수 있습니다. 동의를 받은 후 user/me를 다시 호출하면 해당 값이 반환될 것입니다.<br>
 *             has- 프로퍼티가 false라면 현재 로그인한 계정에 해당 정보가 등록되지 않은 상태이며 사용자의 동의도 요청할 수 없습니다.
 */
@interface KOUserMeAccount : NSObject <NSCopying>

/*!
 * @property email
 * @abstract 카카오계정에 등록한 이메일 정보
 * @discussion 7.2.0 이상 카카오톡을 설치하고 전화번호 인증을 완료하면 이메일이 없는 카카오계정이 생성됩니다. 해당 카카오계정으로 간편로그인이나 전화번호 로그인을 할 경우 이메일 값이 nil로 반환됩니다.<br>
 *             이메일이 있는 카카오계정이라도 사용자로부터 이메일 제공에 대한 동의를 받지 않으면 값이 nil로 반환됩니다. 등록된 이메일이 존재하지만 동의를 받지 않은 경우 hasEmail값이 true이고 사용자에게 이메일 제공에 대한 동의를 요청할 수 있습니다.
 * @seealso hasEmail
 * @seealso isEmailVerified
 */
@property (readonly, nullable) NSString *email;
/*!
 * @property isEmailVerified
 * @abstract 카카오계정에 이메일 등록 시 이메일 인증을 받았는지 여부
 * @seealso email
 */
@property (readonly) KOOptionalBoolean isEmailVerified;
/*!
 * @property hasEmail
 * @abstract 이메일 보유 여부
 * @discussion email이 nil이고 hasEmail이 true이면 KOSession의 updateScopes 메소드를 이용하여 사용자로부터 이메일 제공에 대한 동의를 받을 수 있습니다.<br>
 *             이메일 제공동의 scope ID는 "account_email"입니다.
 * @seealso email
 */
@property (readonly) KOOptionalBoolean hasEmail;



/*!
 * @property isKakaotalkUser
 * @abstract 카카오톡 서비스 가입 여부
 * @discussion 제휴를 통해 권한이 부여된 특정 앱에서만 획득할 수 있습니다. 제휴되어 있지 않은 경우 null이 반환됩니다.<br>
 *             카카오톡 카카오계정 설정에 연결되어 있는 카카오계정은 true가 반환됩니다.<br>
 *             사용자에게 동의를 받지 않았을 경우 null이 반환되며 KOSession의 updateScopes 메소드를 이용하여 사용자로부터 카카오톡 가입 여부에 대한 동의를 받을 수 있습니다.<br>
 *             카카오톡 서비스 가입 여부 scope ID는 "is_kakaotalk_user"입니다.
 */
@property (readonly) KOOptionalBoolean isKakaotalkUser;



/*!
 * @property phoneNumber
 * @abstract 카카오톡에서 인증한 전화번호
 * @discussion 제휴를 통해 권한이 부여된 특정 앱에서만 획득할 수 있습니다.<br>
 *             카카오톡에 연결되어 있지 않은 카카오계정은 전화번호가 존재하지 않습니다.
 * @seealso hasPhoneNumber
 */
@property (readonly, nullable) NSString *phoneNumber;
/*!
 * @property hasPhoneNumber
 * @abstract 전화번호 보유 여부
 * @discussion 제휴를 통해 권한이 부여된 특정 앱에서만 획득할 수 있습니다. 제휴되어 있지 않은 경우 null이 반환됩니다.<br>
 *             phoneNumber가 nil이고 hasPhoneNumber가 true이면 KOSession의 updateScopes 메소드를 이용하여 사용자로부터 전화번호 제공에 대한 동의를 받을 수 있습니다.<br>
 *             전화번호 제공동의 scope ID는 "phone_number"입니다.
 * @seealso phoneNumber
 */
@property (readonly) KOOptionalBoolean hasPhoneNumber;



/*!
 * @property displayID
 * @abstract 카카오계정의 대표 정보. 이메일 또는 전화번호
 * @discussion 제휴를 통해 권한이 부여된 특정 앱에서만 획득할 수 있습니다. 계정 상태에 이상이 생긴 경우 텍스트 일부가 마스킹 처리되어 반환됩니다.
 * @seealso email
 * @seealso phoneNumber
 */
@property (readonly, nullable) NSString *displayID;



/*!
 * @property ageRange
 * @abstract 사용자의 연령대 정보
 * @discussion 카카오계정에 등록된 사용자의 생일 정보를 기반으로 제공됩니다.<br>
 *             카카오톡 더보기 > 설정 > 개인/보안 > 카카오계정 메뉴로 들어가거나 https://accounts.kakao.com 에 접속하여 정보를 등록할 수 있습니다.
 * @seealso hasAgeRange
 */
@property (readonly) KOUserAgeRange ageRange;
/*!
 * @property hasAgeRange
 * @abstract 카카오계정의 연령대 보유 여부
 * @discussion birthday가 nil이고 hasBirthday이 true이면 KOSession의 updateScopes 메소드를 이용하여 사용자로부터 연령대 제공에 대한 동의를 받을 수 있습니다.<br>
 *             연령대 제공동의 scope ID는 "age_range"입니다.
 * @seealso ageRange
 */
@property (readonly) KOOptionalBoolean hasAgeRange;
/*!
 * @property birthday
 * @abstract 사용자의 생일
 * @discussion 카카오계정에 등록된 사용자의 생일 정보를 기반으로 제공됩니다. (MMDD형식)<br>
 *             카카오톡 더보기 > 설정 > 개인/보안 > 카카오계정 메뉴로 들어가거나 https://accounts.kakao.com 에 접속하여 정보를 등록할 수 있습니다.
 * @seealso hasBirthday
 */
@property (readonly, nullable) NSString *birthday;
/*!
 * @property hasBirthday
 * @abstract 카카오계정의 생일 보유 여부
 * @discussion birthday가 nil이고 hasBirthday이 true이면 KOSession의 updateScopes 메소드를 이용하여 사용자로부터 생일 제공에 대한 동의를 받을 수 있습니다.<br>
 *             생일 제공동의 scope ID는 "birthday"입니다.
 * @seealso birthday
 */
@property (readonly) KOOptionalBoolean hasBirthday;
/*!
 * @property gender
 * @abstract 사용자 카카오계정의 성별
 * @discussion 카카오계정에 등록된 사용자의 성별 정보가 제공됩니다.<br>
 *             카카오톡 더보기 > 설정 > 개인/보안 > 카카오계정 메뉴로 들어가거나 https://accounts.kakao.com 에 접속하여 정보를 등록할 수 있습니다.
 * @seealso hasGender
 */
@property (readonly) KOUserGender gender;
/*!
 * @property hasGender
 * @abstract 카카오계정의 성별 보유 여부
 * @discussion gender가 nil이고 hasGender이 true이면 KOSession의 updateScopes 메소드를 이용하여 사용자로부터 성별 제공에 대한 동의를 받을 수 있습니다.<br>
 *             생일 제공동의 scope ID는 "gender"입니다.
 * @seealso gender
 */
@property (readonly) KOOptionalBoolean hasGender;

/*!
 * @method needsScopeAccountEmail
 * @abstract 이메일을 가져오기 위한 사용자 동의 "account_email" 필요 여부
 * @seealso email
 * @seealso updateScopes:completionHandler:
 */
- (BOOL)needsScopeAccountEmail;
/*!
 * @method needsScopePhoneNumber
 * @abstract 전화번호를 가져오기 위한 사용자 동의 "phone_number" 필요 여부
 * @seealso phoneNumber
 * @seealso updateScopes:completionHandler:
 */
- (BOOL)needsScopePhoneNumber;
/*!
 * @method needsScopeAgeRange
 * @abstract 연령대 정보를 가져오기 위한 사용자 동의 "age_range" 필요 여부
 * @seealso ageRange
 * @seealso updateScopes:completionHandler:
 */
- (BOOL)needsScopeAgeRange;
/*!
 * @method needsScopeBirthday
 * @abstract 생일을 가져오기 위한 사용자 동의 "birthday" 필요 여부
 * @seealso birthday
 * @seealso updateScopes:completionHandler:
 */
- (BOOL)needsScopeBirthday;
/*!
 * @method needsScopeGender
 * @abstract 성별을 가져오기 위한 사용자 동의 "gender" 필요 여부
 * @seealso gender
 * @seealso updateScopes:completionHandler:
 */
- (BOOL)needsScopeGender;
/*!
 * @method needsScopeIsKakaotalkUser
 * @abstract 카카오톡 가입 여부를 가져오기 위한 사용자 동의 "is_kakaotalk_user" 필요 여부
 * @seealso isKakaotalkUser
 * @seealso updateScopes:completionHandler:
 */
- (BOOL)needsScopeIsKakaotalkUser;

- (nonnull NSDictionary<NSString *, id> *)dictionary;
+ (instancetype)accountWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
