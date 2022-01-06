//
//  SVSDKHyUIConfigure.h
//  SecVerify
//
//  Created by TanXiang on 2020/11/13.
//  Copyright © 2020 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SVSDKHyPrivacyText;

@interface SVSDKHyUIConfigure : NSObject

/**
 * VC，必传。将使用此vc present授权页面
 */
@property (nonatomic,weak) UIViewController *currentViewController;

/**
 * 外部手动管理关闭授权页
 * 默认为NO，点击一键登录按钮后成功或失败，授权页均自动关闭。(例:@(NO))
 * 可通过[SVSDKHyVerify finishLoginVcAnimated:Completion:]手动关闭
 */
@property (nonatomic,strong) NSNumber * manualDismiss;


//导航栏隐藏(例:@(YES))
@property (nonatomic,strong) NSNumber * navBarHidden;

#pragma mark - 协议勾选复选框
/**
 * 隐私条款check框默认状态，默认为NO(例:@(YES))
 */
@property (nonatomic,strong) NSNumber *checkDefaultState;

#pragma mark - 隐私协议样式
//完整的协议文字组合，使用辅助文字对象拼接
@property (nonatomic,strong) NSArray <SVSDKHyPrivacyText*> * privacySettings;
// 隐私条款多行时行距 CGFloat (例:@(4.0))
@property (nonatomic,strong) NSNumber * privacyLineSpacing;
// 隐私条款对其方式(例:@(NSTextAlignmentCenter))
@property (nonatomic,strong) NSNumber * privacyTextAlignment;

#pragma mark - 状态栏样式
/*
 *需先设置Info.plist: View controller-based status bar appearance = YES 方可生效
 *
 *UIStatusBarStyleDefault：状态栏显示 黑
 *UIStatusBarStyleLightContent：状态栏显示 白
 *UIStatusBarStyleDarkContent：状态栏显示 黑 API_AVAILABLE(ios(13.0)) = 3
 **eg. @(UIStatusBarStyleLightContent)
 */
@property (nonatomic,strong) NSNumber * preferredStatusBarStyle;
/*状态栏隐藏 eg.@(NO)*/
@property (nonatomic,strong) NSNumber * prefersStatusBarHidden;


#pragma mark - 横竖屏支持
//横竖屏 是否支持自动转屏 (例:@(NO))
@property (nonatomic,strong) NSNumber *shouldAutorotate;
//横竖屏 设备支持方向 (例:@(UIInterfaceOrientationMaskAll))
@property (nonatomic,strong) NSNumber *supportedInterfaceOrientations;
//横竖屏 偏好方向方向（需和支持方向匹配） (例:@(UIInterfaceOrientationPortrait))
@property (nonatomic,strong) NSNumber *preferredInterfaceOrientationForPresentation;

/**modalTransitionStyle系统自带的弹出方式 仅支持以下三种
 UIModalTransitionStyleCoverVertical 底部弹出
 UIModalTransitionStyleCrossDissolve 淡入
 UIModalTransitionStyleFlipHorizontal 翻转显示
 */
@property (nonatomic,strong) NSNumber * modalTransitionStyle;

/* UIModalPresentationStyle
 * 设置为UIModalPresentationOverFullScreen，可使模态背景透明，可实现弹窗授权页
 * 默认UIModalPresentationFullScreen
 * eg. @(UIModalPresentationOverFullScreen)
 */
/*授权页 ModalPresentationStyle*/
@property (nonatomic,strong) NSNumber * modalPresentationStyle;

//presnet方法的animate参数
@property (nonatomic,strong) NSNumber * presentingWithAnimate;

#pragma mark - 隐私协议web页vc
/*协议页状态栏样式 默认：UIStatusBarStyleDefault*/
@property (nonatomic,strong) NSNumber * privacyWebVCPreferredStatusBarStyle;
/*协议页使用模态弹出（默认使用Push)*/
@property (nonatomic,strong) NSNumber * showPrivacyWebVCByPresent;
/*协议页 ModalPresentationStyle （协议页使用模态弹出时生效）*/
@property (nonatomic,strong) NSNumber * privacyWebVCModalPresentationStyle;


