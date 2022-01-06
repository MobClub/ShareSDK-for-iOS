//
//  SVSDKHyProtocolUserInfo.h
//  SecVerify
//
//  Created by TanXiang on 2020/11/12.
//  Copyright © 2020 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SVSDKHyUIConfigure.h"

@interface SVSDKHyProtocolUserInfo : NSObject

//当前运营商 CMCC CUCC CTCC UNKNOW
@property (nonatomic,copy)NSString * operatorType;

//授权页控件
@property (nonatomic, strong) UIButton * loginButton;
@property (nonatomic, strong) UIButton * backButton;
@property (nonatomic, strong) UIImageView * logoImageView;
@property (nonatomic, strong) UILabel  * phoneLabel;
@property (nonatomic, strong) UIButton * checkBox;
@property (nonatomic, strong) UITextView * privacyTextView;
@property (nonatomic, strong) UILabel  * sloganLabel;

//授权页必要信息
@property (nonatomic, strong) NSString * securityPhone;
@property (nonatomic, strong) NSDictionary * uiElement;

//协议页
/**协议页条款链接*/
@property (nonatomic, copy)NSString * privacyUrl;
/**协议页条款名称*/
@property (nonatomic, copy)NSString * privacyText;
/**链接配置对象*/
@property (nonatomic, strong)SVSDKHyPrivacyText * privacyTextObj;
/**协议页VC*/
@property (nonatomic, strong)UIViewController * webVC;
@end

