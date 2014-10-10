//
//  SSAuthOptions.h
//  ShareSDKInterface
//
//  Created by 冯 鸿杰 on 13/3/31.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISSAuthOptions.h"
#import "ISSViewDelegate.h"
#import "ShareSDKTypeDef.h"

/**
 *	@brief	授权选项
 */
@interface SSAuthOptions : NSObject <ISSAuthOptions>
{
@private
    SSAuthViewStyle _viewStyle;
    BOOL _allowCallback;
    BOOL _autoAuth;
    id<ISSViewDelegate> _viewDelegate;
    id<ISSViewDelegate> _authManagerViewDelegate;
    
    NSDictionary *_scopes;
    BOOL _powerByHidden;
    NSDictionary *_followAccounts;
}

/**
 *	@brief	视图样式
 */
@property (nonatomic) SSAuthViewStyle viewStyle;

/**
 *	@brief	自动授权标志，当分享内容时发现授权过期是否委托SDK处理授权问题，YES：表示委托授权， NO：表示不委托授权，需要自己根据返回值进行判断和处理
 */
@property (nonatomic) BOOL autoAuth;

/**
 *	@brief	是否允许授权后回调到服务器，默认为YES，对于没有服务器或者不需要回调服务器的应用可以设置为NO
 */
@property (nonatomic) BOOL allowCallback;

/**
 *	@brief	授权权限
 */
@property (nonatomic,retain) NSDictionary *scopes;

/**
 *	@brief	显示版权信息
 */
@property (nonatomic) BOOL powerByHidden;

/**
 *	@brief	关注用户集合
 */
@property (nonatomic,retain) NSDictionary *followAccounts;

/**
 *	@brief	视图协议委托
 */
@property (nonatomic,assign) id<ISSViewDelegate> viewDelegate;

/**
 *	@brief	授权管理视图协议委托
 */
@property (nonatomic,assign) id<ISSViewDelegate> authManagerViewDelegate;

/**
 *	@brief	初始化授权选项对象
 *
 *	@param 	options 	授权选项对象
 *
 *	@return	授权选项对象
 */
- (id)initWithOptions:(SSAuthOptions *)options;


@end
