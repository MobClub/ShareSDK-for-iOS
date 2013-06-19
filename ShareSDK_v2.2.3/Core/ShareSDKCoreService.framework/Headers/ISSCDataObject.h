//
//  ISSCDataObject.h
//  ShareSDKCoreService
//
//  Created by 冯 鸿杰 on 13-4-28.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	数据对象协议，用于描述一个第三方平台的数据模型协议
 */
@protocol ISSCDataObject <NSObject>

@required

- (NSDictionary *)sourceData;

@end
