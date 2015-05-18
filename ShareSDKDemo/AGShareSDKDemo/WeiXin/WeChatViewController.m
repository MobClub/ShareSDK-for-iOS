//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "WeChatViewController.h"
#import <AGCommon/UINavigationBar+Common.h>
#import <AGCommon/UIImage+Common.h>
#import "ShareSDKDemoMoreViewController.h"
#import "IIViewDeckController.h"
#import <AGCommon/UIDevice+Common.h>
#import <ShareSDK/ShareSDK.h>
#import <AGCommon/NSString+Common.h>
#import "AGAppDelegate.h"

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

#define TIPSLABEL_TAG 10086

#define BUFFER_SIZE 1024 * 100

@implementation WeChatViewController

@synthesize delegate = _delegate;
@synthesize m_nsLastText;
@synthesize parentController = _parentController;

- (id)init
{
    if (self = [super init])
    {
        _appDelegate = (AGAppDelegate *)[UIApplication sharedApplication].delegate;
        
        UIButton *leftBtn = [[[UIButton alloc] init] autorelease];
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png" bundleName:BUNDLE_NAME]
                           forState:UIControlStateNormal];
        [leftBtn setImage:[UIImage imageNamed:@"LeftSideViewIcon.png"] forState:UIControlStateNormal];
        leftBtn.frame = CGRectMake(0.0, 0.0, 53.0, 30.0);
        [leftBtn addTarget:self action:@selector(leftButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:leftBtn] autorelease];
        
        if ([UIDevice currentDevice].isPad || [[UIDevice currentDevice].systemVersion versionStringCompare:@"7.0"] != NSOrderedAscending)
        {
            UILabel *label = [[UILabel alloc] init];
            label.backgroundColor = [UIColor clearColor];
            label.textColor = [UIColor whiteColor];
            label.shadowColor = [UIColor grayColor];
            label.font = [UIFont systemFontOfSize:22];
            self.navigationItem.titleView = label;
            [label release];
        }
    }
    
    return self;
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    ((UILabel *)self.navigationItem.titleView).text = title;
    [self.navigationItem.titleView sizeToFit];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self layoutView:self.interfaceOrientation];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

-(BOOL)shouldAutorotate
{
        //iOS6下旋屏方法
        return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
        //iOS6下旋屏方法
        return SSInterfaceOrientationMaskAll;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self layoutView:toInterfaceOrientation];
}

#pragma mark - View lifecycle

- (void)sendAppContent
{
        // 发送内容给微信
        Byte* pBuffer = (Byte *)malloc(BUFFER_SIZE);
    memset(pBuffer, 0, BUFFER_SIZE);
    NSData* data = [NSData dataWithBytes:pBuffer length:BUFFER_SIZE];
    free(pBuffer);
    
    id<ISSContent> content = [ShareSDK content:NSLocalizedString(@"TEXT_WECHAT_APP_CONTENT", @"你看不懂啊， 看不懂啊， 看不懂！")
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:[UIImage imageNamed:@"res2.jpg"] quality:1]
                                         title:NSLocalizedString(@"TEXT_WECHAT_APP_TITLE", @"这是App消息")
                                           url:@"http://www.qq.com"
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeApp];
    [content addWeixinSessionUnitWithType:INHERIT_VALUE
                                  content:INHERIT_VALUE
                                    title:INHERIT_VALUE
                                      url:INHERIT_VALUE
                                    image:INHERIT_VALUE
                             musicFileUrl:nil
                                  extInfo:@"<xml>test</xml>"
                                 fileData:data
                             emoticonData:nil];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:_appDelegate.viewDelegate];
    
        //在授权页面中添加关注官方微博
        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiSession
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                          otherButtonTitles:nil];
                                [alertView show];
                                [alertView release];
                            }
                        }
                    }];
}

-(void) onCancelText
{
    [self.parentController dismissModalViewControllerAnimated:YES];
}

-(void) onCompleteText:(NSString*)nsText type:(ShareType)type
{
    [self.parentController dismissModalViewControllerAnimated:YES];
    self.m_nsLastText = nsText;
    
    id<ISSContent> content = [ShareSDK content:nsText
                                defaultContent:nil
                                         image:nil
                                         title:nil
                                           url:nil
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeText];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:_appDelegate.viewDelegate];
    
        //在授权页面中添加关注官方微博
        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    [ShareSDK shareContent:content
                      type:type
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                          otherButtonTitles:nil];
                                [alertView show];
                                [alertView release];
                            }
                        }
                    }];
}

- (void)sendTextContent
{
    TextViewController* viewController = [[[TextViewController alloc] init] autorelease];
    viewController.m_delegate = self;
    viewController.m_nsLastText = m_nsLastText;
    viewController.type = ShareTypeWeixiSession;
    
    UINavigationController *navigatitonController = [[[UINavigationController alloc]initWithRootViewController:viewController] autorelease];
	[self.parentController presentModalViewController:navigatitonController animated:YES];
}

