//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import "SSInheritValue.h"

#ifndef ShareSDKInterface_ShareSDKDef_h
#define ShareSDKInterface_ShareSDKDef_h

/**
 *	@brief	将ShareType转换为NSNumber类型
 *
 *	@param 	type 	分享平台类型
 */
#define SHARE_TYPE_NUMBER(type) [NSNumber numberWithInteger:type]

/**
 *	@brief	继承指
 */
#define INHERIT_VALUE [SSInheritValue inherit]

/**
 *	@brief	映射分享内容对象的某个属性值
 *
 *	@param 	name 	属性名称
 */
#define MAPPING_VALUE(name) [SSInheritValue inheritWithName:name]


#endif
