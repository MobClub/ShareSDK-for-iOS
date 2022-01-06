//
//  EAccountOpenAuthModel.h
//  EAccountSDK
//
//  Created by 陈永怀 on 2019/4/13.
//  Copyright © 2019年 陈永怀. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define EACCOUNT_CHECKSTATE_CHECKED 0    //勾选框默认勾选
#define EACCOUNT_CHECKSTATE_UNCHECKED 1  //勾选框默认不勾选

#define EACCOUNT_LOGINBUTTON_BACKGROUND_DEFAULT 0 //登录按钮选择使用xib默认背景
#define EACCOUNT_LOGINBUTTON_BACKGROUND_COLOR 1 //登录按钮选择使用背景颜色
#define EACCOUNT_LOGINBUTTON_BACKGROUND_IMAGES 2 //登录按钮选择使用背景图片

#define EACCOUNT_MINI_POSITION_CENTER 10 //弹窗默认居中
#define EACCOUNT_MINI_POSITION_TOP 3 //弹窗置顶
#define EACCOUNT_MINI_POSITION_BOTTOM 4 //弹窗底部

@class EAccountCustomPrivacyAgreement;
@interface EAccountOpenPageConfig : NSObject
/**
 SDK接入注意事项:
 
 1、合作方根据自身需求，给需要修改的配置项传值即可，无需修改的配置项可不传入值
 
 2、tag参数说明如下：
        *若未修改过xib/nib中的控件tag，tag参数可不传，所有tag参数已有默认的初始值，初始值与bundle中提供的xib/nib文件的控件tag值对应
        *若有传入tag参数，记得检查传入的值是否与xib/nib控件对应，反之亦然，tag参数值需与xib/nib文件的控件tag值保持一一对应
 
 3、除tag参数、nib文件名、bundle资源包名、布尔类型参数（初始值为NO）外，其余可配置参数初始值如下：
        *对象类型参数初始值为nil （包括NSString、UIColor、UIImage、NSArray等）
        *数值类型参数初始值为0
 
 4、偏移量OffsetY值说明如下：
        *所有可配置偏移量OffsetY值的控件的父view只能是xib自带的view，不允许嵌套在其他view中
        *底部勾选按钮、隐私协议标签的偏移量OffsetY值，是相对于屏幕（safeArea）底部，即控件的底部（bottom）相对于safeArea的底部（bottom）
        *其余控件的偏移量OffsetY值，是相对于屏幕（safeArea）的顶部，即控件的顶部（top）相对于父view的顶部（top）
 
 5、隐私协议标签（包括弹窗的隐私协议标签）的高度推荐按照我们提供的xib高度来设置，以便更好地响应点击和区分点击到的协议。
 
 6、资源包EAccountOpenPageResource.bundle里面，没有使用到的文件可以删除，如xib文件。（注意：部分图片被sdk默认使用，如无配置替换，不可删除，如返回键默认图片、loading默认图片）
 
 */

/*------------------------------------nib文件名和资源包名-----------------------------------*/
/**
登录页面的nib文件名，SDK将根据该名加载登录界面
*/
@property (nonatomic, copy) NSString *nibNameOfLoginVC;

/**
 协议页面的nib文件名，SDK将根据该名加载协议页面
 */
@property (nonatomic, copy) NSString *nibNameOfPrivacAgreementVC;

/**
 bundle资源包名字
 */
@property (nonatomic, copy) NSString *EAccountBundleName;

/*----------------------------------------登录界面配置-----------------------------------*/

/*----------------------------导航栏配置---------------------------------------*/

/**
 导航栏相关tag自定义
 */
//导航栏衬底视图的tag ------------- 31001 （默认值 下同）
@property (nonatomic, assign) NSUInteger navUnderlaymentTag;
//导航栏视图tag ------------------ 31002
@property (nonatomic, assign) NSUInteger navViewTag;
//导航栏标题标签tag --------------- 31003
@property (nonatomic, assign) NSUInteger navTextLabelTag;
//导航栏返回按钮tag  -------------- 21001
@property (nonatomic, assign) NSUInteger navGoBackTag;
//导航栏底部横线tag --------------- 31004
@property (nonatomic, assign) NSUInteger navLineTag;

