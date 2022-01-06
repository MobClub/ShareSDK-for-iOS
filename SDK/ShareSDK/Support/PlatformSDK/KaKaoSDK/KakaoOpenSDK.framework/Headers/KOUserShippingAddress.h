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
#import "KOSession.h"

NS_ASSUME_NONNULL_BEGIN

/// 배송지 타입
typedef NS_ENUM(NSUInteger, KOShippingAddressType) {
    /// 지번 주소
    KOShippingAddressTypeOld,
    /// 도로명 주소
    KOShippingAddressTypeNew,
    /// 알 수 없음
    KOShippingAddressTypeUnknown
};

@class KOShippingAddress;

/// 앱에 가입한 사용자의 배송지 정보 API 응답 클래스
/// @discussion 배송지의 정렬 순서는 기본배송지가 무조건 젤 먼저, 그후에는 배송지 수정된 시각을 기준으로 최신순으로 정렬되어 나가고, 페이지 사이즈를 주어서 여러 페이지를 나누어 조회하거나, 특정 배송지 id만을 지정하여 해당 배송지 정보만을 조회할 수 있다.
@interface KOUserShippingAddress : NSObject

/// @abstract 배송지 정보를 요청한 사용자 아이디
/// @see [KOUserMe ID]
@property (nonatomic, readonly, nullable) NSString *userId;

/// @abstract 사용자의 배송지 정보 리스트
/// @discussion 최신 수정순 (단, 기본 배송지는 수정시각과 상관없이 첫번째에 위치)<br>
///             shippingAddresses 는 사용자의 동의를 받지 않은 경우 nil이 반환됩니다.<br>
///             shippingAddresses 가 nil이면 shippingAddressNeedsAgreement 속성 값을 확인하여 사용자에게 정보 제공에 대한 동의를 요청하고 정보 획득을 시도해 볼 수 있습니다.<br>
///             동의를 받은 후 [KOSessionTask userMeTaskWithCompletion:]를 다시 호출하면 shippingAddresses 값이 반환됩니다.
/// @see KOShippingAddress
/// @see shippingAddressNeedsAgreement
@property (nonatomic, readonly, nullable) NSArray<KOShippingAddress *> *shippingAddresses;

/*!
 * @property shippingAddressNeedsAgreement
 * @abstract shippingAddresses 제공에 대한 사용자 동의 필요 여부
 * @discussion shippingAddressNeedsAgreement 값이 true인 경우 새로운 동의 요청이 가능한 상태이며 [KOSession updateScopes:completionHandler:] 메소드를 이용하여 동의를 받을 수 있습니다.<br>
 *             updateScopes의 파라미터로 전달할 shippingAddresses 동의항목에 대한 scope ID는 "shipping_addresses"입니다.
 * @see shippingAddresses
 */
@property (nonatomic, readonly) BOOL shippingAddressNeedsAgreement;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

/// 배송지 정보 클래스
@interface KOShippingAddress : NSObject

/// @abstract 배송지 ID
@property (nonatomic, readonly, nullable) NSString *shippingAddressId;

/// @abstract 배송지명
@property (nonatomic, readonly, nullable) NSString *name;

/// @abstract 기본 배송지 여부
@property (nonatomic, readonly) KOOptionalBoolean isDefault;

/// @abstract 수정시각의 timestamp
@property (nonatomic, readonly, nullable) NSDate *updatedAt;

/// @abstract 배송지 타입.구주소(지번,번지 주소) 또는 신주소(도로명 주소)
/// @see KOShippingAddressType
@property (nonatomic, readonly) KOShippingAddressType type;

/// @abstract 우편번호 검색시 채워지는 기본 주소
@property (nonatomic, readonly, nullable) NSString *baseAddress;

/// @abstract 기본 주소에 추가하는 상세 주소
@property (nonatomic, readonly, nullable) NSString *detailAddress;

/// @abstract 수령인 이름
@property (nonatomic, readonly, nullable) NSString *receiverName;

/// @abstract (Optional) 수령인 연락처
@property (nonatomic, readonly, nullable) NSString *receiverPhoneNumber1;

/// @abstract (Optional) 수령인 추가 연락처
@property (nonatomic, readonly, nullable) NSString *receiverPhoneNumber2;

/// @abstract 신주소 우편번호
/// @discussion 신주소인 경우에 반드시 존재함
@property (nonatomic, readonly, nullable) NSString *zoneNumber;

/// @abstract 구주소 우편번호
/// @discussion 우편번호를 소유하지 않는 구주소도 존재하여, 구주소인 경우도 해당값이 없을 수 있음
@property (nonatomic, readonly, nullable) NSString *zipCode;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