- (void)sendImageContent
{
        //发送内容给微信
        id<ISSContent> content = [ShareSDK content:nil
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:[UIImage imageNamed:@"res1thumb.png"] quality:1]
                                         title:nil
                                           url:nil
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeImage];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:_appDelegate.viewDelegate];
    
        //在授权页面中添加关注官方微博
        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiSession
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                          otherButtonTitles:nil];
                                [alertView show];
                                [alertView release];
                            }
                        }
                    }];
}
- (void)sendMusicContent
{
    id<ISSContent> content = [ShareSDK content:NSLocalizedString(@"TEXT_WECHAT_MUSIC_CONTENT", @"人群中哭着你只想变成透明的颜色 你再也不会梦或痛或心动了 你已经决定了你已经决定了 你静静忍着紧紧把昨天在拳心握着 而回忆越是甜就是越伤人 越是在手心留下密密麻麻深深浅浅的刀割 你不是真正的快乐 你的笑只是你穿的保护色 你决定不恨了也决定不爱了 把你的灵魂关在永远锁上的躯壳 这世界笑了于是你合群的一起笑了 当生存是规则不是你的选择 于是你含着眼泪飘飘荡荡跌跌撞撞地走着 你不是真正的快乐 你的笑只是你穿的保护色 你决定不恨了也决定不爱了 把你的灵魂关在永远锁上的躯壳 你不是真正的快乐 你的伤从不肯完全的愈合 我站在你左侧却像隔着银河 难道就真的抱着遗憾一直到老了 然后才后悔着 你不是真正的快乐 你的笑只是你穿的保护色 你决定不恨了也决定不爱了 把你的灵魂关在永远锁上的躯壳 你不是真正的快乐 你的伤从不肯完全的愈合 我站在你左侧却像隔着银河 难道就真的抱着遗憾一直到老了 你值得真正的快乐 你应该脱下你穿的保护色 为什么失去了还要被惩罚呢 能不能就让悲伤全部结束在此刻 重新开始活着")
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:[UIImage imageNamed:@"res3.jpg"] quality:1]
                                         title:NSLocalizedString(@"TEXT_WECHAT_MUSIC_TITLE", @"五月天<后青春期的诗>") 
                                           url:@"http://y.qq.com/i/song.html#p=7B22736F6E675F4E616D65223A22E4BDA0E4B88DE698AFE79C9FE6ADA3E79A84E5BFABE4B990222C22736F6E675F5761704C69766555524C223A22687474703A2F2F74736D7573696332342E74632E71712E636F6D2F586B303051563558484A645574315070536F4B7458796931667443755A68646C2F316F5A4465637734356375386355672B474B304964794E6A3770633447524A574C48795333383D2F3634363232332E6D34613F7569643D32333230303738313038266469723D423226663D312663743D3026636869643D222C22736F6E675F5769666955524C223A22687474703A2F2F73747265616D31382E71716D757369632E71712E636F6D2F33303634363232332E6D7033222C226E657454797065223A2277696669222C22736F6E675F416C62756D223A22E5889BE980A0EFBC9AE5B08FE5B7A8E89B8B444E414C495645EFBC81E6BC94E594B1E4BC9AE5889BE7BAAAE5BD95E99FB3222C22736F6E675F4944223A3634363232332C22736F6E675F54797065223A312C22736F6E675F53696E676572223A22E4BA94E69C88E5A4A9222C22736F6E675F576170446F776E4C6F616455524C223A22687474703A2F2F74736D757369633132382E74632E71712E636F6D2F586C464E4D31354C5569396961495674593739786D436534456B5275696879366A702F674B65356E4D6E684178494C73484D6C6A307849634A454B394568572F4E3978464B316368316F37636848323568413D3D2F33303634363232332E6D70333F7569643D32333230303738313038266469723D423226663D302663743D3026636869643D2673747265616D5F706F733D38227D"
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeMusic];
    [content addWeixinSessionUnitWithType:INHERIT_VALUE
                                  content:INHERIT_VALUE
                                    title:INHERIT_VALUE
                                      url:INHERIT_VALUE
                                    image:INHERIT_VALUE
                             musicFileUrl:@"http://mp3.mwap8.com/destdir/Music/2009/20090601/ZuiXuanMinZuFeng20090601119.mp3"
                                  extInfo:nil
                                 fileData:nil
                             emoticonData:nil];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:_appDelegate.viewDelegate];
    
        //在授权页面中添加关注官方微博
        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiSession
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                          otherButtonTitles:nil];
                                [alertView show];
                                [alertView release];
                            }
                        }
                    }];
}
- (void)sendVideoContent
{
    id<ISSContent> content = [ShareSDK content:NSLocalizedString(@"TEXT_WECHAT_VIDEO_CONTENT", @"只能说胡戈是中国广告界的一朵奇葩！！！这次真的很多人给跪了、、、")
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:[UIImage imageNamed:@"res2.jpg"] quality:1]
                                         title:NSLocalizedString(@"TEXT_WECHAT_VIDEO_TITLE", @"步步惊奇")
                                           url:@"http://www.tudou.com/programs/view/6vx5h884JHY/?fr=1"
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeVideo];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:_appDelegate.viewDelegate];
    
        //在授权页面中添加关注官方微博
        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiSession
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                          otherButtonTitles:nil];
                                [alertView show];
                                [alertView release];
                            }
                        }
                    }];
}
- (void)sendNewsContent
{
    id<ISSContent> content = [ShareSDK content:NSLocalizedString(@"TEXT_WECHAT_NEWS_CONTENT", @"3.15晚会播出当晚，麦当劳该店所在辖区的卫生、工商部门就连夜登门调查，并对腾讯财经等媒体公布初步结果；而尽管未接到闭店处罚通知，麦当劳中国总部还是在发布道歉声明后暂停了该店营业。\r\n不得不承认，麦当劳“销售过期食品”固然是事实，但这个“过期”仅仅是他们自己定义的过期，普通中国家庭也不会把刚炸出来30分钟的鸡翅拿去扔掉。麦当劳在食品卫生上的严格程度，不仅远远超出了一般国内企业，而且也超出了一般中国民众的心理预期和生活想象。大多数人以前并不知道，麦当劳厨房的食品架上还有计时器，辣鸡翅等大多数食品存放半个小时之后，按规定就应该扔掉。也正因如此，甚至有网友认为央视3.15晚会的曝光是给麦当劳做的软广告。\r\n央视视频中反映的情况，除了掉到地上的的食品未经任何处理继续加工显得很过分外，其它的问题都源于麦当劳自己制定的标准远远超出了国内一般快餐店的标准。比如北京市卫生监督所相关负责人介绍，麦当劳内部要求熟菜在70℃环境下保存2小时，是为了保存食品风味，属于企业内部卫生规范。目前的检查结果显示，麦当劳的保温盒温度在93℃，但在这种环境下保存的熟菜即便超过2小时，对公众也没有危害。也就是说麦当劳的一些保持时间标准是基于保持其食品的独特风味的要求，并非食品发生变质可能损害消费者身体健康的标准，麦当劳这家门店超时存放食品的行为，违反的是企业制定的内部标准，并不违反食品安全规定，政府应该依据法律法规来监管食品卫生，而不是按照食品公司自己制定的标准，从这个角度来看，麦当劳在食品卫生上没有责任（除了使用掉在地上的食物）。…[详细]\r\n但三里屯麦当劳的行为确实违背了诚信\r\n麦当劳的内部卫生规定虽然并未被作为卖点进行宣扬，但洋快餐在中国是便捷和卫生的代名词，却是不争的事实。谁也不是活雷锋，麦当劳制定的严苛内部标准，为的是树立自己的品牌优势，进而在市场定位上取得明显的价格优势，或者说让自己“贵得有理由”。但如果他的员工在执行上不能贯彻这一企业标准，相对于其价格水平而言，就有欺诈和损害消费者权益之嫌，这也是不言而喻的。从这个意义上来说，央视曝光麦当劳的问题并无不妥，麦当劳至少涉嫌消费欺诈，因为它没有向消费者提供它向人们承诺的标准的食品。也就是说，工商部门而非食品卫生监管部门约谈麦当劳，也并非师出无名。") 
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:[UIImage imageNamed:@"res2.jpg"] quality:1]
                                         title:NSLocalizedString(@"TEXT_WECHAT_NEWS_TITLE", @"麦当劳“销售过期食品”其实不是卫生问题") 
                                           url:@"http://view.news.qq.com/zt2012/mdl/index.htm"
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeNews];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:_appDelegate.viewDelegate];
    
        //在授权页面中添加关注官方微博
        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiSession
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
          
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                          otherButtonTitles:nil];
                                [alertView show];
                                [alertView release];
                            }
                        }
                    }];
}

