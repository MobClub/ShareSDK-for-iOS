//
//  ShareViewController.m
//  ShareSDKDemo
//
//  Created by 刘靖煌 on 15/10/24.
//  Copyright © 2015年 mob.com. All rights reserved.
//

#import "ShareViewController.h"

//ShareSDK头文件
#import <ShareSDK/ShareSDK.h>

@interface ShareViewController ()

@property (nonatomic, strong) id<ISSShareActionSheet> actionSheet;

@end

@implementation ShareViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //添加测试按钮
    [self addButtonWithName:NSLocalizedString(@"CommonShare", nil) action:@selector(commonShare:) index:0];
    [self addButtonWithName:NSLocalizedString(@"CustomizeShareContent", nil) action:@selector(customizeShareContent:) index:1];
    [self addButtonWithName:NSLocalizedString(@"ShareDirectly", nil) action:@selector(directShare:) index:2];
    [self addButtonWithName:NSLocalizedString(@"ShareWithShareMenu", nil) action:@selector(shareWithShareMenuOnly:) index:3];
    [self addButtonWithName:NSLocalizedString(@"ShareWithShareView", nil) action:@selector(shareWithShareView:) index:4];
    [self addButtonWithName:NSLocalizedString(@"OneKeyShare", nil) action:@selector(oneKeyShare:) index:5];
    [self addButtonWithName:NSLocalizedString(@"ShareWithClient", nil) action:@selector(clientShare:) index:6];
}

- (void)addButtonWithName:(NSString *)buttonName action:(SEL)action index:(NSInteger)index
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:buttonName forState:UIControlStateNormal];
    [btn sizeToFit];
    btn.frame = CGRectMake(self.view.frame.size.width/2 - 150 , 50 + index * 50, 300, 40);
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)commonShare:(id)sender
{
    //1、构造分享内容
    //1.1、要分享的图片（以下分别是网络图片和本地图片的生成方式的示例）
    id<ISSCAttachment> remoteAttachment = [ShareSDKCoreService attachmentWithUrl:@"http://f.hiphotos.bdimg.com/album/w%3D2048/sign=df8f1fe50dd79123e0e09374990c5882/cf1b9d16fdfaaf51e6d1ce528d5494eef01f7a28.jpg"];
    id<ISSCAttachment> localAttachment = [ShareSDKCoreService attachmentWithPath:[[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"]];
    
    //1.2、以下参数分别对应：内容、默认内容、图片、标题、链接、描述、分享类型
    id<ISSContent> publishContent = [ShareSDK content:@"Share your fabulous message with ShareSDK. @Mob移动开发者服务平台 @ShareSDK"
                                       defaultContent:nil
                                                image:remoteAttachment
                                                title:@"test title"
                                                  url:@"http://www.mob.com"
                                          description:nil
                                            mediaType:SSPublishContentMediaTypeImage];
    
    //1+、创建弹出菜单容器（iPad应用必要，iPhone应用非必要）
    id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:sender
                            arrowDirect:UIPopoverArrowDirectionUp];
    
    //2、展现分享菜单
    [ShareSDK showShareActionSheet:container
                         shareList:nil
                           content:publishContent
                     statusBarTips:NO
                       authOptions:nil
                      shareOptions:nil
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                
                                NSLog(@"=== response state :%zi ",state);
                                
                                //可以根据回调提示用户。
                                if (state == SSResponseStateSuccess)
                                {
                                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                                    message:nil
                                                                                   delegate:self
                                                                          cancelButtonTitle:@"OK"
                                                                          otherButtonTitles:nil, nil];
                                    [alert show];
                                }
                                else if (state == SSResponseStateFail)
                                {
                                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                                                    message:[NSString stringWithFormat:@"Error Description：%@",[error errorDescription]]
                                                                                   delegate:self
                                                                          cancelButtonTitle:@"OK"
                                                                          otherButtonTitles:nil, nil];
                                    [alert show];
                                }
                            }];
}