#pragma mark - 暗黑模式设置
/* UIUserInterfaceStyle
 * UIUserInterfaceStyleUnspecified - 不指定样式，跟随系统设置进行展示
 * UIUserInterfaceStyleLight       - 明亮
 * UIUserInterfaceStyleDark,       - 暗黑 仅对iOS13+系统有效
 */
/*授权页 UIUserInterfaceStyle,默认:UIUserInterfaceStyleLight,eg. @(UIUserInterfaceStyleLight)*/
@property (nonatomic,strong) NSNumber * overrideUserInterfaceStyle;

@end










/**
 * 协议文字拼接辅助
 * 拼接成完整隐私协议
 */
@interface SVSDKHyPrivacyText : NSObject

//隐私协议显示名称
@property (nonatomic,copy)NSString * text;
//文字颜色
@property (nonatomic,strong)UIColor * textColor;
//文字字体
@property (nonatomic,strong)UIFont * textFont;
//跳转链接，如需跳转则比传，可设置本地html路径
@property (nonatomic,strong)NSString * textLinkString;

/**
 * 运营商协议占位标记
 * YES表示用来显示运营商协议，sdk内部自动补充协议名称(text)和链接(textLinkString)
 * 此时，text、textLinkString无需设置
 */
@property (nonatomic,assign)BOOL isOperatorPlaceHolder;




//文字富文本样式，覆盖textColor、textFont
@property (nonatomic,strong)NSDictionary * textAttribute;
//文字富文本样式，覆盖text、textColor、textFont
@property (nonatomic,strong)NSAttributedString * textAttributeString;
//运营商协议添加书名号
@property (nonatomic,assign)BOOL operatorAddMarks;
//隐私协议web页标题显示文字,默认取text
@property (nonatomic,copy)NSString * webTitleText;

/**
 设置示例：
 显示效果：登录即代表同意 中国xx认证服务协议 和 《我的自定义协议0》并授权xxx获取本机号码
 
 * SVSDKHyPrivacyText * text_des_0 = [[SVSDKHyPrivacyText alloc]init];
 text_des_0.text = @"登录即代表同意";
 text_des_0.textColor = [UIColor randomColor];
 text_des_0.textFont = [UIFont systemFontOfSize:12];

 //运营商协议占位
 SVSDKHyPrivacyText * text_operator = [[SVSDKHyPrivacyText alloc]init];
 text_operator.isOperatorPlaceHolder = YES;
 text_operator.textColor = [UIColor randomColor];
 text_operator.textFont = [UIFont boldSystemFontOfSize:13];

 SVSDKHyPrivacyText * text_des_1 = [[SVSDKHyPrivacyText alloc]init];
 text_des_1.text = @"和";
 text_des_1.textColor = [UIColor randomColor];
 text_des_1.textFont = [UIFont systemFontOfSize:12];

 SVSDKHyPrivacyText * text_myPrivacy0 = [[SVSDKHyPrivacyText alloc]init];
 text_myPrivacy0.text = @"《我的自定义协议0》";
 text_myPrivacy0.textFont = [UIFont boldSystemFontOfSize:13];
 text_myPrivacy0.textColor = [UIColor randomColor];
 text_myPrivacy0.textLinkString = @"https://www.example0.com";

 SVSDKHyPrivacyText * text_des_3 = [[SVSDKHyPrivacyText alloc]init];
 text_des_3.text = @"并授权xxx获取本机号码";
 text_des_3.textColor = [UIColor randomColor];
 text_des_3.textFont = [UIFont systemFontOfSize:12];

 NSMutableArray * privacySettings = [[NSMutableArray alloc]init];
 [privacySettings addObject:text_des_0];
 [privacySettings addObject:text_operator];
 [privacySettings addObject:text_des_1];
 [privacySettings addObject:text_myPrivacy0];
 [privacySettings addObject:text_des_3];

 uiConfigure.privacySettings = privacySettings;
 */
@end
