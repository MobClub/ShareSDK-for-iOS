//
//  LoginConfigMode.h
//  EAccountSDK
//
//  Created by thy on 2018/5/25.
//  Copyright © 2018年 EAccount. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef   void (^successHandler) ( NSDictionary * _Nullable  resultDic);

typedef   void (^failureHandler) ( NSError * _Nullable  error);

typedef NS_OPTIONS (NSInteger, ThirdLoginType) {
    ThirdLoginDefaultLogin = 0,       //
    ThirdLoginQQLogin = 1 << 1,      //QQ登录
    ThirdLoginWeiXinLogin = 1 << 2, //微信登录
    ThirdLoginWeiboLogin = 1 << 3,   //微博登录
    ThirdLoginEHealthy  = 1 << 4    //翼健康登录
};

@interface LoginConfigMode : NSObject


/**
 第三方登录的配置，有qq，微博，微信三个，要哪个登录方式，就传对应的拼音，如@"qq" 或者@"qq|weixin" 或者@"qq|weixin|weibo"
 */
@property (nonatomic, assign) ThirdLoginType        thirdLoginType;

@property (nonatomic, copy) NSString       *        thirdLoginTypeStr;

/**
 loginWay 登录方式，zm、dm、zm|dm、dm|zm等4种方式，zm代表账号密码登录，dm，代表短信验证码登录，zm|dm代表两种都有，并且优先账号密码登录, dm|zm代表两种都有，优先短信登录
 */
@property (nonatomic, copy)   NSString          *   loginWay;



/**
 accountType 账号类型，有mobile,email两种，两种都要的话，传@"mobile|email"，否则传@"mobile" 或者@"email"
 */
@property (nonatomic, copy)   NSString          *   accountType;


/**
 有的app能管理多个登录账号。
 已经登录上的账号的accessToken组成的数组，不需要多账号功能的，可以传一个空的数组
 */
@property (nonatomic, strong) NSArray           *   loginList;


/**
 登录页面的登录账号是否默认加上@189.cn，yes表示有后缀，no表示没有后缀
 */
@property (nonatomic, assign) BOOL                  hasat;


/**
 是否隐藏头部导航栏
 */
@property (nonatomic, assign) BOOL                  hideTop;



/**
 自定义账号入口方式
 */
@property (nonatomic, assign) BOOL                  baseApp;


/**
 自定义账号入口方式的自定义文本 （6到8个字符）
 */
@property (nonatomic, copy)   NSString          *   basicLoginTxt;





#pragma mark 账号过期重新登录相关参数

/**
 Token过期登录账号原来的登陆类型 0 免密,1 短密，2 账密
 */
@property (nonatomic, copy)   NSString          *   loginMode;



/**
 账号可否被修改，true/false， 必填
 */
@property (nonatomic, assign) BOOL                  modifyAccount;


/**
 Token过期登录账号，例如：18988886666或者别名账号，必填
 */
@property (nonatomic, copy)   NSString          *   tokenAccount;


/**
 token过期账号对应的openId，必填。
 */
@property (nonatomic, copy)   NSString          *   tokenOpenId;




#pragma mark -迷你登录框相关
/**
 迷你登录弹框里边是否显示帮助按钮
 */
@property (nonatomic, assign) BOOL                  showQA;


/**
 迷你登录弹框里边是否显示切换账号按钮
 */
@property (nonatomic, assign) BOOL                  showOtherLogin;

/**
 是否只使用天翼账号的免密登录功能（不使用账号密码登录和短信验证码登录），如果传YES,并且SDK检测到不能免密登录的时候，SDK会直接返回，不在打开天翼账号的登录页面。
 */
@property (nonatomic, assign) BOOL                  autoLoginOnly;




#pragma mark -初始化方法

/**
 默认配置，各值如下：
 thirdLoginType = ThirdLoginDefaultLogin;
 loginWay = @"zm|dm";
 accountType = @"mobile";
 loginList = @[];
 hasat = NO;
 hideTop = NO;
 baseApp = NO;
 basicLoginTxt = @"";
 loginMode = @"0";
 modifyAccount = NO;
 tokenAccount = @"";
 tokenOpenId = @"";
 showQA = YES;
 showOtherLogin = YES;
 autoLoginOnly = NO;

 @return 初始化好的Mode
 */
- (instancetype)initDefaultConfig;

@end