- (void)customizeShareContent:(id)sender
{
    //1、构造分享内容
    //1.1、要分享的图片（以下分别是网络图片和本地图片的生成方式的示例）
    id<ISSCAttachment> remoteAttachment = [ShareSDKCoreService attachmentWithUrl:@"http://f.hiphotos.bdimg.com/album/w%3D2048/sign=df8f1fe50dd79123e0e09374990c5882/cf1b9d16fdfaaf51e6d1ce528d5494eef01f7a28.jpg"];
//    id<ISSCAttachment> localAttachment = [ShareSDKCoreService attachmentWithPath:[[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"]];
    
    //1.2、以下参数分别对应：内容、默认内容、图片、标题、链接、描述、分享类型
    id<ISSContent> publishContent = [ShareSDK content:@"Share your fabulous message with ShareSDK.@Mob移动开发者服务平台 @ShareSDK"
                                       defaultContent:nil
                                                image:remoteAttachment
                                                title:@"test title"
                                                  url:@"http://www.mob.com"
                                          description:nil
                                            mediaType:SSPublishContentMediaTypeNews];
    
    //1.3、自定义各个平台的分享内容(非必要)
    [self customizePlatformShareContent:publishContent];
    
    //1.4、自定义一个分享菜单项(非必要)
    id<ISSShareActionSheetItem> customItem = [ShareSDK shareActionSheetItemWithTitle:@"Custom"
                                                                                icon:[UIImage imageNamed:@"Icon.png"]
                                                                        clickHandler:^{
                                                                            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Custom item"
                                                                                                                                message:@"Custom item has been clicked"
                                                                                                                               delegate:nil
                                                                                                                      cancelButtonTitle:@"OK"
                                                                                                                      otherButtonTitles:nil];
                                                                            [alertView show];
                                                                        }];
    //1.5、分享菜单栏选项排列位置和数组元素index相关(非必要)
    NSArray *shareList = [ShareSDK customShareListWithType:
                          SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                          SHARE_TYPE_NUMBER(ShareTypeFacebook),
                          SHARE_TYPE_NUMBER(ShareTypeWeixiSession),
                          SHARE_TYPE_NUMBER(ShareTypeWeixiTimeline),
                          SHARE_TYPE_NUMBER(ShareTypeSMS),
                          SHARE_TYPE_NUMBER(ShareTypeQQ),
                          SHARE_TYPE_NUMBER(ShareTypeQQSpace),
                          SHARE_TYPE_NUMBER(ShareTypeMail),
                          SHARE_TYPE_NUMBER(ShareTypeCopy),
                          customItem,nil];

    //1+、创建弹出菜单容器（iPad应用必要，iPhone应用非必要）
    id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
    
    //2、展现分享菜单
    [ShareSDK showShareActionSheet:container
                         shareList:shareList
                           content:publishContent
                     statusBarTips:NO
                       authOptions:nil
                      shareOptions:nil
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                
                                NSLog(@"=== response state :%zi ",state);
                                
                                //可以根据回调提示用户。
                                if (state == SSResponseStateSuccess)
                                {
                                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                                    message:nil
                                                                                   delegate:self
                                                                          cancelButtonTitle:@"OK"
                                                                          otherButtonTitles:nil, nil];
                                    [alert show];
                                }
                                else if (state == SSResponseStateFail)
                                {
                                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                                                    message:[NSString stringWithFormat:@"Error Description：%@",[error errorDescription]]
                                                                                   delegate:self
                                                                          cancelButtonTitle:@"OK"
                                                                          otherButtonTitles:nil, nil];
                                    [alert show];
                                }
                            }];
}