/**导航栏颜色*/
@property (nonatomic,strong) UIColor *navColor;
/**状态栏着色样式*/
@property (nonatomic,assign) UIBarStyle barStyle;
/**导航栏底部横线颜色*/
@property (nonatomic,strong) UIColor *navLineColor;

/**导航栏标题*/
@property (nonatomic,copy)  NSString *navText;
/**导航栏标题字体大小*/
@property (nonatomic,assign) CGFloat navTextSize;
/**导航栏标题颜色*/
@property (nonatomic,strong) UIColor *navTextColor;

/**导航返回图标 正常*/
@property (nonatomic,strong) UIImage *navGoBackImg_normal;
/**导航返回图标 选中高亮*/
@property (nonatomic,strong) UIImage *navGoBackImg_highlighted;


/*----------------------------logo配置-------------------------------------*/

//logo tag --------------------- 32001
@property (nonatomic, assign) NSUInteger logoTag;

/**LOGO图片*/
@property (nonatomic,strong) UIImage *logoImg;

/**LOGO图片Y偏移量
 该控件顶部（top）相对于屏幕（safeArea）的顶部（top）的距离 （下同）
 */
@property (nonatomic,assign) CGFloat logoOffsetY;
/**LOGO图片是否隐藏*/
@property (nonatomic,assign) BOOL logoHidden;

/**LOGO宽度*/
@property (nonatomic,assign) CGFloat logoWidth;
/**LOGO高度*/
@property (nonatomic,assign) CGFloat logoHeight;

/*----------------------------手机号标签配置----------------------------------------*/

//号码标签tag -------------------- 21002
@property (nonatomic, assign) NSUInteger numberTag;

/**手机号码字体颜色*/
@property (nonatomic,strong) UIColor *numberColor;
/**手机号码字体大小*/
@property (nonatomic,assign) CGFloat numberTextSize;
/**号码栏Y偏移量*/
@property (nonatomic,assign) CGFloat numFieldOffsetY;

/*----------------------------中部小logo及标签配置------------------------------*/
/**
 品牌 logo和标签 tag自定义
 */
//品牌logo tag ----------------- 21003
@property (nonatomic, assign) NSUInteger brandTag;
//品牌标签 tag ------------------ 21004
@property (nonatomic, assign) NSUInteger brandLabelTag;

/**品牌logo图片及标签的Y偏移量*/
@property (nonatomic,assign) CGFloat brandLabelOffsetY;
/**品牌标签文字颜色*/
@property (nonatomic,strong) UIColor *brandLabelTextColor;
/**品牌标签字体大小*/
@property (nonatomic,assign) CGFloat brandLabelTextSize;
/*----------------------------登录按钮配置-------------------------------------*/
/**
 登录按钮相关tag自定义
 */
//登录按钮tag ------------------- 21005
@property (nonatomic, assign) NSUInteger logBtnTag;
//loading图tag ----------------- 210051
@property (nonatomic, assign) NSUInteger loadingTag;

/**登录按钮文本*/
@property (nonatomic,strong) NSString *logBtnText;
/**登录按钮Y偏移量*/
@property (nonatomic,assign) CGFloat logBtnOffsetY;
/**登录按钮文本颜色*/
@property (nonatomic,strong) UIColor *logBtnTextColor;

/**登录按钮宽度*/
@property (nonatomic,assign) CGFloat logBtnWidth;
/**登录按钮高度
 若需单独修改登录按钮的高度，宽度logBtnWidth不传值或者传0即可
 */
@property (nonatomic,assign) CGFloat logBtnHeight;

/**登录按钮字体大小*/
@property (nonatomic,assign) CGFloat logBtnTextSize;

