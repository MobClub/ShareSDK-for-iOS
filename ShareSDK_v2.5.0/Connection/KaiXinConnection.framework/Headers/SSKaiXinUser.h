//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSKaiXinCredential.h"
#import <ShareSDKCoreService/ISSCUserDescriptor.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>

/**
 *	@brief	用户信息
 */
@interface SSKaiXinUser : NSObject <NSCoding,
                                    ISSCDataObject>
{
@private
    NSMutableDictionary *_sourceData;
    SSKaiXinCredential *_credential;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;

/**
 *	@brief	授权凭证
 */
@property (nonatomic,retain) SSKaiXinCredential *credential;

/**
 *	@brief	用户ID
 */
@property (nonatomic,readonly) NSString *uid;

/**
 *	@brief	用户名
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	性别 0:男 1:女
 */
@property (nonatomic,readonly) NSString *gender;

/**
 *	@brief	家乡
 */
@property (nonatomic,readonly) NSString *hometown;

/**
 *	@brief	现居住地
 */
@property (nonatomic,readonly) NSString *city;

/**
 *	@brief	状态 0:其它 1:学生 2:已工作
 */
@property (nonatomic,readonly) NSString *status;

/**
 *	@brief	头像120 x 120
 */
@property (nonatomic,readonly) NSString *logo120;

/**
 *	@brief	头像50 x 50
 */
@property (nonatomic,readonly) NSString *logo50;

/**
 *	@brief	生日
 */
@property (nonatomic,readonly) NSString *birthday;

/**
 *	@brief	体型 0:保密 1:苗条 2:匀称 3:健壮 4:高大 5:小巧 6:丰满 7:高挑 8:较胖 9:较瘦 10:运动型
 */
@property (nonatomic,readonly) NSString *bodyform;

/**
 *	@brief	血型 0:没有填写 1:O型血 2:A型血 3:B型血 4:AB型血 5:稀有血型
 */
@property (nonatomic,readonly) NSString *blood;

/**
 *	@brief	婚姻状态 0:没有填写 1:单身 2:恋爱中 3:订婚 4:已婚 5:离异
 */
@property (nonatomic,readonly) NSString *marriage;

/**
 *	@brief	希望结交
 */
@property (nonatomic,readonly) NSString *trainwith;

/**
 *	@brief	兴趣爱好
 */
@property (nonatomic,readonly) NSString *interest;

/**
 *	@brief	喜欢的书籍
 */
@property (nonatomic,readonly) NSString *favbook;

/**
 *	@brief	喜欢的电影
 */
@property (nonatomic,readonly) NSString *favmovie;

/**
 *	@brief	喜欢的电视剧
 */
@property (nonatomic,readonly) NSString *favtv;

/**
 *	@brief	偶像
 */
@property (nonatomic,readonly) NSString *idol;

/**
 *	@brief	座右铭
 */
@property (nonatomic,readonly) NSString *motto;

/**
 *	@brief	愿望列表
 */
@property (nonatomic,readonly) NSString *wishlist;

/**
 *	@brief	介绍
 */
@property (nonatomic,readonly) NSString *intro;

/**
 *	@brief	教育经历
 */
@property (nonatomic,readonly) NSArray *education;

/**
 *	@brief	工作经历
 */
@property (nonatomic,readonly) NSArray *career;

/**
 *	@brief	是否公共主页 0:否 1:是
 */
@property (nonatomic,readonly) NSString *isStar;

/**
 *	@brief	用户的姓名拼音
 */
@property (nonatomic,readonly) NSString *pinyin;

/**
 *	@brief	用户是否在线 0:不在线 1:在线
 */
@property (nonatomic,readonly) NSString *online;

/**
 *	@brief	创建用户信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	用户信息
 */
+ (SSKaiXinUser *)userWithResponse:(NSDictionary *)response;

/**
 *	@brief	创建用户信息描述器
 *
 *	@return	描述器对象
 */
- (id<ISSCUserDescriptor>)descriptor;

@end
