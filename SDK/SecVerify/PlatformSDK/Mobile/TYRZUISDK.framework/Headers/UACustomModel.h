//
//  UACustomModel.h
//  Test
//
//  Created by issuser on 2018/5/18.
//  Copyright © 2018年 林涛. All rights reserved.
//

#import "UAEnums.h"

@interface UACustomModel : NSObject

/**
 版本注意事项:
 授权页面的各个控件的Y轴默认值都是以375*667屏幕为基准 系数 ： 当前屏幕高度/667
 1、当设置Y轴并有效时 偏移量OffsetY属于相对导航栏的绝对Y值
 2、（负数且超出当前屏幕无效）为保证各个屏幕适配,请自行设置好Y轴在屏幕上的比例（推荐:当前屏幕高度/667）
 */

#pragma mark -----------------------------授权页面----------------------------------

#pragma mark VC必传属性
/**当前VC,注意:要用一键登录这个值必传*/
@property (nonatomic,weak) UIViewController *currentVC;

#pragma mark 自定义控件
/**授权界面自定义控件View的Block*/
@property (nonatomic,copy) void(^authViewBlock)(UIView *customView, CGRect numberFrame,CGRect loginBtnFrame, CGRect checkBoxFrame , CGRect privacyFrame);
/**授权页面是否需要弹出动画*/
@property (nonatomic, assign) BOOL presentAnimated;
/**授权页面弹出的动画效果：参考UAPresentationDirection枚举*/
@property (nonatomic, assign) UAPresentationDirection presentType;
/**授权界面背景图片*/
@property (nonatomic,strong) UIImage *authPageBackgroundImage;
/**自定义Loading View（回调默认关闭,如需自己控制关闭,则用keywindow并在一键登录回调中关闭）*/
@property (nonatomic,copy) void(^authLoadingViewBlock)(UIView *loadingView);
#pragma mark 登录按钮
/**登录按钮文本*/
@property (nonatomic,strong) NSAttributedString *logBtnText;
/**登录按钮Y偏移量*/
@property (nonatomic,strong) NSNumber * logBtnOffsetY;
/**登录按钮的左右边距 注意:按钮呈现的宽度在竖屏时必须大于屏幕的一半,横屏时必须大于屏幕的三分之一
 示例:@[@50,@70] 只能两个元素
 */
@property (nonatomic, strong) NSArray <NSNumber *> *logBtnOriginLR;
/**登录按钮高h 注意：必须大于40*/
@property (nonatomic, assign) CGFloat logBtnHeight;
/**1登录按钮背景图片添加到数组(顺序如下)
 @[激活状态的图片,失效状态的图片,高亮状态的图片]
*/
@property (nonatomic,strong) NSArray *logBtnImgs;
/**登录按钮高距离底部的高度*/
@property (nonatomic, strong) NSNumber *logBtnOffsetY_B;

#pragma mark 号码框设置
/**手机号码富文本属性 */
@property (nonatomic,strong) NSDictionary<NSAttributedStringKey,id> *numberTextAttributes;
/**号码栏X偏移量*/
@property (nonatomic,strong) NSNumber * numberOffsetX;
/**号码栏Y偏移量*/
@property (nonatomic,strong) NSNumber * numberOffsetY;

/**号码栏Y偏移量（基于底部）*/
@property (nonatomic,strong) NSNumber * numberOffsetY_B;

#pragma mark 隐私条款
/**复选框未选中时图片*/
@property (nonatomic,strong) UIImage *uncheckedImg;
/**复选框选中时图片*/
@property (nonatomic,strong) UIImage *checkedImg;
/**复选框大小（只能正方形）必须大于12*/
@property (nonatomic,strong) NSNumber *checkboxWH;
/**隐私条款（包括check框）的左右边距*/
@property (nonatomic, strong) NSArray <NSNumber *> *appPrivacyOriginLR;
/**隐私的内容模板：
 1、全句可自定义但必须保留"&&默认&&"字段表明SDK默认协议,否则设置不生效
 2、协议1和协议2的名称要与数组 str1 和 str2 ... 里的名称 一样
 3、必设置项（参考SDK的demo）
 appPrivacieDemo设置内容：登录并同意&&默认&&和&&百度协议&&、&&京东协议2&&登录并支持一键登录
 展示：   登录并同意中国移动条款协议和百度协议1、京东协议2登录并支持一键登录
 */
@property (nonatomic, copy) NSAttributedString *appPrivacyDemo;
/**隐私条款默认协议是否开启书名号
 */