/**
 * 登录按钮的背景 可选设置为背景颜色、背景图片，若不传值即为默认，即选择使用xib默认背景
 * 选择使用默认背景 EACCOUNT_LOGINBUTTON_BACKGROUND_DEFAULT （与不传值相同）
 * 选择使用背景颜色 EACCOUNT_LOGINBUTTON_BACKGROUND_COLOR
 * 选择使用背景图片 EACCOUNT_LOGINBUTTON_BACKGROUND_IMAGES
 */
@property (nonatomic, assign) NSUInteger logBtnBackground;

/**登录按钮圆角设置*/
@property (nonatomic,assign) CGFloat logBtnCornerRadius;

/**登录按钮背景颜色 正常*/
@property (nonatomic,strong) UIColor *logBtnBgColor_normal;

/**登录按钮背景颜色 不可按状态*/
@property (nonatomic,strong) UIColor *logBtnBgColor_disable;

/**登录按钮背景颜色 按下高亮*/
@property (nonatomic,strong) UIColor *logBtnBgColor_highlighted;

/**登录按钮背景图片添加到数组(顺序如下)
 @[激活状态的图片,不可按状态的图片,高亮状态的图片]
 */
@property (nonatomic,strong) NSArray *logBtnImgs;

/**loading图片*/
@property (nonatomic,strong) UIImage *loadingImg;

/*----------------------------其他登录方式按钮配置--------------------------------*/
/**
 *其他登录方式按钮
 */
//其他登录方式按钮tag ---------------- 21006
@property (nonatomic, assign) NSUInteger otherWayLogBtnTag;

/**文本*/
@property (nonatomic,strong) NSString *otherWayLogBtnText;
/**Y偏移量*/
@property (nonatomic,assign) CGFloat otherWayLogBtnOffsetY;
/**文本颜色 正常*/
@property (nonatomic,strong) UIColor *otherWayLogBtnTextColor_normal;
/**文本颜色 高亮*/
@property (nonatomic,strong) UIColor *otherWayLogBtnTextColor_highlighted;
/**字体大小*/
@property (nonatomic,assign) CGFloat otherWayLogBtnTextSize;
/**是否隐藏*/
@property (nonatomic,assign) BOOL otherWayLogBtnHidden;

/*----------------------------勾选按钮和隐私协议标签--------------------------------------*/
//隐私协议 PrivacyAgreement 简写PA
/**
 *勾选按钮和隐私协议标签相关tag
 */
//勾选按钮tag --------------------- 21007
@property (nonatomic, assign) NSUInteger checkBtnTag;
//隐私协议标签tag ------------------ 21008
@property (nonatomic, assign) NSUInteger PALabelTag;

/**隐私协议标签上 按钮tag ----------- 21009
 注意：不用传入。
 */
@property (nonatomic, assign) NSUInteger partnerPABtnTag;

/***默认勾选 EACCOUNT_CHECKSTATE_CHECKED （与不传值相同）
    默认不勾选 EACCOUNT_CHECKSTATE_UNCHECKED
 */
@property (nonatomic, assign) NSUInteger checkState;
/**勾选按钮未选中图片*/
@property (nonatomic,strong) UIImage *checkBtnImg_unchecked;
/**勾选按钮已选中图片*/
@property (nonatomic,strong) UIImage *checkBtnImg_checked;

/**隐私协议标签完整文字
 如: 登录即同意《天翼账号服务与隐私协议》与《自定义协议》并授权[应用名]获本机号码
 注意： 1.登录即同意《天翼账号服务与隐私协议》 这段文案不允许改变，具体按设计规范设置
       2.[应用名]必须替换为具体的app名字
 */
@property (nonatomic,strong) NSString *PALabelText;
/**隐私协议标签字体大小*/
@property (nonatomic,assign) CGFloat PALabelTextSize;
/**隐私协议标签字体行间距*/
@property (nonatomic,assign) CGFloat PALabelTextLineSpacing;

/**天翼账号隐私协议名称的起始位置 （用于修改协议名称的颜色 下同）
 如: 《天翼账号服务与隐私协议》在完整的协议文字中的起始位置是 5
 */