- (void)sendNonGifContent
{
        //发送内容给微信
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res1" ofType:@"jpg"];
    
    id<ISSContent> content = [ShareSDK content:nil
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:[UIImage imageNamed:@"res1thumb.png"] quality:1]
                                         title:nil
                                           url:nil
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeNonGif];
    [content addWeixinSessionUnitWithType:INHERIT_VALUE
                                  content:INHERIT_VALUE
                                    title:INHERIT_VALUE
                                      url:INHERIT_VALUE
                                    image:INHERIT_VALUE
                             musicFileUrl:nil
                                  extInfo:nil
                                 fileData:nil
                             emoticonData:[NSData dataWithContentsOfFile:filePath]];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:_appDelegate.viewDelegate];
    
        //在授权页面中添加关注官方微博
        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiSession
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                          otherButtonTitles:nil];
                                [alertView show];
                                [alertView release];
                            }
                        }
                    }];
}

- (void)sendGifContent
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"];
    
    id<ISSContent> content = [ShareSDK content:nil
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:[UIImage imageNamed:@"res6thumb.png"] quality:1]
                                         title:nil
                                           url:nil
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeGif];
    [content addWeixinSessionUnitWithType:INHERIT_VALUE
                                  content:INHERIT_VALUE
                                    title:INHERIT_VALUE
                                      url:INHERIT_VALUE
                                    image:INHERIT_VALUE
                             musicFileUrl:nil
                                  extInfo:nil
                                 fileData:nil
                             emoticonData:[NSData dataWithContentsOfFile:filePath]];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:_appDelegate.viewDelegate];
    
        //在授权页面中添加关注官方微博
        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiSession
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
     
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                          otherButtonTitles:nil];
                                [alertView show];
                                [alertView release];
                            }
                        }
                    }];
    
}

- (void)sendTimelineAppContent
{
        // 发送内容给微信
        Byte* pBuffer = (Byte *)malloc(BUFFER_SIZE);
    memset(pBuffer, 0, BUFFER_SIZE);
    NSData* data = [NSData dataWithBytes:pBuffer length:BUFFER_SIZE];
    free(pBuffer);
    
    id<ISSContent> content = [ShareSDK content:NSLocalizedString(@"TEXT_WECHAT_APP_CONTENT", @"你看不懂啊， 看不懂啊， 看不懂！")
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:[UIImage imageNamed:@"res2.jpg"] quality:1]
                                         title:NSLocalizedString(@"TEXT_WECHAT_APP_TITLE", @"这是App消息") 
                                           url:@"http://www.qq.com"
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeApp];
    [content addWeixinTimelineUnitWithType:INHERIT_VALUE
                                  content:INHERIT_VALUE
                                    title:INHERIT_VALUE
                                      url:INHERIT_VALUE
                                    image:INHERIT_VALUE
                             musicFileUrl:nil
                                  extInfo:@"<xml>test</xml>"
                                 fileData:data
                             emoticonData:nil];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:_appDelegate.viewDelegate];
    
        //在授权页面中添加关注官方微博
        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiTimeline
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                          otherButtonTitles:nil];
                                [alertView show];
                                [alertView release];
                            }
                        }
                    }];
}

- (void)sendTimelineTextContent
{
    TextViewController* viewController = [[[TextViewController alloc] init] autorelease];
    viewController.m_delegate = self;
    viewController.m_nsLastText = m_nsLastText;
    viewController.type = ShareTypeWeixiTimeline;
    
    UINavigationController *navigatitonController = [[[UINavigationController alloc]initWithRootViewController:viewController] autorelease];
	[self.parentController presentModalViewController:navigatitonController animated:YES];
}

- (void)sendTimelineImageContent
{
        //发送内容给微信
        id<ISSContent> content = [ShareSDK content:nil
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:[UIImage imageNamed:@"res1thumb.png"] quality:1]
                                         title:nil
                                           url:nil
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeImage];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:_appDelegate.viewDelegate];
    
        //在授权页面中添加关注官方微博
        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiTimeline
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
          
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                          otherButtonTitles:nil];
                                [alertView show];
                                [alertView release];
                            }
                        }
                    }];
}

- (void)sendTimelineMusicContent
{
    id<ISSContent> content = [ShareSDK content:NSLocalizedString(@"TEXT_WECHAT_MUSIC_CONTENT", @"人群中哭着你只想变成透明的颜色 你再也不会梦或痛或心动了 你已经决定了你已经决定了 你静静忍着紧紧把昨天在拳心握着 而回忆越是甜就是越伤人 越是在手心留下密密麻麻深深浅浅的刀割 你不是真正的快乐 你的笑只是你穿的保护色 你决定不恨了也决定不爱了 把你的灵魂关在永远锁上的躯壳 这世界笑了于是你合群的一起笑了 当生存是规则不是你的选择 于是你含着眼泪飘飘荡荡跌跌撞撞地走着 你不是真正的快乐 你的笑只是你穿的保护色 你决定不恨了也决定不爱了 把你的灵魂关在永远锁上的躯壳 你不是真正的快乐 你的伤从不肯完全的愈合 我站在你左侧却像隔着银河 难道就真的抱着遗憾一直到老了 然后才后悔着 你不是真正的快乐 你的笑只是你穿的保护色 你决定不恨了也决定不爱了 把你的灵魂关在永远锁上的躯壳 你不是真正的快乐 你的伤从不肯完全的愈合 我站在你左侧却像隔着银河 难道就真的抱着遗憾一直到老了 你值得真正的快乐 你应该脱下你穿的保护色 为什么失去了还要被惩罚呢 能不能就让悲伤全部结束在此刻 重新开始活着")
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:[UIImage imageNamed:@"res3.jpg"] quality:1]
                                         title:NSLocalizedString(@"TEXT_WECHAT_MUSIC_TITLE", @"五月天<后青春期的诗>")
                                           url:@"http://y.qq.com/i/song.html#p=7B22736F6E675F4E616D65223A22E4BDA0E4B88DE698AFE79C9FE6ADA3E79A84E5BFABE4B990222C22736F6E675F5761704C69766555524C223A22687474703A2F2F74736D7573696332342E74632E71712E636F6D2F586B303051563558484A645574315070536F4B7458796931667443755A68646C2F316F5A4465637734356375386355672B474B304964794E6A3770633447524A574C48795333383D2F3634363232332E6D34613F7569643D32333230303738313038266469723D423226663D312663743D3026636869643D222C22736F6E675F5769666955524C223A22687474703A2F2F73747265616D31382E71716D757369632E71712E636F6D2F33303634363232332E6D7033222C226E657454797065223A2277696669222C22736F6E675F416C62756D223A22E5889BE980A0EFBC9AE5B08FE5B7A8E89B8B444E414C495645EFBC81E6BC94E594B1E4BC9AE5889BE7BAAAE5BD95E99FB3222C22736F6E675F4944223A3634363232332C22736F6E675F54797065223A312C22736F6E675F53696E676572223A22E4BA94E69C88E5A4A9222C22736F6E675F576170446F776E4C6F616455524C223A22687474703A2F2F74736D757369633132382E74632E71712E636F6D2F586C464E4D31354C5569396961495674593739786D436534456B5275696879366A702F674B65356E4D6E684178494C73484D6C6A307849634A454B394568572F4E3978464B316368316F37636848323568413D3D2F33303634363232332E6D70333F7569643D32333230303738313038266469723D423226663D302663743D3026636869643D2673747265616D5F706F733D38227D"
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeMusic];
    [content addWeixinTimelineUnitWithType:INHERIT_VALUE
                                  content:INHERIT_VALUE
                                    title:INHERIT_VALUE
                                      url:INHERIT_VALUE
                                    image:INHERIT_VALUE
                             musicFileUrl:@"http://mp3.mwap8.com/destdir/Music/2009/20090601/ZuiXuanMinZuFeng20090601119.mp3"
                                  extInfo:nil
                                 fileData:nil
                             emoticonData:nil];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:_appDelegate.viewDelegate];
    
        //在授权页面中添加关注官方微博
        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiTimeline
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                          otherButtonTitles:nil];
                                [alertView show];
                                [alertView release];
                            }
                        }
                    }];
}

