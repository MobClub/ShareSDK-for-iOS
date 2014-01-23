//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <AGCommon/CMErrorInfo.h>
#import "SSCTypeDef.h"

/**
 *	@brief	ShareSDK App protocol.
 */
@protocol ISSCAccount <NSObject>

/**
 *	@brief	Get app key.
 *
 *	@return	App key.
 */
- (NSString *)appKey;

/**
 *	@brief	Get all the permissions roles
 *
 *	@return	Roles list.
 */
- (NSArray *)roles;

/**
 *	@brief	Detection role permissions
 *
 *	@param 	role 	Role object.
 *
 *	@return	YES means to have this role, NO means no permission for this role
 */
- (BOOL)checkRole:(Class)role;

/**
 *	@brief	Get cache path.
 *
 *	@return	Path.
 */
- (NSString *)cachePath;

/**
 *	@brief	Set statistical policy
 *
 *	@param 	policy 	Policy
 */
- (void)setStatPolicy:(SSCStatPolicy)policy;

/**
 *	@brief	Get statistical policy
 *
 *	@return	Policy
 */
- (SSCStatPolicy)statPolicy;

/**
 *	@brief	Set app information hosting flag.
 *
 *  @since  ver1.0.7
 *
 *	@param 	enabled 	YES that the use of the information on the server hosting, otherwise use native code configuration information
 */
- (void)setUseAppTrusteeship:(BOOL)enabled;

/**
 *	@brief	Get app information hosting flag.
 *
 *  @since  ver1.0.7
 *
 *	@return	YES that the use of the information on the server hosting, otherwise use native code configuration information
 */
- (BOOL)useAppTrusteeship;

/**
 *	@brief	Set SSO Login enabled.
 *
 *  @since  ver2.1.1
 *
 *	@param 	enabled 	Enabled status.
 */
- (void)setSsoEnabled:(BOOL)enabled;

/**
 *	@brief	Get SSO Login enabled.
 *
 *	@since  ver2.1.1
 *
 *	@return	YES indicates enabled， NO indicates disabled.
 */
- (BOOL)ssoEnabled;

/**
 *	@brief	Set convert short-link status
 *
 *  @since  ver2.1.1
 *
 *	@param 	enabled 	Enabled status.
 */
- (void)setConvertUrlEnabled:(BOOL)enabled;

/**
 *	@brief	Get convert short-link status
 *
 *  @since  ver2.1.1
 *
 *	@return	YES said conversion, NO means no conversion
 */
- (BOOL)convertUrlEnabled;

/**
 *	@brief	Set statistical enabled flag.
 *
 *  @since  ver2.1.1
 *
 *  @param  enabled     Enabled.
 */
- (void)setStatEnabled:(BOOL)enabled;

/**
 *	@brief	Get statistical enabled flag.
 *
 *  @since  ver2.1.1
 *
 *	@return	Statistical enabled flag
 */
- (BOOL)statEnabled;

/**
 *	@brief	Get statistical device information enabled flag.
 *
 *  @since  ver2.1.1    Set readonly，State is set by the server.
 *
 *	@return Statistical device information enabled flag.
 */
- (BOOL)statDevEnabled;

/**
 *	@brief	Get statistical share information enabled flag.
 *
 *  @since  ver2.1.1    Set readonly，State is set by the server.
 *
 *	@return	Statistical share information enabled flag.
 */
- (BOOL)statShareEnabled;

/**
 *	@brief	Get statistical user information enabled flag.
 *
 *  @since  ver2.1.1    Set readonly，State is set by the server.
 *
 *	@return	Statistical user information enabled flag
 */
- (BOOL)statUserEnabled;

/**
 *	@brief	Get current time（After the server corrected）
 *
 *	@return	Current time（unit：second）
 */
- (NSTimeInterval)currentTimeInterval;

/**
 *	@brief	Client time converted into server time
 *
 *	@param 	clientTimeInterval 	Client time.
 *
 *	@return	Server time.
 */
- (NSTimeInterval)serverTimeIntervalWithClientTimeInterval:(NSTimeInterval)clientTimeInterval;

/**
 *	@brief	Upadate paltform setting.
 *
 *  @param  completeHandler     Completed handler.
 */
- (void)updatePlatSetting:(void(^)(NSArray *settings))completeHandler;

@end