- (void)customizePlatformShareContent:(id<ISSContent>)publishContent
{
    //定制QQ空间分享内容
    [publishContent addQQSpaceUnitWithTitle:@"The title of QQ Space."
                                        url:@"http://www.mob.com"
                                       site:nil
                                    fromUrl:nil
                                    comment:@"comment"
                                    summary:@"summary"
                                      image:nil
                                       type:@(4)
                                    playUrl:nil
                                       nswb:0];
    
    //定制邮件分享内容
    [publishContent addMailUnitWithSubject:@"The subject of Mail"
                                   content:@"The content of Mail."
                                    isHTML:[NSNumber numberWithBool:YES]
                               attachments:nil
                                        to:nil
                                        cc:nil
                                       bcc:nil];

    //定制新浪微博分享内容
    id<ISSCAttachment> localAttachment = [ShareSDKCoreService attachmentWithPath:[[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"]];
    [publishContent addSinaWeiboUnitWithContent:@"The content of Sina Weibo" image:localAttachment];
}

- (void)directShare:(id)sender
{
    //1、构造分享内容
    //1.1、要分享的图片（以下分别是网络图片和本地图片的生成方式的示例）
    id<ISSCAttachment> remoteAttachment = [ShareSDKCoreService attachmentWithUrl:@"http://f.hiphotos.bdimg.com/album/w%3D2048/sign=df8f1fe50dd79123e0e09374990c5882/cf1b9d16fdfaaf51e6d1ce528d5494eef01f7a28.jpg"];
    
    //1.2、以下参数分别对应：内容、默认内容、图片、标题、链接、描述、分享类型
    id<ISSContent> publishContent = [ShareSDK content:@"Share your fabulous message with ShareSDK. @刘靖煌"
                                       defaultContent:nil
                                                image:remoteAttachment
                                                title:@"test title"
                                                  url:@"http://www.mob.com"
                                          description:nil
                                            mediaType:SSPublishContentMediaTypeNews];
    //直接分享接口
    [ShareSDK shareContent:publishContent
                      type:ShareTypeQQSpace
               authOptions:nil
              shareOptions:nil
             statusBarTips:NO
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        NSLog(@"=== response state :%zi ",state);
                        
                        //可以根据回调提示用户。
                        if (state == SSResponseStateSuccess)
                        {
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                            message:nil
                                                                           delegate:self
                                                                  cancelButtonTitle:@"OK"
                                                                  otherButtonTitles:nil, nil];
                            [alert show];
                        }
                        else if (state == SSResponseStateFail)
                        {
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                                            message:[NSString stringWithFormat:@"Error Description：%@",[error errorDescription]]
                                                                           delegate:self
                                                                  cancelButtonTitle:@"OK"
                                                                  otherButtonTitles:nil, nil];
                            [alert show];
                        }
                    }];
}