- (void)sendTimelineVideoContent
{
    id<ISSContent> content = [ShareSDK content:NSLocalizedString(@"TEXT_WECHAT_VIDEO_CONTENT", @"只能说胡戈是中国广告界的一朵奇葩！！！这次真的很多人给跪了、、、")
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:[UIImage imageNamed:@"res2.jpg"] quality:1]
                                         title:NSLocalizedString(@"TEXT_WECHAT_VIDEO_TITLE", @"步步惊奇")
                                           url:@"http://www.tudou.com/programs/view/6vx5h884JHY/?fr=1"
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeVideo];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:_appDelegate.viewDelegate];
    
        //在授权页面中添加关注官方微博
        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiTimeline
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                          otherButtonTitles:nil];
                                [alertView show];
                                [alertView release];
                            }
                        }
                    }];
}

- (void)sendTimelineNewsContent
{
    id<ISSContent> content = [ShareSDK content:NSLocalizedString(@"TEXT_WECHAT_NEWS_CONTENT", @"3.15晚会播出当晚，麦当劳该店所在辖区的卫生、工商部门就连夜登门调查，并对腾讯财经等媒体公布初步结果；而尽管未接到闭店处罚通知，麦当劳中国总部还是在发布道歉声明后暂停了该店营业。\r\n不得不承认，麦当劳“销售过期食品”固然是事实，但这个“过期”仅仅是他们自己定义的过期，普通中国家庭也不会把刚炸出来30分钟的鸡翅拿去扔掉。麦当劳在食品卫生上的严格程度，不仅远远超出了一般国内企业，而且也超出了一般中国民众的心理预期和生活想象。大多数人以前并不知道，麦当劳厨房的食品架上还有计时器，辣鸡翅等大多数食品存放半个小时之后，按规定就应该扔掉。也正因如此，甚至有网友认为央视3.15晚会的曝光是给麦当劳做的软广告。\r\n央视视频中反映的情况，除了掉到地上的的食品未经任何处理继续加工显得很过分外，其它的问题都源于麦当劳自己制定的标准远远超出了国内一般快餐店的标准。比如北京市卫生监督所相关负责人介绍，麦当劳内部要求熟菜在70℃环境下保存2小时，是为了保存食品风味，属于企业内部卫生规范。目前的检查结果显示，麦当劳的保温盒温度在93℃，但在这种环境下保存的熟菜即便超过2小时，对公众也没有危害。也就是说麦当劳的一些保持时间标准是基于保持其食品的独特风味的要求，并非食品发生变质可能损害消费者身体健康的标准，麦当劳这家门店超时存放食品的行为，违反的是企业制定的内部标准，并不违反食品安全规定，政府应该依据法律法规来监管食品卫生，而不是按照食品公司自己制定的标准，从这个角度来看，麦当劳在食品卫生上没有责任（除了使用掉在地上的食物）。…[详细]\r\n但三里屯麦当劳的行为确实违背了诚信\r\n麦当劳的内部卫生规定虽然并未被作为卖点进行宣扬，但洋快餐在中国是便捷和卫生的代名词，却是不争的事实。谁也不是活雷锋，麦当劳制定的严苛内部标准，为的是树立自己的品牌优势，进而在市场定位上取得明显的价格优势，或者说让自己“贵得有理由”。但如果他的员工在执行上不能贯彻这一企业标准，相对于其价格水平而言，就有欺诈和损害消费者权益之嫌，这也是不言而喻的。从这个意义上来说，央视曝光麦当劳的问题并无不妥，麦当劳至少涉嫌消费欺诈，因为它没有向消费者提供它向人们承诺的标准的食品。也就是说，工商部门而非食品卫生监管部门约谈麦当劳，也并非师出无名。")
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:[UIImage imageNamed:@"res2.jpg"] quality:1]
                                         title:NSLocalizedString(@"TEXT_WECHAT_NEWS_TITLE", @"麦当劳“销售过期食品”其实不是卫生问题")
                                           url:@"http://view.news.qq.com/zt2012/mdl/index.htm"
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeNews];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:_appDelegate.viewDelegate];
    
        //在授权页面中添加关注官方微博
        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiTimeline
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                          otherButtonTitles:nil];
                                [alertView show];
                                [alertView release];
                            }
                        }
                    }];
}

- (void)sendTimelineNonGifContent
{
        //发送内容给微信
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res1" ofType:@"jpg"];
    
    id<ISSContent> content = [ShareSDK content:nil
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:[UIImage imageNamed:@"res1thumb.png"] quality:1]
                                         title:nil
                                           url:nil
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeNonGif];
    [content addWeixinTimelineUnitWithType:INHERIT_VALUE
                                  content:INHERIT_VALUE
                                    title:INHERIT_VALUE
                                      url:INHERIT_VALUE
                                    image:INHERIT_VALUE
                             musicFileUrl:nil
                                  extInfo:nil
                                 fileData:nil
                             emoticonData:[NSData dataWithContentsOfFile:filePath]];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:_appDelegate.viewDelegate];
    
        //在授权页面中添加关注官方微博
        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiTimeline
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
       
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                          otherButtonTitles:nil];
                                [alertView show];
                                [alertView release];
                            }
                        }
                    }];
}

