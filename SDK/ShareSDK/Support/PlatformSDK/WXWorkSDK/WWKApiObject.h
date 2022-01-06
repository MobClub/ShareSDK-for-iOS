//
//  WWKApiObject.h
//  wxwork
//
//  Created by WXWork on 16/5/25.
//  Copyright © 2019年 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class WWKBaseResp;
@protocol WWKApiSerializable <NSObject>
- (BOOL)deserializeWithDictionary:(NSDictionary *)dict;
@end

@interface WWKBaseObject : NSObject
@property (nonatomic, copy) NSString *bundleID;
@property (nonatomic, copy) NSString *bundleName;
@property (nonatomic, assign) NSUInteger sequence;
@property (nonatomic, readonly, nullable) NSData *serializedData;
@property (nonatomic, readonly, nullable) NSMutableDictionary *serializedDict;
+ (instancetype)deserializeWithData:(NSData *)data appid:(NSString *)appid;
@end

#pragma mark - WWKBaseReq
/*! @brief 该类为企业微信终端SDK所有请求类的基类
 *
 */
@interface WWKBaseReq : WWKBaseObject
- (WWKBaseResp *)respObj; // 对应返回的结构
@end



#pragma mark - WWKBaseResp

extern const int WWKBaseRespErrCodeOK; // 操作成功
extern const int WWKBaseRespErrCodeCancelled; // 操作被取消
extern const int WWKBaseRespErrCodeFailed; // 操作失败
extern const int WWKBaseRespErrCodeNotSupported; // 操作不支持(不能识别请求)
extern const int WWKBaseRespErrCodeLowAppVer; // 操作不支持(用户安装的App版本过低)
extern const int WWKBaseRespErrCodeNoPrivileges; // 没有此API的调用权限
extern const int WWKBaseRespErrCodeInvalidCall; // 调用出错(例如传入参数不正确)
extern const int WWKBaseRespErrCodeNetWork; // 网络出错(例如请求超时)
extern const int WWKBaseRespErrCodeSessonKeyTimeOut; // sessionkey超时

/*! @brief 该类为企业微信终端SDK所有响应类的基类
 *
 */
@interface WWKBaseResp : WWKBaseObject
/** 错误码 */
@property (nonatomic, assign) int errCode;
/** 错误提示字符串 */
@property (nonatomic, retain, nullable) NSString *errStr;
@end

#pragma mark - WWKSendMessageReq

/*!
 * @brief 带在 @c WWKSendMessageReq 中的消息对象基类。实际必须使用其子类
 */
@interface WWKMessageAttachment : NSObject
@end

/*!
 * @brief 文本消息
 */
@interface WWKMessageTextAttachment : WWKMessageAttachment
@property (nonatomic, copy) NSString *text;
@end

/*!
 * @brief 文件消息
 */
@interface WWKMessageFileAttachment : WWKMessageAttachment
@property (nonatomic, copy) NSString *filename;
@property (nonatomic, copy, nullable) NSString *path;
@property (nonatomic, retain, nullable) NSData *data;
@end

/*!
 * @brief 图片消息
 */
@interface WWKMessageImageAttachment : WWKMessageFileAttachment
@end

/*!
 * @brief 视频消息
 */
@interface WWKMessageVideoAttachment : WWKMessageFileAttachment
@end

/*!
 * @brief 链接消息
 */
@interface WWKMessageLinkAttachment : WWKMessageAttachment
@property (nonatomic, copy, nullable) NSString *title; // 不能超过512bytes
@property (nonatomic, copy, nullable) NSString *summary; // 不能超过1k
@property (nonatomic, copy, nullable) NSString *url;
@property (nonatomic, copy, nullable) NSString *iconurl;
@property (nonatomic, retain, nullable) NSData *icon; // 不能超过32K
// 是否使用带 shareTicket 的转发，只有注册了企业应用的agentid才有效；只能为单条转发，放在WWKMessageGroupAttachment中会被过滤
@property (nonatomic, assign) BOOL withShareTicket;
@property (nonatomic, copy, nullable) NSString *shareTicketState;
@end

/*!
 * @brief 小程序消息
 */
