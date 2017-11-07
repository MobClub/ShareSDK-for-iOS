//
//  ViewController.m
//  ShareSDK_FuncDemo
//
//  Created by youzu_Max on 2017/10/30.
//  Copyright © 2017年 youzu. All rights reserved.
//

#import "ViewController.h"
#import "AuthViewController.h"
#import <ShareSDK/ShareSDK+Base.h>
#import <ShareSDKExtension/ShareSDK+Extension.h>
#import <ShareSDKUI/ShareSDKUI.h>
#import <ShareSDKUI/SSUIShareActionSheetCustomItem.h>
#import <ShareSDKUI/SSUIShareActionSheetStyle.h>
#import <ShareSDKUI/SSUIEditorViewStyle.h>
#import <ShareSDKConfigFile/ShareSDK+XML.h>

#define ShareAlert(_S_, ...)     [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:(_S_), ##__VA_ARGS__] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - 直接调用分享平台API

/**
 *  当需要非ShareSDK提供支持的接口（即除授权、分享、获取用户信息、好友列表、添加好友）时,需要调用ShareSDK的callApi方法进行API调用。
 *  首先需要取得API的调用地址，以及需要提交的请求的方式。以新浪微博为例，假如要获取用户微博列表，则需要先到http://open.weibo.com/wiki/2/statuses/user_timeline中查看该接口的地址以及其他信息。
 *  然后在根据这些要求填入callApi方法中。
 *  注：该方法位于ShareSDK+Base类目中，因此，在调用前需要先导入ShareSDK+Base.h头文件。
 */
- (IBAction)apiCall:(id)sender
{
    //下面示例用于演示如何获取个人的微博列表数据
    [ShareSDK callApi:SSDKPlatformTypeSinaWeibo //指定是哪个平台的API请求
                  url:@"https://api.weibo.com/2/statuses/user_timeline.json" //API的请求地址
               method:SSDKHttpMethodGet //对应API文档上的HTTP请求方式
           parameters:nil  //对应API文档上的请求参数
          onAuthorize:^(SSDKAuthorizeStateChangedHandler authorizeStateChangedHandler) {
              
              //当尚未授权或者授权过期时会回调此方法
              [ShareSDK authorize:SSDKPlatformTypeSinaWeibo
                         settings:nil
                   onStateChanged:authorizeStateChangedHandler];
              
          } onStateChanged:^(SSDKResponseState state, id data, NSError *error) {
           
           switch (state)
           {
               case SSDKResponseStateSuccess:
               {
                   ShareAlert(@"成功：\n%@",data);
                   break;
               }
               case SSDKResponseStateFail:
               {
                   ShareAlert(@"失败：\n%@",error);
                   break;
               }
               case SSDKResponseStateCancel:
               {
                   ShareAlert(@"取消");
                   break;
               }
               default:
                   break;
           }
           
       }];
}

#pragma mark - 自定义授权界面

/**
 *  方式一：在原有的授权视图基础上进行一些简单的调整，如：导航栏颜色、背景、标题等等。这些ShareSDK提供的SSDKAuthViewStyle类来进行快捷的样式调整。
 */
- (IBAction)authView_1:(id)sender
{
    [SSDKAuthViewStyle setNavigationBarBackgroundColor:[UIColor blueColor]];
    [SSDKAuthViewStyle setTitle:@"自定义授权视图 - 1"];
    [SSDKAuthViewStyle setTitleColor:[UIColor yellowColor]];
    
    [ShareSDK authorize:SSDKPlatformTypeSinaWeibo
               settings:nil
         onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
     {
         switch (state) {
             case SSDKResponseStateSuccess:
             {
                 ShareAlert(@"授权成功");
                 break;
             }
             case SSDKResponseStateFail:
             {
                 
                 ShareAlert(@"授权失败");
                 break;
             }
             case SSDKResponseStateCancel:
             {
                 ShareAlert(@"授权取消");
                 break;
             }
             default:
                 break;
         }
         
     }];
}

/**
 *  方式二：ShareSDK+Base类目中提供了一个authorize方法的另外一个版本，可以允许在弹出授权视图时实现更高级别的自定义。
 */
