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

/*!
 @header KOUser.h
 사용자 정보를 담고 있는 구조체.
 */
#import <Foundation/Foundation.h>
#import "KOUserInfo.h"

/*!
 */
@interface KOUser : KOUserInfo

@property(nonatomic, readonly) NSDictionary *properties;

/*!
 @abstract 사용자에 대한 정보를 얻는다.
 @param key 추출하고자 하는 사용자정보의 key값.
 */
- (id)propertyForKey:(NSString *)key;

+ (instancetype)responseWithDictionary:(NSDictionary *)dictionary;

@end