@interface WWKMessageMiniAppAttachment : WWKMessageAttachment
@property (nonatomic, copy) NSString *userName; // 小程序username
@property (nonatomic, copy, nullable) NSString *path; // 小程序页面的路径
@property (nonatomic, strong, nullable) NSData *hdImageData;   // 小程序预览图 不能超过128k
@property (nonatomic, copy, nullable) NSString *title; // 小程序 当前页title 不能超过512bytes
@end

/*!
 * @brief 位置消息
 */
@interface WWKMessageLocationAttachment : WWKMessageAttachment
@property (nonatomic, copy, nullable) NSString *title;
@property (nonatomic, copy, nullable) NSString *address;
@property (nonatomic, assign) double lat;
@property (nonatomic, assign) double lng;
@property (nonatomic, assign) double zoom;
@end

/*!
 * @brief 单条聊天记录消息
 */
@interface WWKMessageAttachmentWrapper : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSDate *date;
@property (nonatomic, copy, nullable) NSString *avatarUrl;
@property (nonatomic, copy, nullable) NSData *avatarData;
@property (nonatomic, retain) WWKMessageAttachment *attachment;
@end

/*!
 * @brief 聊天记录消息组
 */
@interface WWKMessageGroupAttachment : WWKMessageAttachment
@property (nonatomic, copy) NSArray<WWKMessageAttachmentWrapper *> *contents;
@property (nonatomic, copy) NSString *title;
@end


typedef NS_ENUM(NSUInteger, WWKOpenIdType) {
    WWKOpenIdTypeUnKnown = 0,
    WWKOpenIdTypeUser,    // 成员
    WWKOpenIdTypeDepartment   //部门
};

@interface WWKOpenIdInfo : NSObject
@property (nonatomic, copy, nullable) NSString *openid;
@property (nonatomic, assign) WWKOpenIdType idType;
@end


/*! @brief 第三方程序发送消息至企业微信终端程序的消息结构体
 *
 * 第三方程序向企业微信发送信息需要传入WWKSendMessageReq结构体，信息类型包括文本消息和多媒体消息，
 * 分别对应于text和message成员。调用该方法后，企业微信处理完信息会向第三方程序发送一个处理结果。
 * @see WWKSendMessageResp
 */
@interface WWKSendMessageReq : WWKBaseReq <WWKApiSerializable>
/** 发送消息的多媒体内容
 * @see WWKMessageAttachment
 */
@property (nonatomic, retain, nullable) WWKMessageAttachment *attachment;

@end



#pragma mark - WWKSendMessageResp
/*! @brief 企业微信终端向第三方程序返回的WWKSendMessageReq处理结果。
 *
 * 第三方程序向企业微信终端发送WWKSendMessageReq后，企业微信发送回来的处理结果，该结果用WWKSendMessageResp表示。
 */
@interface WWKSendMessageResp : WWKBaseResp <WWKApiSerializable>
@end

#pragma mark - WWKPickContactReq
/*! @brief 第三方程序从企业微信终端程序选人的消息结构体
*
* 本接口无需登录态，只能选择邮箱联系人。如果需要选择所有联系人，请使用WWKSelectContactReq接口
*
*
*/
@interface WWKPickContactReq : WWKBaseReq <WWKApiSerializable>
@property (nonatomic, copy) NSString *type;
@end

#pragma mark - WWKPickContactResp

@interface WWKContactInfo : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy, nullable) NSString *email;
@end

@interface WWKPickContactResp : WWKBaseResp <WWKApiSerializable>
@property (nonatomic, retain, nullable) NSArray<WWKContactInfo *> *contacts;
@end

#pragma mark - WWKOpenConversationReq

@interface WWKOpenConversationReq : WWKBaseReq <WWKApiSerializable>
@property (nonatomic, assign) uint64_t conversationType;
@property (nonatomic, assign) uint64_t conversationId;
@end

#pragma mark - WWKOpenConversationResp

@interface WWKOpenConversationResp : WWKBaseResp <WWKApiSerializable>
@end

#pragma mark - WWKSSOReq

@interface WWKSSOReq : WWKBaseReq <WWKApiSerializable>
@property (nonatomic, copy) NSString *state;
@end