- (void)sendTimelineGifContent
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"];

    id<ISSContent> content = [ShareSDK content:nil
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:[UIImage imageNamed:@"res6thumb.png"] quality:1]
                                         title:nil
                                           url:nil
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeGif];
    [content addWeixinTimelineUnitWithType:INHERIT_VALUE
                                   content:INHERIT_VALUE
                                     title:INHERIT_VALUE
                                       url:INHERIT_VALUE
                                     image:INHERIT_VALUE
                              musicFileUrl:nil
                                   extInfo:nil
                                  fileData:nil
                              emoticonData:[NSData dataWithContentsOfFile:filePath]];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:_appDelegate.viewDelegate];
    
        //在授权页面中添加关注官方微博
        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiTimeline
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                          otherButtonTitles:nil];
                                [alertView show];
                                [alertView release];
                            }
                        }
                    }];
}

#pragma mark 收藏

- (void)sendFavAppContent
{
        // 发送内容给微信
        Byte* pBuffer = (Byte *)malloc(BUFFER_SIZE);
    memset(pBuffer, 0, BUFFER_SIZE);
    NSData* data = [NSData dataWithBytes:pBuffer length:BUFFER_SIZE];
    free(pBuffer);
    
    id<ISSContent> content = [ShareSDK content:NSLocalizedString(@"TEXT_WECHAT_APP_CONTENT", @"你看不懂啊， 看不懂啊， 看不懂！")
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:[UIImage imageNamed:@"res2.jpg"] quality:1]
                                         title:NSLocalizedString(@"TEXT_WECHAT_APP_TITLE", @"这是App消息")
                                           url:@"http://www.qq.com"
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeApp];
    [content addWeixinTimelineUnitWithType:INHERIT_VALUE
                                   content:INHERIT_VALUE
                                     title:INHERIT_VALUE
                                       url:INHERIT_VALUE
                                     image:INHERIT_VALUE
                              musicFileUrl:nil
                                   extInfo:@"<xml>test</xml>"
                                  fileData:data
                              emoticonData:nil];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:_appDelegate.viewDelegate];
    
        //在授权页面中添加关注官方微博
        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiFav
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                          otherButtonTitles:nil];
                                [alertView show];
                                [alertView release];
                            }
                        }
                    }];
}

- (void)sendFavTextContent
{
    TextViewController* viewController = [[[TextViewController alloc] init] autorelease];
    viewController.m_delegate = self;
    viewController.m_nsLastText = m_nsLastText;
    viewController.type = ShareTypeWeixiFav;
    
    UINavigationController *navigatitonController = [[[UINavigationController alloc]initWithRootViewController:viewController] autorelease];
	[self.parentController presentModalViewController:navigatitonController animated:YES];
}

- (void)sendFavImageContent
{
        //发送内容给微信
        id<ISSContent> content = [ShareSDK content:nil
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:[UIImage imageNamed:@"res1thumb.png"] quality:1]
                                         title:nil
                                           url:nil
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeImage];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:_appDelegate.viewDelegate];
    
        //在授权页面中添加关注官方微博
        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiFav
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                          otherButtonTitles:nil];
                                [alertView show];
                                [alertView release];
                            }
                        }
                    }];
}

- (void)sendFavMusicContent
{
    id<ISSContent> content = [ShareSDK content:NSLocalizedString(@"TEXT_WECHAT_MUSIC_CONTENT", @"人群中哭着你只想变成透明的颜色 你再也不会梦或痛或心动了 你已经决定了你已经决定了 你静静忍着紧紧把昨天在拳心握着 而回忆越是甜就是越伤人 越是在手心留下密密麻麻深深浅浅的刀割 你不是真正的快乐 你的笑只是你穿的保护色 你决定不恨了也决定不爱了 把你的灵魂关在永远锁上的躯壳 这世界笑了于是你合群的一起笑了 当生存是规则不是你的选择 于是你含着眼泪飘飘荡荡跌跌撞撞地走着 你不是真正的快乐 你的笑只是你穿的保护色 你决定不恨了也决定不爱了 把你的灵魂关在永远锁上的躯壳 你不是真正的快乐 你的伤从不肯完全的愈合 我站在你左侧却像隔着银河 难道就真的抱着遗憾一直到老了 然后才后悔着 你不是真正的快乐 你的笑只是你穿的保护色 你决定不恨了也决定不爱了 把你的灵魂关在永远锁上的躯壳 你不是真正的快乐 你的伤从不肯完全的愈合 我站在你左侧却像隔着银河 难道就真的抱着遗憾一直到老了 你值得真正的快乐 你应该脱下你穿的保护色 为什么失去了还要被惩罚呢 能不能就让悲伤全部结束在此刻 重新开始活着")
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:[UIImage imageNamed:@"res3.jpg"] quality:1]
                                         title:NSLocalizedString(@"TEXT_WECHAT_MUSIC_TITLE", @"五月天<后青春期的诗>")
                                           url:@"http://y.qq.com/i/song.html#p=7B22736F6E675F4E616D65223A22E4BDA0E4B88DE698AFE79C9FE6ADA3E79A84E5BFABE4B990222C22736F6E675F5761704C69766555524C223A22687474703A2F2F74736D7573696332342E74632E71712E636F6D2F586B303051563558484A645574315070536F4B7458796931667443755A68646C2F316F5A4465637734356375386355672B474B304964794E6A3770633447524A574C48795333383D2F3634363232332E6D34613F7569643D32333230303738313038266469723D423226663D312663743D3026636869643D222C22736F6E675F5769666955524C223A22687474703A2F2F73747265616D31382E71716D757369632E71712E636F6D2F33303634363232332E6D7033222C226E657454797065223A2277696669222C22736F6E675F416C62756D223A22E5889BE980A0EFBC9AE5B08FE5B7A8E89B8B444E414C495645EFBC81E6BC94E594B1E4BC9AE5889BE7BAAAE5BD95E99FB3222C22736F6E675F4944223A3634363232332C22736F6E675F54797065223A312C22736F6E675F53696E676572223A22E4BA94E69C88E5A4A9222C22736F6E675F576170446F776E4C6F616455524C223A22687474703A2F2F74736D757369633132382E74632E71712E636F6D2F586C464E4D31354C5569396961495674593739786D436534456B5275696879366A702F674B65356E4D6E684178494C73484D6C6A307849634A454B394568572F4E3978464B316368316F37636848323568413D3D2F33303634363232332E6D70333F7569643D32333230303738313038266469723D423226663D302663743D3026636869643D2673747265616D5F706F733D38227D"
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeMusic];
    [content addWeixinTimelineUnitWithType:INHERIT_VALUE
                                   content:INHERIT_VALUE
                                     title:INHERIT_VALUE
                                       url:INHERIT_VALUE
                                     image:INHERIT_VALUE
                              musicFileUrl:@"http://mp3.mwap8.com/destdir/Music/2009/20090601/ZuiXuanMinZuFeng20090601119.mp3"
                                   extInfo:nil
                                  fileData:nil
                              emoticonData:nil];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:_appDelegate.viewDelegate];
    
        //在授权页面中添加关注官方微博
        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiFav
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                          otherButtonTitles:nil];
                                [alertView show];
                                [alertView release];
                            }
                        }
                    }];
}