@property (nonatomic, assign) NSUInteger EAStartIndex;
/**天翼账号隐私协议名称的结束位置
 如: 《天翼账号服务与隐私协议》在完整的协议文字中的结束位置是 17
 */
@property (nonatomic, assign) NSUInteger EAEndIndex;

/**合作方隐私协议名称的起始位置
 如: 《自定义协议》在完整的协议文字中的起始位置是 19
 */
@property (nonatomic, assign) NSUInteger pStartIndex;
/**合作方隐私协议名称的结束位置
 如: 《自定义协议》在完整的协议文字中的结束位置是 25
 */
@property (nonatomic, assign) NSUInteger pEndIndex;
/**隐私协议标签上的其他文字的颜色
 除了隐私协议名称的其他文字的颜色
 */
@property (nonatomic,strong) UIColor *PALabelOtherTextColor;
/**运营商隐私协议名称的颜色*/
@property (nonatomic,strong) UIColor *PANameColor;
/**合作方用户协议URL
 合作方可传入用户协议的URL，用户点击协议后，SDK加载打开协议页面
 */
@property (nonatomic, copy) NSString *PAUrl;

/**勾选按钮Y偏移量
 该控件底部（bottom）相对于屏幕（safeArea）底部（bottom）的距离
 */
@property (nonatomic,assign) CGFloat checkBtnOffsetY;
/**隐私协议标签Y偏移量
 该控件底部（bottom）相对于屏幕（safeArea）底部（bottom）的距离
 */
@property (nonatomic,assign) CGFloat PALabelOffsetY;

/***************************************************************
 *v3.7.2新增
 *合作方隐私协议名称的颜色，可用于单独配置合作方隐私协议名称的颜色*/
@property (nonatomic,strong) UIColor *partnerPANameColor;
/***************************************************************
 
/*-------------------------------弹窗----------------------------------------*/
/**
 弹窗相关tag
 */

//弹窗底视图tag --------------------- 21100
@property (nonatomic, assign) NSUInteger dialogViewTag;
/**弹窗 登录即同意《天翼账号服务与隐私协议》按钮tag ------ 21101
 注意：不用传入。
 */
@property (nonatomic, assign) NSUInteger dialogEAccountPABtnTag;
//弹窗 左按钮tag -------------------- 21102
@property (nonatomic, assign) NSUInteger dialogLeftBtnTag;
//弹窗 右按钮tag -------------------- 21103
@property (nonatomic, assign) NSUInteger dialogRightBtnTag;
//弹窗 背景蒙板（即弹窗后面的半透明黑框）tag ----------- 21104
@property (nonatomic, assign) NSUInteger dialogMaskViewTag;
//弹窗 隐私协议标签tag --------------- 21105
@property (nonatomic, assign) NSUInteger dialogPALabelTag;

/**弹窗底视图背景色*/
@property (nonatomic,strong) UIColor *dialogViewBgColor;
/**弹窗 左按钮背景色*/
@property (nonatomic,strong) UIColor *dialogLeftBtnBgColor;
/**弹窗 右按钮背景色*/
@property (nonatomic,strong) UIColor *dialogRightBtnBgColor;

/**弹窗 左按钮文字颜色*/
@property (nonatomic,strong) UIColor *dialogLeftBtnTextColor;
/**弹窗 右按钮文字颜色*/
@property (nonatomic,strong) UIColor *dialogRightBtnTextColor;

/**弹窗 隐私协议标签完整文字
 因弹窗位置有限，隐私协议的文字要比前面隐私协议标签的短
 如: 登录即同意《天翼账号服务与隐私协议》与《自定义协议》
 注意： 登录即同意《天翼账号服务与隐私协议》 这段文案不允许改变，具体按设计规范设置
 */
@property (nonatomic,strong) NSString *dialogPALabelText;
/**弹窗 隐私协议标签字体大小*/
@property (nonatomic,assign) CGFloat dialogPALabelTextSize;
/**弹窗 隐私协议标签字体行间距*/
@property (nonatomic,assign) CGFloat dialogPALabelTextLineSpacing;