@interface WWKSSOResp : WWKBaseResp <WWKApiSerializable>
@property (nonatomic, retain, nullable) NSString *state;
@property (nonatomic, retain, nullable) NSString *code;
@end



/*! @brief 第三方程序创建群聊并发送消息至企业微信终端程序的消息结构体(需登录态)
 *
 * 第三方程序向企业微信发送信息需要传入WWKSendMessageReq结构体，创建群聊成员的openid列表
 * (只支持成员，不支持部门)，当前登录态返回的openUserid，信息类型包括文本消息和多媒体消息，
 * 分别对应于text和message成员。调用该方法后，企业微信处理完信息会向第三方程序发送一个处理结果。
 * @see WWKOpenChatWithMessageResp
 */
@interface WWKOpenChatWithMessageReq : WWKBaseReq <WWKApiSerializable>
/** 发送消息的多媒体内容
 * @see WWKMessageAttachment
 */
@property (nonatomic, retain, nullable) WWKMessageAttachment *attachment;

/** 发送消息的到新创建的群聊
*  暂不支持传入部门信息
*/
@property (nonatomic, retain, nullable) NSArray<NSString *> *userOpenidList;

/**
*  从后台登录获取的openUserid
*/
@property (nonatomic, retain, nullable) NSString *openUserid;
@end



#pragma mark - WWKOpenChatWithMessageResp
/*! @brief 企业微信终端向第三方程序返回的WWKOpenChatWithMessageReq处理结果。
 *
 * 第三方程序向企业微信终端发送WWKOpenChatWithMessageReq后，企业微信发送回来的处理结果，该结果用WWKOpenChatWithMessageResp表示。
 */
@interface WWKOpenChatWithMessageResp : WWKBaseResp <WWKApiSerializable>
@end




#pragma mark - WWKSelectContactReq
/*! @brief 第三方程序从企业微信终端程序选人的消息结构体(需登录态)
*
* 第三方程序向企业微信发送信息需要传入当前登录态返回的openUserid。调用该方法后，企业微信调起选人流程，结束后会向第三方程序发送一个处理结果。
* @see WWKSelectContactResp
*/
@interface WWKSelectContactReq : WWKBaseReq <WWKApiSerializable>
/**
*  从后台登录获取的openUserid，必须填写这个字段
*/
@property (nonatomic, retain) NSString *openUserid;
@end

#pragma mark - WWKSelectContactResp

/*! @brief 选人回包
*
* 从这个接口返回的数据不会带人名或部门名，需要调用getOpenData接口获取名字等详细信息
* 目前仅支持选择成员，暂不支持选择部门
*/
@interface WWKSelectContactResp : WWKBaseResp <WWKApiSerializable>
@property (nonatomic, retain, nullable) NSArray<WWKOpenIdInfo *> *openids;
@end

/*! @brief getOpenData接口使用的结构
* @param openid 部门或成员openid信息
* @param type 需要查询的类型，目前仅支持userName（用户名称）、userDepartment（用户主部门名称）以及userGender（用户性别）、departmentName（部门名称）,其中userName、userDepartment、userGender在openid为用成员时有效，departmentName在openid为部门时有效
* @param data 传入时不需要填写，getOpenData返回会填充该字段
*/
@interface WWKOpenDataItem : NSObject
@property (nonatomic, copy) NSString *openid;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy, nullable) NSString *data;
@end


#pragma mark - WWKSelectPrivilegedContactReq
/*! @brief 第三方程序从企业微信终端程序选人的消息结构体(需登录态)
*
* 选择范围限定为企业通讯录
* 只支持成员，若勾选部门，则对应展开勾选部门下的成员。
* 与WWKSelectContactReq接口的区分是，返回的选择范围，需要经过第三方权限过滤。只返回在可见范围的列表，而完整的列表存在ticket给第三方，用于jsapi/api接口调用。
* @see WWKSelectPrivilegedContactResp
*/
@interface WWKSelectPrivilegedContactReq : WWKBaseReq <WWKApiSerializable>
/**
*  从后台登录获取的loginOpenUserid，必须填写这个字段
* selectedOpenUserIds 预选用户openUserId列表
* selectedTickets 预选ticket列表
*/
@property (nonatomic, copy) NSString *loginOpenUserid;
@property (nonatomic, copy) NSArray<NSString *> *selectedOpenUserIds;
@property (nonatomic, copy) NSArray<NSString *> *selectedTickets;
@end