@property (nonatomic, assign) BOOL privacySymbol;
/**隐私条款文字内容的方向:默认是居左
 */
@property (nonatomic,assign) NSTextAlignment appPrivacyAlignment;
/**隐私条款:数组（务必按顺序）要设置NSLinkAttributeName属性可以跳转协议
 对象举例：
 NSAttributedString *str1 = [[NSAttributedString alloc]initWithString:@"百度协议" attributes:@{NSLinkAttributeName:@"https://www.baidu.com"}];
 @[str1,,str2,str3,...]
 */
@property (nonatomic,strong) NSArray <NSAttributedString *> *appPrivacy;
/**隐私条款名称颜色（协议）统一设置
 */
@property (nonatomic,strong) UIColor *privacyColor;
/**隐私条款Y偏移量*/
@property (nonatomic,strong) NSNumber * privacyOffsetY;
/**隐私条款check框默认状态 默认:NO */
@property (nonatomic,assign) BOOL privacyState;
/**隐私条款Y偏移量(注:此属性为与屏幕底部的距离)*/
@property (nonatomic,strong) NSNumber *privacyOffsetY_B;

#pragma mark -----------------------------------协议页面-----------------------------------
/**web协议界面导航返回图标(尺寸根据图片大小)*/
@property (nonatomic,strong) UIImage *webNavReturnImg;

/**web协议界面导航标题字体属性设置
 默认值：@{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName: [UIFont systemFontOfSize:16]}
*/
@property (nonatomic,strong) NSDictionary<NSAttributedStringKey, id> *webNavTitleAttrs;

/**web协议界面导航标题栏颜色*/
@property (nonatomic,strong) UIColor *webNavColor;

#pragma mark ----------------------弹窗:(温馨提示:由于受屏幕影响，小屏幕（5S,5E,5）需要改动字体和另自适应和布局)--------------------
#pragma mark --------------------------窗口模式1（居中弹窗） 弹框模式需要配合自定义坐标属性使用可自适应-----------------------------------

//务必在设置控件位置时，自行查看各个机型模拟器是否正常
/**温馨提示:
 窗口1模式下，自动隐藏系统导航栏,并生成一个UILabel 其frame为（0,0,窗口宽*scaleW,44*scaleW）
 返回按钮的frame查看51属性备注,添加在UILabel的center.y位置
*/
/**窗口模式开关*/
@property (nonatomic,assign) BOOL authWindow;

/**窗口模式推出动画
 UIModalTransitionStyleCoverVertical, 下推
 UIModalTransitionStyleFlipHorizontal,翻转
 UIModalTransitionStyleCrossDissolve, 淡出
 */
@property (nonatomic,assign) UIModalTransitionStyle modalTransitionStyle;

/**自定义窗口弧度 默认是10*/
@property (nonatomic,assign) CGFloat cornerRadius;

/**自定义窗口宽-缩放系数(屏幕宽乘以系数) 默认是0.8*/
@property (nonatomic,assign) CGFloat scaleW;

/**自定义窗口高-缩放系数(屏幕高乘以系数) 默认是0.5*/
@property (nonatomic,assign) CGFloat scaleH;

#pragma mark -----------窗口模式2（边缘弹窗） UIPresentationController（可配合UAPresentationDirection动画使用）-----------
/**此属性支持半弹框方式与authWindow不同（此方式为UIPresentationController）设置后自动隐藏切换按钮，该属性需要UIModalPresentationCustom（边缘弹窗模式下SDK默认设置）下生效*/
@property (nonatomic,assign) CGSize controllerSize;
/**状态栏着色样式(隐藏导航栏时设置)*/
@property (nonatomic,assign) UIStatusBarStyle statusBarStyle;
/**横竖屏默认属性*/
@property (nonatomic,assign) UIInterfaceOrientation faceOrientation;
/**模态展示样式设置属性*/
@property (nonatomic,assign) UIModalPresentationStyle modalPresentationStyle;

#pragma mark - Toast文案
/**未勾选隐私条款提示的自定义提示文案，提示功能默认关闭，该属性被合法赋值（非空，且最大长度为100的字符串）后打开提示功能。*/
@property (nonatomic, strong) NSString *checkTipText;

#pragma mark - 多语言配置
/**多语言配置：
 UALanguageSimplifiedChinese ,   //简体中文
 UALanguageTraditionalChinese,   //繁体中文
 UALanguageEnglish,                     //英文
 */
@property (nonatomic, assign) UALanguageType appLanguageType;
@end