- (void)shareWithShareMenuOnly:(id)sender
{
    //1、构造分享内容
    //1.1、要分享的图片（以下分别是网络图片和本地图片的生成方式的示例）
    id<ISSCAttachment> remoteAttachment = [ShareSDKCoreService attachmentWithUrl:@"http://f.hiphotos.bdimg.com/album/w%3D2048/sign=df8f1fe50dd79123e0e09374990c5882/cf1b9d16fdfaaf51e6d1ce528d5494eef01f7a28.jpg"];
//    id<ISSCAttachment> localAttachment = [ShareSDKCoreService attachmentWithPath:[[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"]];
    
    //1.2、以下参数分别对应：内容、默认内容、图片、标题、链接、描述、分享类型
    id<ISSContent> publishContent = [ShareSDK content:@"Share your fabulous message with ShareSDK. @刘靖煌"
                                       defaultContent:nil
                                                image:remoteAttachment
                                                title:@"test title"
                                                  url:@"http://www.mob.com"
                                          description:nil
                                            mediaType:SSPublishContentMediaTypeNews];
    
    //1.3、自定义各个平台的分享内容(非必要)
    [self customizePlatformShareContent:publishContent];
    
    //1+、创建弹出菜单容器
    id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
    
    //自定义新浪微博分享菜单项
    id<ISSShareActionSheetItem> sinaItem = [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeSinaWeibo]
                                                                              icon:[ShareSDK getClientIconWithType:ShareTypeSinaWeibo]
                                                                      clickHandler:^{
                                                                          [ShareSDK shareContent:publishContent
                                                                                            type:ShareTypeSinaWeibo
                                                                                     authOptions:nil
                                                                                   statusBarTips:YES
                                                                                          result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                              
                                                                                              NSLog(@"=== response state :%zi ",state);
                                                                                              
                                                                                              //可以根据回调提示用户。
                                                                                              if (state == SSResponseStateSuccess)
                                                                                              {
                                                                                                  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                                                                                                  message:nil
                                                                                                                                                 delegate:self
                                                                                                                                        cancelButtonTitle:@"OK"
                                                                                                                                        otherButtonTitles:nil, nil];
                                                                                                  [alert show];
                                                                                              }
                                                                                              else if (state == SSResponseStateFail)
                                                                                              {
                                                                                                  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                                                                                                                  message:[NSString stringWithFormat:@"Error Description：%@",[error errorDescription]]
                                                                                                                                                 delegate:self
                                                                                                                                        cancelButtonTitle:@"OK"
                                                                                                                                        otherButtonTitles:nil, nil];
                                                                                                  [alert show];
                                                                                              }
                                                                                          }];
                                                                      }];
    
    //自定义QQ空间分享菜单项
    id<ISSShareActionSheetItem> qzoneItem = [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeQQSpace]
                                                                               icon:[ShareSDK getClientIconWithType:ShareTypeQQSpace]
                                                                       clickHandler:^{
                                                                           [ShareSDK shareContent:publishContent
                                                                                             type:ShareTypeQQSpace
                                                                                      authOptions:nil
                                                                                    statusBarTips:YES
                                                                                           result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                               
                                                                                               NSLog(@"=== response state :%zi ",state);
                                                                                               
                                                                                               //可以根据回调提示用户。
                                                                                               if (state == SSResponseStateSuccess)
                                                                                               {
                                                                                                   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                                                                                                   message:nil
                                                                                                                                                  delegate:self
                                                                                                                                         cancelButtonTitle:@"OK"
                                                                                                                                         otherButtonTitles:nil, nil];
                                                                                                   [alert show];
                                                                                               }
                                                                                               else if (state == SSResponseStateFail)
                                                                                               {
                                                                                                   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                                                                                                                   message:[NSString stringWithFormat:@"Error Description：%@",[error errorDescription]]
                                                                                                                                                  delegate:self
                                                                                                                                         cancelButtonTitle:@"OK"
                                                                                                                                         otherButtonTitles:nil, nil];
                                                                                                   [alert show];
                                                                                               }
                                                                                           }];
                                                                       }];
    
    //自定义Facebook分享菜单项
    id<ISSShareActionSheetItem> fbItem = [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeFacebook]
                                                                            icon:[ShareSDK getClientIconWithType:ShareTypeFacebook]
                                                                    clickHandler:^{
                                                                        [ShareSDK shareContent:publishContent
                                                                                          type:ShareTypeFacebook
                                                                                   authOptions:nil
                                                                                 statusBarTips:YES
                                                                                        result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                            
                                                                                            NSLog(@"=== response state :%zi ",state);
                                                                                            
                                                                                            //可以根据回调提示用户。
                                                                                            if (state == SSResponseStateSuccess)
                                                                                            {
                                                                                                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                                                                                                message:nil
                                                                                                                                               delegate:self
                                                                                                                                      cancelButtonTitle:@"OK"
                                                                                                                                      otherButtonTitles:nil, nil];
                                                                                                [alert show];
                                                                                            }
                                                                                            else if (state == SSResponseStateFail)
                                                                                            {
                                                                                                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                                                                                                                message:[NSString stringWithFormat:@"Error Description：%@",[error errorDescription]]
                                                                                                                                               delegate:self
                                                                                                                                      cancelButtonTitle:@"OK"
                                                                                                                                      otherButtonTitles:nil, nil];
                                                                                                [alert show];
                                                                                            }
                                                                                        }];
                                                                    }];
    
    //自定义Twitter分享菜单项
    id<ISSShareActionSheetItem> twItem = [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeTwitter]
                                                                            icon:[ShareSDK getClientIconWithType:ShareTypeTwitter]
                                                                    clickHandler:^{
                                                                        [ShareSDK shareContent:publishContent
                                                                                          type:ShareTypeTwitter
                                                                                   authOptions:nil
                                                                                 statusBarTips:YES
                                                                                        result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                            
                                                                                            NSLog(@"=== response state :%zi ",state);
                                                                                            
                                                                                            //可以根据回调提示用户。
                                                                                            if (state == SSResponseStateSuccess)
                                                                                            {
                                                                                                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                                                                                                message:nil
                                                                                                                                               delegate:self
                                                                                                                                      cancelButtonTitle:@"OK"
                                                                                                                                      otherButtonTitles:nil, nil];
                                                                                                [alert show];
                                                                                            }
                                                                                            else if (state == SSResponseStateFail)
                                                                                            {
                                                                                                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                                                                                                                message:[NSString stringWithFormat:@"Error Description：%@",[error errorDescription]]
                                                                                                                                               delegate:self
                                                                                                                                      cancelButtonTitle:@"OK"
                                                                                                                                      otherButtonTitles:nil, nil];
                                                                                                [alert show];
                                                                                            }
                                                                                        }];
                                                                    }];
    
    
    //创建自定义分享列表
    NSArray *shareList = [ShareSDK customShareListWithType:
                          sinaItem,
                          SHARE_TYPE_NUMBER(ShareTypeSMS),
                          qzoneItem,
                          SHARE_TYPE_NUMBER(ShareTypeWeixiSession),
                          SHARE_TYPE_NUMBER(ShareTypeWeixiTimeline),
                          SHARE_TYPE_NUMBER(ShareTypeQQ),
                          fbItem,
                          twItem,
                          SHARE_TYPE_NUMBER(ShareTypeMail),
                          SHARE_TYPE_NUMBER(ShareTypeAirPrint),
                          SHARE_TYPE_NUMBER(ShareTypeCopy),
                          nil];
    
    [ShareSDK showShareActionSheet:container
                         shareList:shareList
                           content:publishContent
                     statusBarTips:YES
                       authOptions:nil
                      shareOptions:nil
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                
                                NSLog(@"=== response state :%zi ",state);
                                
                                //可以根据回调提示用户。
                                if (state == SSResponseStateSuccess)
                                {
                                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                                    message:nil
                                                                                   delegate:self
                                                                          cancelButtonTitle:@"OK"
                                                                          otherButtonTitles:nil, nil];
                                    [alert show];
                                }
                                else if (state == SSResponseStateFail)
                                {
                                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                                                    message:[NSString stringWithFormat:@"Error Description：%@",[error errorDescription]]
                                                                                   delegate:self
                                                                          cancelButtonTitle:@"OK"
                                                                          otherButtonTitles:nil, nil];
                                    [alert show];
                                }
                            }];
}