#pragma mark - WWKSelectPrivilegedContactResp

/*! @brief 选人回包
*
* openUserIdList 返回openid的列表
* selectedTicket 选择的集合Ticket，用于对该选择集合操作的调用凭证。
* expiresIn selectedTicket的有效期，单位为秒
* selectedUserCount 选择的集合Ticket包含的用户数
*/
@interface WWKSelectPrivilegedContactResp : WWKBaseResp <WWKApiSerializable>
@property (nonatomic, copy) NSArray<NSString *> *openUserIdList;
@property (nonatomic, copy) NSString *selectedTicket;
@property (nonatomic, assign) uint32_t expiresIn;
@property (nonatomic, assign) uint32_t selectedUserCount;

@end



#pragma mark - WWKCreateChatWithMsgReq
/*! @brief 新建群聊发消息(需登录态)
*
* 选人范围包括企业通讯录和外部联系人。
* 支持用户传入openUserId，和selectedTicket
* @see WWKCreateChatWithMsgResp
*/
@interface WWKCreateChatWithMsgReq : WWKBaseReq <WWKApiSerializable>
/**
*  loginOpenUserid 从后台登录获取的loginOpenUserid，必须填写这个字段
*  selectedOpenUserIdList 创建会话的企业通讯录成员信息，格式为字符串，内容为成员的openid列表(可以从WWKSelectPrivilegedContactResp获取)，限定必须为应用的可见范围内。列表最多2000项。
*  selectedTicketList 已选择的成员集合凭证列表，(可以从WWKSelectPrivilegedContactResp获取)。列表最多10个。
*  attachment 消息内容结构体，支持文本、文件、图片、视频、链接、聊天内容，参考WWKMessageAttachment
*  chatName 群聊名称
*  state 透传参数，最长256，用于回调第三方应用创建群聊事件
*
*/

@property (nonatomic, copy) NSString *loginOpenUserid;
@property (nonatomic, copy) NSArray<NSString *> *selectedOpenUserIdList;
@property (nonatomic, copy) NSArray<NSString *> *selectedTicketList;
@property (nonatomic, retain) WWKMessageAttachment *attachment;
@property (nonatomic, copy, nullable) NSString *chatName;
@property (nonatomic, copy, nullable) NSString *state;
@end

#pragma mark - WWKCreateChatWithMsgResp

/*! @brief 新建群聊发消息回包
*
* errorCode 错误码
* errorMsg  错误码描述
* chatId 若创建群成功，返回群ID
*/
@interface WWKCreateChatWithMsgResp : WWKBaseResp <WWKApiSerializable>
@property (nonatomic, copy, nullable) NSString *chatId;
@end



#pragma mark - WWKOpenExistedChatWithMsgReq
/*! @brief 打开群聊发消息(需登录态)
*/
@interface WWKOpenExistedChatWithMsgReq : WWKBaseReq <WWKApiSerializable>
/**
*  loginOpenUserid 从后台登录获取的loginOpenUserid，必须填写这个字段
*  attachment 消息内容结构体，支持文本、文件、图片、视频、链接、聊天内容，参考WWKMessageAttachment attachment为可选。若不传参数，则无消息发送确认行为。
*  chatId 打开群聊ID,chatId必须是当前用户所在的群聊
*
*/

@property (nonatomic, copy) NSString *loginOpenUserid;
@property (nonatomic, retain, nullable) WWKMessageAttachment *attachment;
@property (nonatomic, copy) NSString *chatId;
@end

#pragma mark - WWKOpenExistedChatWithMsgResp

/*! @brief 打开群聊发消息回包
*
* errorCode 错误码
* errorMsg  错误码描述
*/
@interface WWKOpenExistedChatWithMsgResp : WWKBaseResp <WWKApiSerializable>
@end


NS_ASSUME_NONNULL_END