- (IBAction)authView_2:(id)sender
{
    __weak ViewController *theController = self;
    [ShareSDK authorize:SSDKPlatformTypeSinaWeibo
               settings:nil
          onViewDisplay:^(UIView<ISSDKAuthView> *view)
     {
         //在此回调中进行授权视图自定义
         AuthViewController *vc = [[AuthViewController alloc] initWithAuthView:view];
         UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
         [theController presentViewController:nvc
                                     animated:YES
                                   completion:nil];
         
         
     }onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
             
             switch (state) {
                 case SSDKResponseStateSuccess:
                 {
                     ShareAlert(@"授权成功");
                     break;
                 }
                 case SSDKResponseStateFail:
                 {
                     ShareAlert(@"授权失败");
                     break;
                 }
                 case SSDKResponseStateCancel:
                 {
                     ShareAlert(@"授权取消");
                     break;
                 }
                 default:
                     break;
             }
         }];
}


#pragma mark - 自定义分享内容编辑视图

- (IBAction)editorView:(id)sender
{
    SSDKImage* urlImage = [[SSDKImage alloc] initWithURL:[NSURL URLWithString:@"http://img4.duitang.com/uploads/item/201303/14/20130314114434_M3fej.thumb.600_0.jpeg"]];
    NSArray* imgArr = @[urlImage];
    NSMutableDictionary* params = [NSMutableDictionary dictionary];
    [params SSDKSetupShareParamsByText:@"ShareSDK is the most comprehensive Social SDK in the world , which share easily with 40+ platforms , from around the world.For more information,please visit http://www.mob.com website."
                                images:imgArr
                                   url:[NSURL URLWithString:@"http://163.com"]
                                 title:@"Share Title"
                                  type:SSDKContentTypeImage];
    //    [params SSDKSetupSinaWeiboShareParamsByText:@"sina text-test"
    //                                          title:@"微博测试标题"
    //                                          image:urlImage
    //                                            url:nil
    //                                       latitude:40.413467
    //                                      longitude:116.646439
    //                                       objectID:nil
    //                                           type:SSDKContentTypeImage];
    //    [params SSDKSetupFacebookParamsByText:@"Facebook text-test" image:urlImage type:SSDKContentTypeImage];
    
    [params SSDKSetupFacebookParamsByText:nil
                                    image:@"http://f.hiphotos.bdimg.com/album/w%3D2048/sign=df8f1fe50dd79123e0e09374990c5882/cf1b9d16fdfaaf51e6d1ce528d5494eef01f7a28.jpg"
                                      url:[NSURL URLWithString:@"http://163.com"]
                                 urlTitle:@"The Link Title"
                                  urlName:@"The Link Name"
                           attachementUrl:[NSURL URLWithString:@""]
                                     type:SSDKContentTypeWebPage];
    
    
    [params SSDKEnableUseClientShare];
    [params SSDKSetupTencentWeiboShareParamsByText:@"TencentWeibo xt-test" images:imgArr latitude:34.12 longitude:54.05 type:SSDKContentTypeImage];
    
    [SSUIEditorViewStyle setStatusBarStyle:UIStatusBarStyleLightContent];
    [SSUIEditorViewStyle setTitle:@"自定义标题"];
    [SSUIEditorViewStyle setTitleColor:[UIColor yellowColor]];
    [SSUIEditorViewStyle setiPhoneNavigationBarBackgroundImage:[UIImage imageNamed:@"wenBG.jpg"]];
    [SSUIEditorViewStyle setiPhoneNavigationBarBackgroundColor:[UIColor purpleColor]];
    [SSUIEditorViewStyle setiPadNavigationBarBackgroundColor:[UIColor lightGrayColor]];
    [SSUIEditorViewStyle setCancelButtonLabel:@"ccccc"];
    [SSUIEditorViewStyle setCancelButtonImage:[UIImage imageNamed:@"wenButton.jpg"]];
    [SSUIEditorViewStyle setCancelButtonLabelColor:[UIColor blueColor]];
    
    [SSUIEditorViewStyle setShareButtonImage:[UIImage imageNamed:@"wenButton.jpg"]];
    [SSUIEditorViewStyle setShareButtonLabelColor:[UIColor greenColor]];
    [SSUIEditorViewStyle setShareButtonLabel:@"right"];
    [SSUIEditorViewStyle setContentViewBackgroundColor:[UIColor brownColor]];
    //    [SSUIEditorViewStyle setSupportedInterfaceOrientation:UIInterfaceOrientationMaskLandscape];
    
    [ShareSDK showShareEditor:SSDKPlatformSubTypeWechatSession
           otherPlatformTypes:nil
                  shareParams:params
          onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
              
              if (state == SSDKResponseStateSuccess)
              {
                  NSLog(@"平台:%lu 分享成功！",(unsigned long)platformType);
                  NSLog(@"平台:%@ 分享的图片！",[contentEntity images]);
              }
              
              if (state == SSDKResponseStateFail)
              {
                  NSLog(@"平台:%lu 分享失败,错误信息:\n%@",(unsigned long)platformType,error);
              }
              
              if (state == SSDKResponseStateCancel)
              {
                  NSLog(@"平台:%lu 取消分享",(unsigned long)platformType);
              }
          }];
}