- (void)shareWithShareView:(id)sender
{
    //1、构造分享内容
    //1.1、要分享的图片（以下分别是网络图片和本地图片的生成方式的示例）
    id<ISSCAttachment> remoteAttachment = [ShareSDKCoreService attachmentWithUrl:@"http://f.hiphotos.bdimg.com/album/w%3D2048/sign=df8f1fe50dd79123e0e09374990c5882/cf1b9d16fdfaaf51e6d1ce528d5494eef01f7a28.jpg"];
//    id<ISSCAttachment> localAttachment = [ShareSDKCoreService attachmentWithPath:[[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"]];
    
    //1.2、以下参数分别对应：内容、默认内容、图片、标题、链接、描述、分享类型
    id<ISSContent> publishContent = [ShareSDK content:@"Share your fabulous message with ShareSDK.@Mob移动开发者服务平台 @ShareSDK"
                                       defaultContent:nil
                                                image:remoteAttachment
                                                title:@"test title"
                                                  url:@"http://www.mob.com"
                                          description:nil
                                            mediaType:SSPublishContentMediaTypeNews];
    
    //1+创建弹出菜单容器（iPad应用必要，iPhone应用非必要）
    id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
    
    //2、展现分享编辑页面
    [ShareSDK showShareViewWithType:ShareTypeSinaWeibo
                          container:container
                            content:publishContent
                      statusBarTips:NO
                        authOptions:nil
                       shareOptions:nil
                             result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                 
                                 NSLog(@"=== response state :%zi ",state);
                                 
                                 //可以根据回调提示用户。
                                 if (state == SSResponseStateSuccess)
                                 {
                                     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                                     message:nil
                                                                                    delegate:self
                                                                           cancelButtonTitle:@"OK"
                                                                           otherButtonTitles:nil, nil];
                                     [alert show];
                                 }
                                 else if (state == SSResponseStateFail)
                                 {
                                     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                                                     message:[NSString stringWithFormat:@"Error Description：%@",[error errorDescription]]
                                                                                    delegate:self
                                                                           cancelButtonTitle:@"OK"
                                                                           otherButtonTitles:nil, nil];
                                     [alert show];
                                 }
                             }];
}