- (void)sendFavVideoContent
{
    id<ISSContent> content = [ShareSDK content:NSLocalizedString(@"TEXT_WECHAT_VIDEO_CONTENT", @"只能说胡戈是中国广告界的一朵奇葩！！！这次真的很多人给跪了、、、")
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:[UIImage imageNamed:@"res2.jpg"] quality:1]
                                         title:NSLocalizedString(@"TEXT_WECHAT_VIDEO_TITLE", @"步步惊奇")
                                           url:@"http://www.tudou.com/programs/view/6vx5h884JHY/?fr=1"
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeVideo];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:_appDelegate.viewDelegate];
    
        //在授权页面中添加关注官方微博
        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiFav
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                          otherButtonTitles:nil];
                                [alertView show];
                                [alertView release];
                            }
                        }
                    }];
}

- (void)sendFavNewsContent
{
    id<ISSContent> content = [ShareSDK content:NSLocalizedString(@"TEXT_WECHAT_NEWS_CONTENT", @"3.15晚会播出当晚，麦当劳该店所在辖区的卫生、工商部门就连夜登门调查，并对腾讯财经等媒体公布初步结果；而尽管未接到闭店处罚通知，麦当劳中国总部还是在发布道歉声明后暂停了该店营业。\r\n不得不承认，麦当劳“销售过期食品”固然是事实，但这个“过期”仅仅是他们自己定义的过期，普通中国家庭也不会把刚炸出来30分钟的鸡翅拿去扔掉。麦当劳在食品卫生上的严格程度，不仅远远超出了一般国内企业，而且也超出了一般中国民众的心理预期和生活想象。大多数人以前并不知道，麦当劳厨房的食品架上还有计时器，辣鸡翅等大多数食品存放半个小时之后，按规定就应该扔掉。也正因如此，甚至有网友认为央视3.15晚会的曝光是给麦当劳做的软广告。\r\n央视视频中反映的情况，除了掉到地上的的食品未经任何处理继续加工显得很过分外，其它的问题都源于麦当劳自己制定的标准远远超出了国内一般快餐店的标准。比如北京市卫生监督所相关负责人介绍，麦当劳内部要求熟菜在70℃环境下保存2小时，是为了保存食品风味，属于企业内部卫生规范。目前的检查结果显示，麦当劳的保温盒温度在93℃，但在这种环境下保存的熟菜即便超过2小时，对公众也没有危害。也就是说麦当劳的一些保持时间标准是基于保持其食品的独特风味的要求，并非食品发生变质可能损害消费者身体健康的标准，麦当劳这家门店超时存放食品的行为，违反的是企业制定的内部标准，并不违反食品安全规定，政府应该依据法律法规来监管食品卫生，而不是按照食品公司自己制定的标准，从这个角度来看，麦当劳在食品卫生上没有责任（除了使用掉在地上的食物）。…[详细]\r\n但三里屯麦当劳的行为确实违背了诚信\r\n麦当劳的内部卫生规定虽然并未被作为卖点进行宣扬，但洋快餐在中国是便捷和卫生的代名词，却是不争的事实。谁也不是活雷锋，麦当劳制定的严苛内部标准，为的是树立自己的品牌优势，进而在市场定位上取得明显的价格优势，或者说让自己“贵得有理由”。但如果他的员工在执行上不能贯彻这一企业标准，相对于其价格水平而言，就有欺诈和损害消费者权益之嫌，这也是不言而喻的。从这个意义上来说，央视曝光麦当劳的问题并无不妥，麦当劳至少涉嫌消费欺诈，因为它没有向消费者提供它向人们承诺的标准的食品。也就是说，工商部门而非食品卫生监管部门约谈麦当劳，也并非师出无名。")
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:[UIImage imageNamed:@"res2.jpg"] quality:1]
                                         title:NSLocalizedString(@"TEXT_WECHAT_NEWS_TITLE", @"麦当劳“销售过期食品”其实不是卫生问题")
                                           url:@"http://view.news.qq.com/zt2012/mdl/index.htm"
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeNews];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:_appDelegate.viewDelegate];
    
        //在授权页面中添加关注官方微博
        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiFav
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                          otherButtonTitles:nil];
                                [alertView show];
                                [alertView release];
                            }
                        }
                    }];
}

- (void)sendFavNonGifContent
{
        //发送内容给微信
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res1" ofType:@"jpg"];
    
    id<ISSContent> content = [ShareSDK content:nil
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:[UIImage imageNamed:@"res1thumb.png"] quality:1]
                                         title:nil
                                           url:nil
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeNonGif];
    [content addWeixinTimelineUnitWithType:INHERIT_VALUE
                                   content:INHERIT_VALUE
                                     title:INHERIT_VALUE
                                       url:INHERIT_VALUE
                                     image:INHERIT_VALUE
                              musicFileUrl:nil
                                   extInfo:nil
                                  fileData:nil
                              emoticonData:[NSData dataWithContentsOfFile:filePath]];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:_appDelegate.viewDelegate];
    
        //在授权页面中添加关注官方微博
        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiFav
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                          otherButtonTitles:nil];
                                [alertView show];
                                [alertView release];
                            }
                        }
                    }];
}