#pragma mark - 通过配置文件方式分享

/*
    根据项目中的配置文件ShareContent.xml的配置内容进行分享(本分享方法不含任何UI)

    分享的内容会按照传入的contentName搜索对应的ShareContent.xml中的<Content>节点之name属性
    使用以下接口请注意:

    1.比需在项目中存在ShareContent.xml 文件，且符合xml文件格式, <Content>节点之name 属性填上您的标识

    2.在下面接口的首个参数传入对应的<Content>节点的name

    3.(可选)通过自定义一本字典,并定义其key和value。其中value的值为你在ShareContent.xml文件中<Content>节点中以"{}"括起来的内容。
    例如 :NSDictionary *customFields = @{@"imgUrl" : imgPath};
    那么 节点中某个地方就应该使用 "{imgUrl}",两边字段一旦吻合,imgPath 就会替代 "{imgUrl}"中的内容(大括号也会被取代)
    通过此种方式，就可以实现任意自定义字段的替换;你也可以随时动态改变传如的customFields 字典，来实现动态的分享内容的改变。
 */
- (IBAction)configShare:(id)sender
{
    NSString *imgPath = [[NSBundle mainBundle] pathForResource:@"Sample" ofType:@"jpg"];
    
    if (imgPath)
    {
        NSDictionary *customFields = @{@"imgUrl" : imgPath,
                                       @"url" : @"http://mob.com"};
        
        [ShareSDK shareWithContentName:@"ShareSDK"
                              platform:SSDKPlatformTypeSinaWeibo
                          customFields:customFields
                        onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
                            
                            switch (state)
                            {
                                case SSDKResponseStateSuccess:
                                {
                                    ShareAlert(@"分享成功");
                                    break;
                                }
                                case SSDKResponseStateFail:
                                {
                                    ShareAlert(@"分享失败");
                                    break;
                                }
                                case SSDKResponseStateCancel:
                                {
                                    ShareAlert(@"分享取消");
                                    break;
                                }
                                default:
                                    break;
                            }
                        }];
    }
}

#pragma mark - 自定义分享ActionSheet菜单样式

