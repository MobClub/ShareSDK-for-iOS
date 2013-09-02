//
//  SSLinkedInSiteStandardProfileRequest.h
//  LinkedInConnection
//
//  Created by 冯 鸿杰 on 13-8-9.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

@interface SSLinkedInSiteStandardProfileRequest : SSCDataObject

@property (nonatomic,readonly) NSString *url;

+ (SSLinkedInSiteStandardProfileRequest *)siteStandardProfileRequestWithResponse:(NSDictionary *)response;

@end
