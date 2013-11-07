//
//  SSEverNoteTypeDef.h
//  EverNoteConnection
//
//  Created by vimfung on 13-5-8.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#ifndef EverNoteConnection_SSEverNoteTypeDef_h
#define EverNoteConnection_SSEverNoteTypeDef_h

/**
 *	@brief	应用类型
 */
typedef enum
{
	SSEverNoteAppTypeSandbox = 0, /**< 沙箱模式 */
	SSEverNoteAppTypeCN = 1, /**< 印象笔记中文 */
	SSEverNoteAppTypeUS = 2 /**< 印象笔记英文 */
}
SSEverNoteAppType;

/**
 *	@brief	权限
 */
typedef enum
{
	SSEverNotePrivilegeLevelNormal = 1, /**< 正常 */
	SSEverNotePrivilegeLevelPremium = 3, /**< 特殊 */
	SSEverNotePrivilegeLevelManager = 7, /**< 经理 */
	SSEverNotePrivilegeLevelSupport = 8, /**< 支持 */
	SSEverNotePrivilegeLevelAdmin = 9 /**< 管理员 */
}
SSEverNotePrivilegeLevel;

/**
 *	@brief	the possible states of a premium account
 */
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

/**
 *	@brief	Enumeration of the roles that a User can have within an Evernote Business account.
 */
typedef enum
{
	SSEverNoteBusinessUserRoleAdmin = 1, /**< The user is an administrator of the Evernote Business account. */
	SSEverNoteBusinessUserRoleNormal = 2 /**< The user is a regular user within the Evernote Business account. */
}
SSEverNoteBusinessUserRole;

/**
 *	@brief	Enumeration of the roles that a User can have within a sponsored group.
 */
typedef enum
{
	SSEverNoteSponsoredGroupRoleGroupMember = 1, /**< The user is a member of the group with no special privileges. */
	SSEverNoteSponsoredGroupRoleGroupAdmin = 2, /**< The user is an administrator within the group. */
	SSEverNoteSponsoredGroupRoleGroupOwner = 3 /**< The user is the owner of the group.  */
}
SSEverNoteSponsoredGroupRole;

/**
 *	@brief	字段类型
 */
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

/**
 *	@brief	消息类型
 */
typedef enum
{
	SSEverNoteMessageTypeCall = 1, /**< 调用 */
	SSEverNoteMessageTypeReply = 2, /**< 回复 */
	SSEverNoteMessageTypeException = 3, /**< 异常 */
	SSEverNoteMessageTypeOneWay = 4 /**<  */
}
SSEverNoteMessageType;

/**
 *	@brief	异常类型
 */
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