- (IBAction)shareActionSheet:(id)sender
{
    NSURL *imgUrl = [NSURL URLWithString:@"http://f.hiphotos.bdimg.com/album/w%3D2048/sign=df8f1fe50dd79123e0e09374990c5882/cf1b9d16fdfaaf51e6d1ce528d5494eef01f7a28.jpg"];
    //1、构造分享内容
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params SSDKSetupShareParamsByText:@"ShareSDK is the most comprehensive Social SDK in the world , which share easily with 40+ platforms , from around the world.For more information,please visit http://www.mob.com website."
                                images:@[imgUrl]
                                   url:[NSURL URLWithString:@"http://www.mob.com"]
                                 title:@"分享标题"
                                  type:SSDKContentTypeImage];
    [params SSDKEnableUseClientShare];
    
    //1.2、自定义分享平台（非必要）
    //    NSMutableArray *activePlatforms = [NSMutableArray arrayWithArray:@[@(SSDKPlatformTypeWechat),@(SSDKPlatformTypeQQ),@(SSDKPlatformTypeRenren),@(SSDKPlatformTypeSinaWeibo),@(SSDKPlatformTypeSMS),@(SSDKPlatformTypeTwitter)]];
    //    NSMutableArray *activePlatforms = [NSMutableArray arrayWithArray:@[@(SSDKPlatformSubTypeWechatTimeline),@(SSDKPlatformSubTypeWechatSession),@(SSDKPlatformSubTypeWechatFav),@(SSDKPlatformSubTypeQQFriend),@(SSDKPlatformSubTypeQZone),@(SSDKPlatformTypeRenren),@(SSDKPlatformTypeSinaWeibo),@(SSDKPlatformTypeSMS),@(SSDKPlatformTypeTwitter)]];
    //    SSUIShareActionSheetCustomItem *item = [SSUIShareActionSheetCustomItem itemWithIcon:[UIImage imageNamed:@"Icon.png"]
    //                                                                                  label:@"自定义"
    //                                                                                onClick:^{
    //
    //                                                                                    NSLog(@"=== 自定义item点击 ===");
    //                                                                                }];
    //    [activePlatforms addObject:item];
    
    //    //1.3、自定义分享菜单栏（非必要）
    //    [SSUIShareActionSheetStyle setStatusBarStyle:UIStatusBarStyleLightContent];
    //    [SSUIEditorViewStyle setStatusBarStyle:UIStatusBarStyleLightContent];
    //    [SSUIShareActionSheetStyle setActionSheetBackgroundColor:[UIColor colorWithRed:137/255.0 green:142/255.0 blue:150/255.0 alpha:0.8]];
    //    [SSUIShareActionSheetStyle setActionSheetColor:[UIColor colorWithRed:21.0/255.0 green:21.0/255.0 blue:21.0/255.0 alpha:1.0]];
    //    [SSUIShareActionSheetStyle setCancelButtonBackgroundColor:[UIColor colorWithRed:21.0/255.0 green:21.0/255.0 blue:21.0/255.0 alpha:1.0]];
    //
    //    [SSUIShareActionSheetStyle setCancelButtonLabelColor:[UIColor whiteColor]];
    //    [SSUIShareActionSheetStyle setItemNameColor:[UIColor whiteColor]];
    //    [SSUIShareActionSheetStyle setItemNameFont:[UIFont systemFontOfSize:10]];
    //    [SSUIShareActionSheetStyle setCurrentPageIndicatorTintColor:[UIColor colorWithRed:156/255.0 green:156/255.0 blue:156/255.0 alpha:1.0]];
    //    [SSUIShareActionSheetStyle setPageIndicatorTintColor:[UIColor colorWithRed:62/255.0 green:62/255.0 blue:62/255.0 alpha:1.0]];
    //    [SSUIShareActionSheetStyle setSupportedInterfaceOrientation:UIInterfaceOrientationMaskPortrait];
    //    NSMutableArray *active = [ShareSDK activePlatforms];
    //
    //    [SSUIShareActionSheetStyle setShareActionSheetStyle:ShareActionSheetStyleSimple];
    //    [SSUIShareActionSheetStyle isCancelButtomHidden:NO];
    //
    //    //1.4、自定义支持的屏幕方向
    //    [ShareSDK setSupportedInterfaceOrientation:UIInterfaceOrientationMaskPortrait];
    
    //    BOOL isClient =  [ShareSDK isClientInstalled:SSDKPlatformTypeFacebookMessenger];
    
    
    
    //2、弹出分享菜单栏
    SSUIShareActionSheetController *actionSheet = [ShareSDK showShareActionSheet:sender
                                                   //    [ShareSDK showShareActionSheet:sender
                                                                           items:nil
                                                                     shareParams:params
                                                             onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                                                                 
                                                                 switch (state) {
                                                                         
                                                                     case SSDKResponseStateBegin:
                                                                     {
                                                                         break;
                                                                     }
                                                                     case SSDKResponseStateSuccess:
                                                                     {
                                                                         //Facebook Messenger、WhatsApp等平台捕获不到分享成功或失败的状态，最合适的方式就是对这些平台区别对待
                                                                         if (platformType == SSDKPlatformTypeFacebookMessenger)
                                                                         {
                                                                             break;
                                                                         }
                                                                         
                                                                         ShareAlert(@"分享成功");
                                                                         
                                                                         break;
                                                                     }
                                                                     case SSDKResponseStateFail:
                                                                     {
                                                                         ShareAlert(@"分享失败:%@",error);
                                                                         break;
                                                                     }
                                                                     case SSDKResponseStateCancel:
                                                                     {
                                                                         ShareAlert(@"分享取消");
                                                                         break;
                                                                     }
                                                                     default:
                                                                         break;
                                                                 }
                                                             }];
    
        [actionSheet.directSharePlatforms removeObject:@(SSDKPlatformTypeWechat)];
}

@end
