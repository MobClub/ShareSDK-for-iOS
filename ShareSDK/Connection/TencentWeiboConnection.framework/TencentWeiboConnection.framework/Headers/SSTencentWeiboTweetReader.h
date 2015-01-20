///#begin zh-cn
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end
///#begin en
//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <Foundation/Foundation.h>
#import "SSTencentWeiboMusicReader.h"
#import "SSTencentWeiboVideoReader.h"


///#begin zh-cn
/**
 *	@brief	微博信息
 */
///#end
///#begin en
/**
 *	@brief	Tweet Reader.
 */
///#end
@interface SSTencentWeiboTweetReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

///#begin zh-cn
/**
 *	@brief	源数据
 */
///#end
///#begin en
/**
 *	@brief	Raw data.
 */
///#end
@property (nonatomic,readonly) NSDictionary *sourceData;

///#begin zh-cn
/**
 *	@brief	微博ID
 */
///#end
///#begin en
/**
 *	@brief	tweet id.
 */
///#end
@property (nonatomic,readonly) NSString *Id;

///#begin zh-cn
/**
 *	@brief	发表时间
 */
///#end
///#begin en
/**
 *	@brief	Posted time.
 */
///#end
@property (nonatomic,readonly) CGFloat timestamp;

///#begin zh-cn
/**
 *	@brief	城市码
 */
///#end
///#begin en
/**
 *	@brief	City code.
 */
///#end
@property (nonatomic,readonly) NSString *cityCode;

///#begin zh-cn
/**
 *	@brief	国家码
 */
///#end
///#begin en
/**
 *	@brief	Country code.
 */
///#end
@property (nonatomic,readonly) NSString *countryCode;

///#begin zh-cn
/**
 *	@brief	心情类型
 */
///#end
///#begin en
/**
 *	@brief	Emotion type.
 */
///#end
@property (nonatomic,readonly) NSInteger emotiontype;

///#begin zh-cn
/**
 *	@brief	心情图片url
 */
///#end
///#begin en
/**
 *	@brief	Emotion URL.
 */
///#end
@property (nonatomic,readonly) NSString *emotionurl;

///#begin zh-cn
/**
 *	@brief	来源
 */
///#end
///#begin en
/**
 *	@brief	Source.
 */
///#end
@property (nonatomic,readonly) NSString *from;

///#begin zh-cn
/**
 *	@brief	来源url
 */
///#end
///#begin en
/**
 *	@brief	From URL
 */
///#end
@property (nonatomic,readonly) NSString *fromurl;

///#begin zh-cn
/**
 *	@brief	地理位置信息
 */
///#end
///#begin en
/**
 *	@brief	Geographic information
 */
///#end
@property (nonatomic,readonly) NSString *geo;

///#begin zh-cn
/**
 *	@brief	图片url列表
 */
///#end
///#begin en
/**
 *	@brief	image URL list.
 */
///#end
@property (nonatomic,readonly) NSArray *image;

///#begin zh-cn
/**
 *	@brief	纬度
 */
///#end
///#begin en
/**
 *	@brief	Latitude.
 */
///#end
@property (nonatomic,readonly) NSString *latitude;

///#begin zh-cn
/**
 *	@brief	发表者所在地
 */
///#end
///#begin en
/**
 *	@brief	Location.
 */
///#end
@property (nonatomic,readonly) NSString *location;

///#begin zh-cn
/**
 *	@brief	经度
 */
///#end
///#begin en
/**
 *	@brief	Longitude
 */
///#end
@property (nonatomic,readonly) NSString *longitude;

///#begin zh-cn
/**
 *	@brief	音频信息
 */
///#end
///#begin en
/**
 *	@brief	Music information.
 */
///#end
@property (nonatomic,readonly) SSTencentWeiboMusicReader *music;

///#begin zh-cn
/**
 *	@brief	原始内容
 */
///#end
///#begin en
/**
 *	@brief	original text.
 */
///#end
@property (nonatomic,readonly) NSString *origtext;

///#begin zh-cn
/**
 *	@brief	省份码
 */
///#end
///#begin en
/**
 *	@brief	Province code.
 */
///#end
@property (nonatomic,readonly) NSString *provinceCode;

///#begin zh-cn
/**
 *	@brief	是否自已发的的微博，0-不是，1-是
 */
///#end
///#begin en
/**
 *	@brief	Whether their own hair tweet, 0 - no, 1 - Yes
 */
///#end
@property (nonatomic,readonly) BOOL isSelf;

///#begin zh-cn
/**
 *	@brief	微博状态，0-正常，1-系统删除，2-审核中，3-用户删除，4-根删除
 */
///#end
///#begin en
/**
 *	@brief	Tweet status, 0 - normal, 1 - system deletes 2 - audit, three - user deletes 4 - root delete
 */
///#end
@property (nonatomic,readonly) NSInteger status;

///#begin zh-cn
/**
 *	@brief	微博内容
 */
///#end
///#begin en
/**
 *	@brief	Content string.
 */
///#end
@property (nonatomic,readonly) NSString *text;

///#begin zh-cn
/**
 *	@brief	微博类型，1-原创发表，2-转载，3-私信，4-回复，5-空回，6-提及，7-评论
 */
///#end
///#begin en
/**
 *	@brief	Tweet type, 1 - Original Post 2 - reprint 3 - private letter 4 - Replies 5 - empty back, 6 - mentioned 7 - Review
 */
///#end
@property (nonatomic,readonly) NSInteger type;

///#begin zh-cn
/**
 *	@brief	视频信息
 */
///#end
///#begin en
/**
 *	@brief	Video information.
 */
///#end
@property (nonatomic,readonly) SSTencentWeiboVideoReader *video;

///#begin zh-cn
/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Raw data.
 */
///#end
- (id)initWithSourceData:(NSDictionary *)sourceData;

///#begin zh-cn
/**
 *	@brief	创建微博信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Create a tweet reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	tweet reader object.
 */
///#end
+ (SSTencentWeiboTweetReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