- (void)oneKeyShare:(id)sender
{
    //1、构造分享内容
    //1.1、要分享的图片（以下分别是网络图片和本地图片的生成方式的示例）
    id<ISSCAttachment> remoteAttachment = [ShareSDKCoreService attachmentWithUrl:@"http://f.hiphotos.bdimg.com/album/w%3D2048/sign=df8f1fe50dd79123e0e09374990c5882/cf1b9d16fdfaaf51e6d1ce528d5494eef01f7a28.jpg"];
//    id<ISSCAttachment> localAttachment = [ShareSDKCoreService attachmentWithPath:[[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"]];
    
    //1.2、以下参数分别对应：内容、默认内容、图片、标题、链接、描述、分享类型
    id<ISSContent> publishContent = [ShareSDK content:@"Share your fabulous message with ShareSDK.@Mob移动开发者服务平台 @ShareSDK"
                                       defaultContent:nil
                                                image:remoteAttachment
                                                title:@"test title"
                                                  url:@"http://www.mob.com"
                                          description:nil
                                            mediaType:SSPublishContentMediaTypeNews];
    
    //1+创建弹出菜单容器（iPad应用必要，iPhone应用非必要）
    id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
    
    //2、一键分享（例子：在給新浪微博、Twitter授权后可以同时分享到这2个平台）
    [ShareSDK oneKeyShareContent:publishContent
                       shareList:@[@(ShareTypeSinaWeibo),@(ShareTypeTwitter)]
                     authOptions:nil
                    shareOptions:nil
                   statusBarTips:NO
                          result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                              
                              NSLog(@"=== response state :%zi ",state);
                              
                              //可以根据回调提示用户。
                              if (state == SSResponseStateSuccess)
                              {
                                  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                                  message:nil
                                                                                 delegate:self
                                                                        cancelButtonTitle:@"OK"
                                                                        otherButtonTitles:nil, nil];
                                  [alert show];
                              }
                              else if (state == SSResponseStateFail)
                              {
                                  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                                                  message:[NSString stringWithFormat:@"Error Description：%@",[error errorDescription]]
                                                                                 delegate:self
                                                                        cancelButtonTitle:@"OK"
                                                                        otherButtonTitles:nil, nil];
                                  [alert show];
                              }
                          }];
}

- (void)clientShare:(id)sender
{
    //1、构造分享内容
    //1.1、要分享的图片（以下分别是网络图片和本地图片的生成方式的示例）
    id<ISSCAttachment> remoteAttachment = [ShareSDKCoreService attachmentWithUrl:@"http://f.hiphotos.bdimg.com/album/w%3D2048/sign=df8f1fe50dd79123e0e09374990c5882/cf1b9d16fdfaaf51e6d1ce528d5494eef01f7a28.jpg"];
//    id<ISSCAttachment> localAttachment = [ShareSDKCoreService attachmentWithPath:[[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"]];
    
    //1.2、以下参数分别对应：内容、默认内容、图片、标题、链接、描述、分享类型
    id<ISSContent> publishContent = [ShareSDK content:@"Share your fabulous message with ShareSDK.@Mob移动开发者服务平台 @ShareSDK"
                                       defaultContent:nil
                                                image:remoteAttachment
                                                title:@"test title"
                                                  url:@"http://www.mob.com"
                                          description:nil
                                            mediaType:SSPublishContentMediaTypeNews];
    
    //1+创建弹出菜单容器（iPad应用必要，iPhone应用非必要）
    id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
    
    //2、客户端分享
    [ShareSDK clientShareContent:publishContent
                            type:ShareTypeSinaWeibo
                     authOptions:nil
                    shareOptions:nil
                   statusBarTips:NO
                          result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                              
                              NSLog(@"=== response state :%zi ",state);
                              
                              //可以根据回调提示用户。
                              if (state == SSResponseStateSuccess)
                              {
                                  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                                  message:nil
                                                                                 delegate:self
                                                                        cancelButtonTitle:@"OK"
                                                                        otherButtonTitles:nil, nil];
                                  [alert show];
                              }
                              else if (state == SSResponseStateFail)
                              {
                                  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                                                  message:[NSString stringWithFormat:@"Error Description：%@",[error errorDescription]]
                                                                                 delegate:self
                                                                        cancelButtonTitle:@"OK"
                                                                        otherButtonTitles:nil, nil];
                                  [alert show];
                              }
                          }];
}

@end