/**弹窗 天翼账号隐私协议名称的起始位置
 如: 《天翼账号服务与隐私协议》在完整的协议文字中的起始位置是 5
 */
@property (nonatomic, assign) NSUInteger dialogEAStartIndex;
/**弹窗 天翼账号隐私协议名称的结束位置
 如: 《天翼账号服务与隐私协议》在完整的协议文字中的结束位置是 17
 */
@property (nonatomic, assign) NSUInteger dialogEAEndIndex;

/**弹窗 合作方隐私协议名称的起始位置
 如: 《自定义协议》在完整的协议文字中的起始位置是 19
 */
@property (nonatomic, assign) NSUInteger dialogPStartIndex;
/**弹窗 合作方隐私协议名称的结束位置
 如: 《自定义协议》在完整的协议文字中的结束位置是 25
 */
@property (nonatomic, assign) NSUInteger dialogPEndIndex;

/**弹窗 协议其他文字颜色*/
@property (nonatomic,strong) UIColor *dialogPAOtherTextColor;
/**弹窗 运营商协议名称文字颜色*/
@property (nonatomic,strong) UIColor *dialogPANameColor;
/**
 弹窗 合作方隐私协议名称的颜色  v3.7.2增加，可用于单独配置合作方隐私协议名称的颜色
 */
/***************************************************************
 *v3.7.2新增
 *弹窗 合作方隐私协议名称的颜色，可用于单独配置 弹窗合作方隐私协议名称的颜色*/
@property (nonatomic,strong) UIColor *dialogPartnerPANameColor;
/***************************************************************

 
/*----------------------------自定义按钮--------------------------------------*/
/**
 自定义按钮相关tag 默认 21301到21305
 */
@property (nonatomic, assign) NSUInteger customBtnTag1;
@property (nonatomic, assign) NSUInteger customBtnTag2;
@property (nonatomic, assign) NSUInteger customBtnTag3;
@property (nonatomic, assign) NSUInteger customBtnTag4;
@property (nonatomic, assign) NSUInteger customBtnTag5;

/*-------------------------------------协议web页面配置-----------------------------------------*/

/**
 注：协议web页面导航栏颜色、字体大小等配置与登录页面一致
 */

//协议web页面 导航栏视图tag ----------------- 21200
@property (nonatomic, assign) NSUInteger webNavViewTag;
//协议web页面 导航栏返回按钮tag   ------------ 21201
@property (nonatomic, assign) NSUInteger webNavGoBackTag;
//协议web页面 导航栏衬底视图的tag ------------ 21202
@property (nonatomic, assign) NSUInteger webNavUnderlaymentTag;
//协议web页面 进度条的tag ------------------- 21203
@property (nonatomic, assign) NSUInteger webProgressViewTag;
//协议web页面 导航栏标题标签tag -------------- 21204
@property (nonatomic, assign) NSUInteger webNavTextLabelTag;
//协议web页面 导航栏底部横线tag -------------- 21205
@property (nonatomic, assign) NSUInteger webNavLineTag;

/**协议web页面 显示天翼账号服务与隐私协议时的 导航栏标题*/
@property (nonatomic,copy)  NSString *webNavText;
/**协议web页面 显示合作方协议时的 导航栏标题*/
@property (nonatomic,copy)  NSString *pWebNavText;
/**协议web页面 进度条颜色*/
@property (nonatomic,strong) UIColor *webProgressViewColor;

/*======================================v3.7.2新增属性==========================================*/

/*---------------------------------mini登录框配置---------------------------------*/
/**
 新增窗口UI界面布局，用于实现小窗登录，默认水平居中，可配置Y方向的位置，窗口大小可配置；
 支持进场、退场动画；
 新增更灵活的协议动态配置；
 */