- (void)sendFavGifContent
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"];
    
    id<ISSContent> content = [ShareSDK content:nil
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:[UIImage imageNamed:@"res6thumb.png"] quality:1]
                                         title:nil
                                           url:nil
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeGif];
    [content addWeixinTimelineUnitWithType:INHERIT_VALUE
                                   content:INHERIT_VALUE
                                     title:INHERIT_VALUE
                                       url:INHERIT_VALUE
                                     image:INHERIT_VALUE
                              musicFileUrl:nil
                                   extInfo:nil
                                  fileData:nil
                              emoticonData:[NSData dataWithContentsOfFile:filePath]];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:_appDelegate.viewDelegate];
    
        //在授权页面中添加关注官方微博
        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiFav
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                          otherButtonTitles:nil];
                                [alertView show];
                                [alertView release];
                            }
                        }
                    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"TEXT_WECHAT", @"微信");
    
    if ([[UIDevice currentDevice].systemVersion versionStringCompare:@"7.0"] != NSOrderedAscending)
    {
        [self setExtendedLayoutIncludesOpaqueBars:NO];
        [self setEdgesForExtendedLayout:SSRectEdgeBottom | SSRectEdgeLeft | SSRectEdgeRight];
    }
    
    UIScrollView *footView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,
                                                                            0,
                                                                            self.view.width,
                                                                            self.view.height)];
    footView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [footView setBackgroundColor:RGBCOLOR(0xef, 0xef, 0xef)];
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 135)];
    headView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [headView setBackgroundColor:RGBCOLOR(0xe1, 0xe0, 0xde)];
    UIImage *image = [UIImage imageNamed:@"micro_messenger.png"];
    NSInteger tlx = (headView.frame.size.width -  image.size.width) / 2;
    NSInteger tly = 20;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(tlx, tly, image.size.width, image.size.height)];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [imageView setImage:image];
    [headView addSubview:imageView];
    [imageView release];
    
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, tly + image.size.height, self.view.width, 40)];
    title.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [title setText:NSLocalizedString(@"TEXT_WECHAT_DEMO", @"微信OpenAPI Sample Demo")];
    title.font = [UIFont systemFontOfSize:17];
    title.textColor = RGBCOLOR(0x11, 0x11, 0x11);
    title.textAlignment = UITextAlignmentCenter;
    title.backgroundColor = [UIColor clearColor];
    [headView addSubview:title];
    [title release];
    
    [footView addSubview:headView];
    [headView release];
    
    UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(0, headView.frame.size.height, self.view.width, 1)] ;
    lineView1.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    lineView1.backgroundColor = [UIColor blackColor] ;
    lineView1.alpha = 0.1f ;
    [footView addSubview:lineView1];
    [lineView1 release];
    
    UIView *lineView2 = [[UIView alloc]initWithFrame:CGRectMake(0, headView.frame.size.height + 1, self.view.width, 1)];
    lineView2.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    lineView2.backgroundColor = [UIColor whiteColor];
    lineView2.alpha = 0.25f;
    [footView addSubview:lineView2];
    [lineView2 release];
    
    CGFloat top = headView.height + 2;
    CGFloat w = (self.view.width - 30) / 2;
    
    UILabel *tips = [[UILabel alloc]init];
    tips.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    tips.tag = TIPSLABEL_TAG;
    tips.text = NSLocalizedString(@"TEXT_SHARE_TO_FRIEND", @"分享好友");
    tips.textColor = [UIColor blackColor];
    tips.backgroundColor = [UIColor clearColor];
    tips.textAlignment = UITextAlignmentLeft;
    tips.frame = CGRectMake(10, top, 200, 40);
    [footView addSubview:tips];
    [tips release];
    
    top += 55.0;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_TEXT", @"发送文本消息给微信") forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14]; 
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(10, top, w, 40)];
    [btn addTarget:self action:@selector(sendTextContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn2 setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_PHOTO", @"发送Photo消息给微信") forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:14]; 
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 setFrame:CGRectMake(btn.right + 10, top, w, 40)];
    [btn2 addTarget:self action:@selector(sendImageContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn2];
    
    top += 55.0;
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn3.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn3 setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_MUSIC", @"发送Music消息给微信") forState:UIControlStateNormal];
    btn3.titleLabel.font = [UIFont systemFontOfSize:14]; 
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 setFrame:CGRectMake(10, top, w, 40)];
    [btn3 addTarget:self action:@selector(sendMusicContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn4.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn4 setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_NEWS", @"发送News消息给微信") forState:UIControlStateNormal];
    btn4.titleLabel.font = [UIFont systemFontOfSize:14]; 
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn4 setFrame:CGRectMake(btn3.right + 10, top, w, 40)];
    [btn4 addTarget:self action:@selector(sendNewsContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn4];
    
    top += 55.0;
    
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn5.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn5 setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_VIDEO", @"发送Video消息给微信") forState:UIControlStateNormal];
    btn5.titleLabel.font = [UIFont systemFontOfSize:14]; 
    [btn5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn5 setFrame:CGRectMake(10, top, w, 40)];
    [btn5 addTarget:self action:@selector(sendVideoContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn5];
    
    UIButton *btn6 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn6.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn6 setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_APP", @"发送App消息给微信") forState:UIControlStateNormal];
    btn6.titleLabel.font = [UIFont systemFontOfSize:14]; 
    [btn6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn6 setFrame:CGRectMake(btn5.right + 10, top, w, 40)];
    [btn6 addTarget:self action:@selector(sendAppContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn6];
    
    top += 55.0;
    
    UIButton *btn7 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn7.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn7 setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_NON_GIF", @"发送非gif消息给微信") forState:UIControlStateNormal];
    btn7.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn7 setFrame:CGRectMake(10, top, w, 40)];
    [btn7 addTarget:self action:@selector(sendNonGifContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn7];
    
    UIButton *btn10 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn10.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn10 setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_GIF", @"发送gif消息给微信") forState:UIControlStateNormal];
    btn10.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn10 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn10 setFrame:CGRectMake(btn7.right + 10, top, w, 40)];
    [btn10 addTarget:self action:@selector(sendGifContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn10];
    
    top += 55.0;
    
    UILabel *tips2 = [[UILabel alloc]init];
    tips2.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    tips2.tag = TIPSLABEL_TAG;
    tips2.text = NSLocalizedString(@"TEXT_SHARE_TO_TIMELINE", @"分享朋友圈");
    tips2.textColor = [UIColor blackColor];
    tips2.backgroundColor = [UIColor clearColor];
    tips2.textAlignment = UITextAlignmentLeft;
    tips2.frame = CGRectMake(10, top, 200, 40);
    [footView addSubview:tips2];
    [tips2 release];
    
    top += 55.0;
    
    UIButton *btn21 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn21.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn21 setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_TEXT", @"发送文本消息给微信") forState:UIControlStateNormal];
    btn21.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn21 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn21 setFrame:CGRectMake(10, top, w, 40)];
    [btn21 addTarget:self action:@selector(sendTimelineTextContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn21];
    
    UIButton *btn22 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn22.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn22 setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_PHOTO", @"发送Photo消息给微信") forState:UIControlStateNormal];
    btn22.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn22 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn22 setFrame:CGRectMake(btn21.right + 10, top, w, 40)];
    [btn22 addTarget:self action:@selector(sendTimelineImageContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn22];
    
    top += 55.0;
    
    UIButton *btn23 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn23.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn23 setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_MUSIC", @"发送Music消息给微信") forState:UIControlStateNormal];
    btn23.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn23 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn23 setFrame:CGRectMake(10, top, w, 40)];
    [btn23 addTarget:self action:@selector(sendTimelineMusicContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn23];
    
    UIButton *btn24 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn24.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn24 setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_NEWS", @"发送News消息给微信") forState:UIControlStateNormal];
    btn24.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn24 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn24 setFrame:CGRectMake(btn23.right + 10, top, w, 40)];
    [btn24 addTarget:self action:@selector(sendTimelineNewsContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn24];
    
    top += 55.0;
    
    UIButton *btn25 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn25.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn25 setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_VIDEO", @"发送Video消息给微信") forState:UIControlStateNormal];
    btn25.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn25 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn25 setFrame:CGRectMake(10, top, w, 40)];
    [btn25 addTarget:self action:@selector(sendTimelineVideoContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn25];
    
    UIButton *btn26 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn26.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn26 setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_APP", @"发送App消息给微信") forState:UIControlStateNormal];
    btn26.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn26 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn26 setFrame:CGRectMake(btn25.right + 10, top, w, 40)];
    [btn26 addTarget:self action:@selector(sendTimelineAppContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn26];
    
    top += 55.0;
    
    UIButton *btn27 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn27.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn27 setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_NON_GIF", @"发送非gif消息给微信") forState:UIControlStateNormal];
    btn27.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn27 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn27 setFrame:CGRectMake(10, top, w, 40)];
    [btn27 addTarget:self action:@selector(sendTimelineNonGifContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn27];
    
    UIButton *btn20 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn20.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn20 setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_GIF", @"发送gif消息给微信") forState:UIControlStateNormal];
    btn20.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn20 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn20 setFrame:CGRectMake(btn27.right + 10, top, w, 40)];
    [btn20 addTarget:self action:@selector(sendTimelineGifContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn20];
    
    top += 55.0;
    
    UILabel *tips3 = [[UILabel alloc]init];
    tips3.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    tips3.tag = TIPSLABEL_TAG;
    tips3.text = NSLocalizedString(@"TEXT_FAV", @"收藏");
    tips3.textColor = [UIColor blackColor];
    tips3.backgroundColor = [UIColor clearColor];
    tips3.textAlignment = UITextAlignmentLeft;
    tips3.frame = CGRectMake(10, top, 200, 40);
    [footView addSubview:tips3];
    [tips3 release];
    
    top += 55.0;
    
    UIButton *btn28 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn28.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn28 setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_TEXT", @"发送文本消息给微信") forState:UIControlStateNormal];
    btn28.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn28 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn28 setFrame:CGRectMake(10, top, w, 40)];
    [btn28 addTarget:self action:@selector(sendFavTextContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn28];
    
    UIButton *btn29 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn29.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn29 setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_PHOTO", @"发送Photo消息给微信") forState:UIControlStateNormal];
    btn29.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn29 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn29 setFrame:CGRectMake(btn28.right + 10, top, w, 40)];
    [btn29 addTarget:self action:@selector(sendFavImageContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn29];
    
    top += 55.0;
    
    UIButton *btn30 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn30.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn30 setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_MUSIC", @"发送Music消息给微信") forState:UIControlStateNormal];
    btn30.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn30 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn30 setFrame:CGRectMake(10, top, w, 40)];
    [btn30 addTarget:self action:@selector(sendFavMusicContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn30];
    
    UIButton *btn31 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn31.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn31 setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_NEWS", @"发送News消息给微信") forState:UIControlStateNormal];
    btn31.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn31 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn31 setFrame:CGRectMake(btn30.right + 10, top, w, 40)];
    [btn31 addTarget:self action:@selector(sendFavNewsContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn31];
    
    top += 55.0;
    
    UIButton *btn32 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn32.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn32 setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_VIDEO", @"发送Video消息给微信") forState:UIControlStateNormal];
    btn32.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn32 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn32 setFrame:CGRectMake(10, top, w, 40)];
    [btn32 addTarget:self action:@selector(sendFavVideoContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn32];
    
    UIButton *btn33 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn33.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn33 setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_APP", @"发送App消息给微信") forState:UIControlStateNormal];
    btn33.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn33 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn33 setFrame:CGRectMake(btn32.right + 10, top, w, 40)];
    [btn33 addTarget:self action:@selector(sendFavAppContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn33];
    
    top += 55.0;
    
    UIButton *btn34 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn34.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn34 setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_NON_GIF", @"发送非gif消息给微信") forState:UIControlStateNormal];
    btn34.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn34 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn34 setFrame:CGRectMake(10, top, w, 40)];
    [btn34 addTarget:self action:@selector(sendFavNonGifContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn34];
    
    UIButton *btn35 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn35.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [btn35 setTitle:NSLocalizedString(@"TEXT_WECHAT_SEND_GIF", @"发送gif消息给微信") forState:UIControlStateNormal];
    btn35.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn35 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn35 setFrame:CGRectMake(btn34.right + 10, top, w, 40)];
    [btn35 addTarget:self action:@selector(sendFavGifContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn35];

    [self.view addSubview:footView];
    footView.contentSize = CGSizeMake(self.view.width, btn35.bottom + 15);
    [footView release];
    
    self.m_nsLastText = NSLocalizedString(@"TEXT_LAST_TEXT", @"完善的跨终端即时通讯能力，使得Mac可以与PC、手机、Pad等终端的QQ进行无缝沟通，让您的交流更畅快。 完善的跨终端即时通讯能力，使得Mac可以与PC、手机、Pad等终端的QQ进行无缝沟通，让您的交流更畅快。 ");
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.m_nsLastText = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (void)dealloc
{
    [m_nsLastText release];
    
    [super dealloc];
}

- (void)leftButtonClickHandler:(id)sender
{
    [self.viewDeckController toggleLeftViewAnimated:YES];
}


- (void)moreButtonClickHanlder:(id)sender
{
    UIViewController *moreVC = [[[ShareSDKDemoMoreViewController alloc] init] autorelease];
    moreVC.title = NSLocalizedString(@"TEXT_MORE", @"更多");
    UINavigationController *navMoreVC = [[[UINavigationController alloc] initWithRootViewController:moreVC] autorelease];
    [self.parentController presentModalViewController:navMoreVC animated:YES];
}

#pragma mark - Private

- (void)layoutPortrait
{
    UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
    btn.frame = CGRectMake(btn.left, btn.top, 55.0, 32.0);
    [btn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png"
                                     bundleName:BUNDLE_NAME]
                   forState:UIControlStateNormal];
    
    if ([UIDevice currentDevice].isPad)
    {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPadNavigationBarBG.png"]];
    }
    else
    {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneNavigationBarBG.png"]];
    }
}

- (void)layoutLandscape
{
    if (![UIDevice currentDevice].isPad)
    {
        //iPhone
        UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
        btn.frame = CGRectMake(btn.left, btn.top, 48.0, 24.0);
        [btn setBackgroundImage:[UIImage imageNamed:@"Common_Landscape/NavigationButtonBG.png"
                                         bundleName:BUNDLE_NAME]
                       forState:UIControlStateNormal];
        
        if ([[UIDevice currentDevice] isPhone5])
        {
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneLandscapeNavigationBarBG-568h.png"]];
        }
        else
        {
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneLandscapeNavigationBarBG.png"]];
        }
    }
    else
    {
        UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
        btn.frame = CGRectMake(btn.left, btn.top, 55.0, 32.0);
        [btn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png"
                                         bundleName:BUNDLE_NAME]
                       forState:UIControlStateNormal];
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPadLandscapeNavigationBarBG.png"]];
    }
}

- (void)layoutView:(UIInterfaceOrientation)orientation
{
    if (UIInterfaceOrientationIsLandscape(orientation))
    {
        [self layoutLandscape];
    }
    else
    {
        [self layoutPortrait];
    }
}

@end
