//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSRenRenHometown.h"
#import "SSRenRenWorkInfo.h"
#import "SSRenRenUniversityInfo.h"
#import "SSRenRenHighSchoolInfo.h"
#import "SSRenRenCredential.h"
#import <ShareSDKCoreService/ISSCUserDescriptor.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>

/**
 *	@brief	用户信息
 */
@interface SSRenRenUser : NSObject <NSCoding,
                                    ISSCDataObject>
{
@private
    NSMutableDictionary *_sourceData;
    SSRenRenCredential *_credential;
}

/**
 *	@brief	表示用户id
 */
@property (nonatomic,readonly) long long uid;

/**
 *	@brief	表示用户名
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	表示性别，值1表示男性；值0表示女性
 */
@property (nonatomic,readonly) NSInteger sex;

/**
 *	@brief	表示是否为星级用户，值“1”表示“是”；值“0”表示“不是”
 */
@property (nonatomic,readonly) NSInteger star;

/**
 *	@brief	表示是否为vip用户，值1表示是；值0表示不是
 */
@property (nonatomic,readonly) NSInteger zidou;

/**
 *	@brief	表示是否为vip用户等级，前提是zidou节点必须为1
 */
@property (nonatomic,readonly) NSInteger vip;

/**
 *	@brief	表示出生时间，格式为：yyyy-mm-dd，需要自行格式化日期显示格式。注：年份60后，实际返回1760-mm-dd；70后，返回1770-mm-dd；80后，返回1780-mm-dd；90后，返回1790-mm-dd
 */
@property (nonatomic,readonly) NSString *birthday;

/**
 *	@brief	用户经过验证的email的信息字符串：email通过了connect.registerUsers接口。字符串包含的email经过了crc32和md5的编码
 */
@property (nonatomic,readonly) NSString *emailHash;

/**
 *	@brief	表示头像链接 50*50大小
 */
@property (nonatomic,readonly) NSString *tinyurl;

/**
 *	@brief	表示头像链接 100*100大小
 */
@property (nonatomic,readonly) NSString *headurl;

/**
 *	@brief	表示头像链接 200*200大小
 */
@property (nonatomic,readonly) NSString *mainurl;

/**
 *	@brief	表示家乡信息
 */
@property (nonatomic,readonly) SSRenRenHometown *hometownLocation;

/**
 *	@brief	表示工作信息
 */
@property (nonatomic,readonly) NSArray *workHistory;

/**
 *	@brief	表示就读大学信息
 */
@property (nonatomic,readonly) NSArray *universityHistory;

/**
 *	@brief	表示就读高中学校信息
 */
@property (nonatomic,readonly) SSRenRenHighSchoolInfo *hsInfo;

/**
 *	@brief	源数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;

/**
 *	@brief	授权凭证
 */
@property (nonatomic,retain) SSRenRenCredential *credential;

/**
 *	@brief	创建用户信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	用户信息
 */
+ (SSRenRenUser *)userWithResponse:(NSDictionary *)response;

/**
 *	@brief	创建用户信息描述器
 *
 *	@return	描述器对象
 */
- (id<ISSCUserDescriptor>)descriptor;

@end
