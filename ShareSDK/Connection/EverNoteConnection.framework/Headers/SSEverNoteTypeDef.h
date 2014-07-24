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

#ifndef EverNoteConnection_SSEverNoteTypeDef_h
#define EverNoteConnection_SSEverNoteTypeDef_h

///#begin zh-cn
/**
 *	@brief	应用类型
 */
///#end
///#begin en
/**
 *	@brief	App type.
 */
///#end
typedef enum
{
	SSEverNoteAppTypeSandbox = 0, /**< 沙箱模式 */
	SSEverNoteAppTypeCN = 1, /**< 印象笔记中文 */
	SSEverNoteAppTypeUS = 2 /**< 印象笔记英文 */
}
SSEverNoteAppType;

///#begin zh-cn
/**
 *	@brief	权限
 */
///#end
///#begin en
/**
 *	@brief	Privilege level.
 */
///#end
typedef enum
{
	SSEverNotePrivilegeLevelNormal = 1, /**< 正常 */
	SSEverNotePrivilegeLevelPremium = 3, /**< 特殊 */
	SSEverNotePrivilegeLevelManager = 7, /**< 经理 */
	SSEverNotePrivilegeLevelSupport = 8, /**< 支持 */
	SSEverNotePrivilegeLevelAdmin = 9 /**< 管理员 */
}
SSEverNotePrivilegeLevel;

///#begin zh-cn
/**
 *	@brief	the possible states of a premium account
 */
///#end
///#begin en
/**
 *	@brief	the possible states of a premium account
 */
///#end
typedef enum
{
	SSEverNotePremiumOrderStatusNone = 0, /**< the user has never attempted to become a premium subscriber */
	SSEverNotePremiumOrderStatusPending = 1, /**< the user has requested a premium account but their charge has not been confirmed */
	SSEverNotePremiumOrderStatusActive = 2, /**< the user has been charged and their premium account is in good standing */
	SSEverNotePremiumOrderStatusFailed = 3, /**< he system attempted to charge the was denied. Their premium privileges have been revoked. We will periodically attempt to re-validate their order. */
	SSEverNotePremiumOrderStatusCancellationPending = 4, /**< the user has requested that no further charges be made but the current account is still active. */
	SSEverNotePremiumOrderStatusCanceled = 5 /**< the premium account was canceled either because of failure to pay or user cancelation. No more attempts will be made to activate the account.  */
}
SSEverNotePremiumOrderStatus;

///#begin zh-cn
/**
 *	@brief	Enumeration of the roles that a User can have within an Evernote Business account.
 */
///#end
///#begin en
/**
 *	@brief	Enumeration of the roles that a User can have within an Evernote Business account.
 */
///#end
typedef enum
{
	SSEverNoteBusinessUserRoleAdmin = 1, /**< The user is an administrator of the Evernote Business account. */
	SSEverNoteBusinessUserRoleNormal = 2 /**< The user is a regular user within the Evernote Business account. */
}
SSEverNoteBusinessUserRole;

///#begin zh-cn
/**
 *	@brief	Enumeration of the roles that a User can have within a sponsored group.
 */
///#end
///#begin en
/**
 *	@brief	Enumeration of the roles that a User can have within a sponsored group.
 */
///#end
typedef enum
{
	SSEverNoteSponsoredGroupRoleGroupMember = 1, /**< The user is a member of the group with no special privileges. */
	SSEverNoteSponsoredGroupRoleGroupAdmin = 2, /**< The user is an administrator within the group. */
	SSEverNoteSponsoredGroupRoleGroupOwner = 3 /**< The user is the owner of the group.  */
}
SSEverNoteSponsoredGroupRole;

///#begin zh-cn
/**
 *	@brief	字段类型
 */
///#end
///#begin en
/**
 *	@brief	Field type.
 */
///#end
typedef enum
{
	SSEverNoteFieldTypeStop = 0, /**< 停止 */
	SSEverNoteFieldTypeVoid = 1, /**< 空类型 */
	SSEverNoteFieldTypeBool = 2, /**< 布尔型 */
	SSEverNoteFieldTypeByte = 3, /**< 字节型 */
	SSEverNoteFieldTypeDouble = 4, /**< 双精度浮点型 */
	SSEverNoteFieldTypeInt16 = 6, /**< 短整型 */
	SSEverNoteFieldTypeInt32 = 8, /**< 整型 */
	SSEverNoteFieldTypeInt64 = 10, /**< 长整型 */
	SSEverNoteFieldTypeString = 11, /**< 字符串 */
	SSEverNoteFieldTypeStruct = 12, /**< 结构 */
	SSEverNoteFieldTypeMap = 13, /**< 图 */
	SSEverNoteFieldTypeSet = 14, /**< 集合 */
	SSEverNoteFieldTypeList = 15 /**< 列表 */
}
SSEverNoteFieldType;

///#begin zh-cn
/**
 *	@brief	消息类型
 */
///#end
///#begin en
/**
 *	@brief	Message type.
 */
///#end
typedef enum
{
	SSEverNoteMessageTypeCall = 1, /**< 调用 */
	SSEverNoteMessageTypeReply = 2, /**< 回复 */
	SSEverNoteMessageTypeException = 3, /**< 异常 */
	SSEverNoteMessageTypeOneWay = 4 /**<  */
}
SSEverNoteMessageType;

///#begin zh-cn
/**
 *	@brief	异常类型
 */
///#end
///#begin en
/**
 *	@brief	Exception type.
 */
///#end
typedef enum
{
	SSEverNoteExceptionUnknown = 0, /**< 未知 */
	SSEverNoteExceptionUnknownMethod = 1, /**< 未知方法 */
	SSEverNoteExceptionInvalidMessageType = 2, /**< 无效的消息类型 */
	SSEverNoteExceptionWrongMethodName = 3, /**< 错误的方法名称 */
	SSEverNoteExceptionBadSequenceId = 4, /**< 无效的SequenceId */
	SSEverNoteExceptionMissingResult = 5, /**< 丢失返回结果 */
	SSEverNoteExceptionInternalError = 6, /**< 网络错误 */
	SSEverNoteExceptionProtocolError = 7, /**< 协议错误 */
    SSEverNoteExceptionNotFound = 8 /**< 未找到 */
}
SSEverNoteException;


#endif
