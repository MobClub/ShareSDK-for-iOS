//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSTencentWeiboMusic.h"
#import "SSTencentWeiboVideo.h"
#import <ShareSDKCoreService/ShareSDKCoreService.h>

/**
 *	@brief	微博信息
 */
@interface SSTencentWeiboTweet : NSObject <NSCoding,
                                           ISSCDataObject>
{
@private
    NSMutableDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;

/**
 *	@brief	微博ID
 */
@property (nonatomic,readonly) NSString *Id;

/**
 *	@brief	发表时间
 */
@property (nonatomic,readonly) CGFloat timestamp;

/**
 *	@brief	城市码
 */
@property (nonatomic,readonly) NSString *cityCode;

/**
 *	@brief	国家码
 */
@property (nonatomic,readonly) NSString *countryCode;

/**
 *	@brief	心情类型
 */
@property (nonatomic,readonly) NSInteger emotiontype;

/**
 *	@brief	心情图片url
 */
@property (nonatomic,readonly) NSString *emotionurl;

/**
 *	@brief	来源
 */
@property (nonatomic,readonly) NSString *from;

/**
 *	@brief	来源url
 */
@property (nonatomic,readonly) NSString *fromurl;

/**
 *	@brief	地理位置信息
 */
@property (nonatomic,readonly) NSString *geo;

/**
 *	@brief	图片url列表
 */
@property (nonatomic,readonly) NSArray *image;

/**
 *	@brief	纬度
 */
@property (nonatomic,readonly) NSString *latitude;

/**
 *	@brief	发表者所在地
 */
@property (nonatomic,readonly) NSString *location;

/**
 *	@brief	经度
 */
@property (nonatomic,readonly) NSString *longitude;

/**
 *	@brief	音频信息
 */
@property (nonatomic,readonly) SSTencentWeiboMusic *music;

/**
 *	@brief	原始内容
 */
@property (nonatomic,readonly) NSString *origtext;

/**
 *	@brief	省份码
 */
@property (nonatomic,readonly) NSString *provinceCode;

/**
 *	@brief	是否自已发的的微博，0-不是，1-是
 */
@property (nonatomic,readonly) BOOL isSelf;

/**
 *	@brief	微博状态，0-正常，1-系统删除，2-审核中，3-用户删除，4-根删除
 */
@property (nonatomic,readonly) NSInteger status;

/**
 *	@brief	微博内容
 */
@property (nonatomic,readonly) NSString *text;

/**
 *	@brief	微博类型，1-原创发表，2-转载，3-私信，4-回复，5-空回，6-提及，7-评论
 */
@property (nonatomic,readonly) NSInteger type;

/**
 *	@brief	视频信息
 */
@property (nonatomic,readonly) SSTencentWeiboVideo *video;


/**
 *	@brief	创建微博信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	微博信息
 */
+ (SSTencentWeiboTweet *)tweetWithResponse:(NSDictionary *)response;

@end