//mini登录框tag 41000
@property (nonatomic, assign)   NSUInteger  miniBoxViewTag;
//mini登录框 Y方向位置，上中下，水平方向上居中
@property (nonatomic, assign)   NSInteger   miniBoxYPosition;
/**
    mini登录框 Y方向的位置是否基于SafeArea（默认基于屏幕），即该项默认值为NO
    比如基于屏幕的center和基于safeArea的center是有差异的，前者是整个手机的正中央；如果是安全区域：在X系列上头部44、底部34，视觉上会向下偏移5个像素，）
 */
@property (nonatomic, assign)   BOOL isMiniBoxYBaseOnSafeArea;
//mini登录框 宽度
@property (nonatomic, assign)   CGFloat     miniBoxWidth;
//mini登录框 高度
@property (nonatomic, assign)   CGFloat     miniBoxHeight;

/*----------------------------------自定义动画配置----------------------------------*/
/**
 *新增自定义动画属性，支持合作方传入自定义的动画，用于转场
 */
@property (nonatomic, strong)   NSObject *AnimatedTransitioningObj;

/*---------------------------------合作方用户协议名称--------------------------------*/
/**
 *v3.7.2新增，合作方用户协议名称，使用新接口，即占位符$CAT时必须传入，详细请参考接入demo
 */
@property (nonatomic, strong) NSString      *partnerPAName;

/*---------------------------------运营商协议相关配置--------------------------------*/
/**
 *若有需求，可传入运营商的协议名称和协议url
 *若有传值，隐私协议标签将根据运营商类型和传入的值，显示运营商协议名称，点击跳转到相应的协议url
 *详情请参考接入demo
 */
//中国移动协议名称及url，协议和url必须同时配置
@property (nonatomic, strong) NSString      *chinaMobileTitle;
@property (nonatomic, strong) NSString      *chinaMobileUrl;
//中国联通协议名称及url，协议和url必须同时配置
@property (nonatomic, strong) NSString      *chinaUnicomTitle;
@property (nonatomic, strong) NSString      *chinaUnicomUrl;


/*======================================v3.8.3新增属性==========================================*/
/**新的隐私协议*/
@property (nonatomic,strong) EAccountCustomPrivacyAgreement *customPrivacyAgreement;
/**新的弹窗隐私协议*/
@property (nonatomic,strong) EAccountCustomPrivacyAgreement *dialogPrivacyAgreement;
@end


#pragma -mark 隐私协议类
/**
*行业版v3.8.3新增隐私协议类
*/
@interface EAccountCustomPrivacyAgreement : NSObject
/**隐私协议富文本*/
@property (nonatomic, strong) NSMutableAttributedString *attrStr;
//隐私协议textView的tag ------------------ 41008 弹窗确认框的隐私协议textView的tag为41009
@property (nonatomic, assign) NSUInteger textViewTag;
/**隐私协议Y偏移量  仅对授权页面的隐私协议起作用
 该控件底部（bottom）相对于屏幕（safeArea）底部（bottom）的距离
 */
@property (nonatomic,assign) CGFloat offsetY;
/**忽略：隐私协议url与webNavTitle对应dic*/
@property (nonatomic, readonly, strong) NSMutableDictionary *urlDic;
/**该协议富文本样式属于授权页面还是弹窗确认框，默认属于授权页面，即默认值为NO*/
@property (nonatomic, assign) BOOL isDialogPrivacy;

/**
 @param url 协议地址 可为空，传@""即可
 @param color 协议文本颜色
 @param title 协议web页面导航栏的标题文本  ***可为空，默认为：服务与隐私协议
 @param range 协议点击、文本颜色的范围
 */
- (void)addAttributeWithUrl:(NSString * _Nullable)url Color:(UIColor *)color Title:(NSString * _Nullable)title Range:(NSRange)range;

@end

@protocol EAccountOpenPageConfig <NSObject>

@optional
/**
 根据tag获取对应的view
 @param tag 对应的view的tag
 */
- (UIView *)getViewByTag:(NSInteger)tag;

@end

NS_ASSUME_NONNULL_END
