//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:1955211608
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import "AGAppDelegate.h"
#import "AGViewController.h"
#import "AGAuthViewController.h"
#import "AGApiViewController.h"
#import "ShareSDKDemoMoreViewController.h"
#import "QQDemoViewController.h"
#import "RespViewController.h"
#import "AGWeiXinQQDemoController.h"

@implementation AGAppDelegate

- (id)init
{
    if(self = [super init])
    {
        _scene = WXSceneSession;
    }
    return self;
}

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [WXApi registerApp:@"wx6dd7a9b94f3dd72a"];
    [QQApi registerPluginWithId:@"QQ075BCD15"];
    [ShareSDK registerApp:@"520520test"];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    // Override point for customization after application launch.
    
    UITabBarController *tabController = [[[UITabBarController alloc] init] autorelease];
    
    UIViewController *apiVC = [[[AGApiViewController alloc] init] autorelease];
    apiVC.title = @"接口";
    UINavigationController *navApiVC = [[[UINavigationController alloc] initWithRootViewController:apiVC] autorelease];
    navApiVC.tabBarItem.title = @"接口";
    navApiVC.tabBarItem.image = [UIImage imageNamed:@"HomeIcon.png"];
    [tabController addChildViewController:navApiVC];
    
    UIViewController *authVC = [[[AGAuthViewController alloc] init] autorelease];
    authVC.title = @"授权";
    UINavigationController *navAuthVC = [[[UINavigationController alloc] initWithRootViewController:authVC] autorelease];
    navAuthVC.tabBarItem.title = @"授权";
    navAuthVC.tabBarItem.image = [UIImage imageNamed:@"AuthIcon.png"];
    [tabController addChildViewController:navAuthVC];
    
    UIViewController *weixinVC = [[[WeiXInDemoViewController alloc] init] autorelease];
    ((WeiXInDemoViewController *)weixinVC).delegate = self;
    UINavigationController *navWeiXinVC = [[[UINavigationController alloc] initWithRootViewController:weixinVC] autorelease];
    navWeiXinVC.tabBarItem.title = @"微信";
    navWeiXinVC.tabBarItem.image = [UIImage imageNamed:@"WeiXinTabIcon.png"];
    [tabController addChildViewController:navWeiXinVC];
    
    UIViewController *qqVC = [[[QQDemoViewController alloc] init] autorelease];
    UINavigationController *navQQVC = [[[UINavigationController alloc] initWithRootViewController:qqVC] autorelease];
    navQQVC.tabBarItem.title = @"QQ";
    navQQVC.tabBarItem.image = [UIImage imageNamed:@"QQTabIcon.png"];
    [tabController addChildViewController:navQQVC];
    
    UIViewController *shareVC = [[[AGViewController alloc] init] autorelease];
    UINavigationController *navShareVC = [[[UINavigationController alloc] initWithRootViewController:shareVC] autorelease];
    navShareVC.tabBarItem.title = @"自定义";
    navShareVC.tabBarItem.image = [UIImage imageNamed:@"CustomIcon.png"];
    [tabController addChildViewController:navShareVC];
    
    self.viewController = tabController;
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url wxDelegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return  [ShareSDK handleOpenURL:url wxDelegate:self];
}

- (BOOL)handleOpenURL:(NSURL*)url
{
    NSLog(@"%@",[url absoluteString]);
    
    QQApiMessage* msg = [QQApi handleOpenURL:url];
	if(msg)
    {
		switch (msg.type)
        {
			case QQApiMessageTypeShowMessageFromQQRequest:
            {
				// view the object
                QQApiObject* apiObj = msg.object;
                if([apiObj isMemberOfClass:[QQApiTextObject class]])
                {
                    QQApiTextObject* obj = (QQApiTextObject*)apiObj;
                    
                    NSMutableString* str = [NSMutableString stringWithCapacity:32];
                    [str appendFormat:@"title: %@\n", obj.title];
                    [str appendFormat:@"description: %@\n", obj.description];
                    [str appendFormat:@"text: %@", obj.text];
                    
                    NSLog(@"%@", str);
                    
                    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"msg from QQ" message:str delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                    [alertView show];
                    [alertView release];
                }
                else if([apiObj isMemberOfClass:[QQApiExtendObject class]])
                {
                    QQApiExtendObject* obj = (QQApiExtendObject*)apiObj;
                    
                    NSMutableString* str = [NSMutableString stringWithCapacity:32];
                    [str appendFormat:@"title: %@\n", obj.title];
                    [str appendFormat:@"description: %@\n", obj.description];
                    [str appendFormat:@"data size: %d\n", obj.data ? (int)[obj.data length] : 0];
                    [str appendFormat:@"previewImageData size: %d", obj.previewImageData ? (int)[obj.previewImageData length] : 0];
                    
                    NSLog(@"%@", str);
                    
                    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"msg from QQ" message:str delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                    [alertView show];
                    [alertView release];
                }
                else if([apiObj isMemberOfClass:[QQApiImageObject class]])
                {
                    QQApiImageObject* obj = (QQApiImageObject*)apiObj;
                    
                    NSMutableString* str = [NSMutableString stringWithCapacity:32];
                    [str appendFormat:@"title: %@\n", obj.title];
                    [str appendFormat:@"description: %@\n", obj.description];
                    [str appendFormat:@"data size: %d\n", obj.data ? (int)[obj.data length] : 0];
                    [str appendFormat:@"previewImageData size: %d", obj.previewImageData ? (int)[obj.previewImageData length] : 0];
                    
                    NSLog(@"%@", str);
                    
                    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"msg from QQ" message:str delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                    [alertView show];
                    [alertView release];
                }
                else if([apiObj isKindOfClass:[QQApiURLObject class]])
                {
                    QQApiURLObject* obj = (QQApiURLObject*)apiObj;
                    
                    NSMutableString* str = [NSMutableString stringWithCapacity:32];
                    [str appendFormat:@"title: %@\n", obj.title];
                    [str appendFormat:@"description: %@\n", obj.description];
                    [str appendFormat:@"targetContentType: %d\n", (int)obj.targetContentType];
                    [str appendFormat:@"url: %@\n", obj.url];
                    [str appendFormat:@"previewImageData size: %d", obj.previewImageData ? (int)[obj.previewImageData length] : 0];
                    
                    NSLog(@"%@", str);
                    
                    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"msg from QQ" message:str delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                    [alertView show];
                    [alertView release];
                }
				
				break;
			}
			case QQApiMessageTypeGetMessageFromQQRequest:
            {
                NSMutableString* str = [NSMutableString stringWithCapacity:32];
                [str appendFormat:@"msg type: %d\n", msg.type];
                
                UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"msg from QQ" message:str delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                [alertView show];
                [alertView release];
                
				// pick some item and send back to share with QQ
                RespViewController* vc = [[[RespViewController alloc] init] autorelease];
                [self.viewController presentModalViewController:vc animated:YES];
                
				break;
			}
			case QQApiMessageTypeSendMessageToQQResponse:
            {
				// simply a response
				QQApiResultObject* resultObject = (QQApiResultObject*)msg.object;
                
                NSString* str = [NSString stringWithFormat:@"发送消息结果:%@, errorDesp:%@", resultObject.error, resultObject.errorDescription];
                NSLog(@"%@", str);
                
                UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"msg" message:str delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                [alertView show];
                [alertView release];
                
				break;
			}
			default:
				break;
		}
        
	}
    
    return YES;
}

#pragma mark - WXApiDelegate

- (void) viewContent:(WXMediaMessage *) msg
{
    //显示微信传过来的内容
    WXAppExtendObject *obj = msg.mediaObject;
    
    NSString *strTitle = [NSString stringWithFormat:@"消息来自微信"];
    NSString *strMsg = [NSString stringWithFormat:@"标题：%@ \n内容：%@ \n附带信息：%@ \n缩略图:%u bytes\n\n", msg.title, msg.description, obj.extInfo, msg.thumbData.length];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}

- (void)doAuth
{
    SendAuthReq* req = [[[SendAuthReq alloc] init] autorelease];
    req.scope = @"post_timeline";
    req.state = @"xxx";
    
    [WXApi sendReq:req];
}

-(void) changeScene:(NSInteger)scene{
    _scene = scene;
}

-(void) onSentTextMessage:(BOOL) bSent
{
    // 通过微信发送消息后， 返回本App
    NSString *strTitle = [NSString stringWithFormat:@"发送结果"];
    NSString *strMsg = [NSString stringWithFormat:@"发送文本消息结果:%u", bSent];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}

-(void) onSentMediaMessage:(BOOL) bSent
{
    // 通过微信发送消息后， 返回本App
    NSString *strTitle = [NSString stringWithFormat:@"发送结果"];
    NSString *strMsg = [NSString stringWithFormat:@"发送媒体消息结果:%u", bSent];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}

-(void) onSentAuthRequest:(NSString *) userName accessToken:(NSString *) token expireDate:(NSDate *) expireDate errorMsg:(NSString *) errMsg
{
    
}

-(void) onShowMediaMessage:(WXMediaMessage *) message
{
    // 微信启动， 有消息内容。
    [self viewContent:message];
}

-(void) onRequestAppMessage
{
    // 微信请求App提供内容， 需要app提供内容后使用sendRsp返回
    
    RespForWeChatViewController* controller = [[RespForWeChatViewController alloc]autorelease];
    controller.delegate = self;
    [self.viewController presentModalViewController:controller animated:YES];
    
}

-(void) onReq:(BaseReq*)req
{
    if([req isKindOfClass:[GetMessageFromWXReq class]])
    {
        [self onRequestAppMessage];
    }
    else if([req isKindOfClass:[ShowMessageFromWXReq class]])
    {
        ShowMessageFromWXReq* temp = (ShowMessageFromWXReq*)req;
        [self onShowMediaMessage:temp.message];
    }
    
}

-(void) onResp:(BaseResp*)resp
{
    if([resp isKindOfClass:[SendMessageToWXResp class]])
    {
        NSString *strTitle = [NSString stringWithFormat:@"发送结果"];
        NSString *strMsg = [NSString stringWithFormat:@"发送媒体消息结果:%d", resp.errCode];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
    else if([resp isKindOfClass:[SendAuthResp class]])
    {
        NSString *strTitle = [NSString stringWithFormat:@"Auth结果"];
        NSString *strMsg = [NSString stringWithFormat:@"Auth结果:%d", resp.errCode];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
}


- (void) sendImageContent
{
    //发送内容给微信
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:[UIImage imageNamed:@"res1thumb.png"]];
    
    WXImageObject *ext = [WXImageObject object];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res1" ofType:@"jpg"];
    ext.imageData = [NSData dataWithContentsOfFile:filePath] ;
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[[SendMessageToWXReq alloc] init]autorelease];
    req.bText = NO;
    req.message = message;
    req.scene = _scene;
    
    [WXApi sendReq:req];
}

- (void) RespImageContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:[UIImage imageNamed:@"res2.jpg"]];
    WXImageObject *ext = [WXImageObject object];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res2" ofType:@"jpg"];
    ext.imageData = [NSData dataWithContentsOfFile:filePath] ;
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[[GetMessageFromWXResp alloc] init] autorelease];
    resp.message = message;
    resp.bText = NO;
    
    [WXApi sendResp:resp];
}

- (void) sendNewsContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"麦当劳“销售过期食品”其实不是卫生问题";
    message.description = @"3.15晚会播出当晚，麦当劳该店所在辖区的卫生、工商部门就连夜登门调查，并对腾讯财经等媒体公布初步结果；而尽管未接到闭店处罚通知，麦当劳中国总部还是在发布道歉声明后暂停了该店营业。\
    \
    不得不承认，麦当劳“销售过期食品”固然是事实，但这个“过期”仅仅是他们自己定义的过期，普通中国家庭也不会把刚炸出来30分钟的鸡翅拿去扔掉。麦当劳在食品卫生上的严格程度，不仅远远超出了一般国内企业，而且也超出了一般中国民众的心理预期和生活想象。大多数人以前并不知道，麦当劳厨房的食品架上还有计时器，辣鸡翅等大多数食品存放半个小时之后，按规定就应该扔掉。也正因如此，甚至有网友认为央视3.15晚会的曝光是给麦当劳做的软广告。\
    \
    央视视频中反映的情况，除了掉到地上的的食品未经任何处理继续加工显得很过分外，其它的问题都源于麦当劳自己制定的标准远远超出了国内一般快餐店的标准。比如北京市卫生监督所相关负责人介绍，麦当劳内部要求熟菜在70℃环境下保存2小时，是为了保存食品风味，属于企业内部卫生规范。目前的检查结果显示，麦当劳的保温盒温度在93℃，但在这种环境下保存的熟菜即便超过2小时，对公众也没有危害。也就是说麦当劳的一些保持时间标准是基于保持其食品的独特风味的要求，并非食品发生变质可能损害消费者身体健康的标准，麦当劳这家门店超时存放食品的行为，违反的是企业制定的内部标准，并不违反食品安全规定，政府应该依据法律法规来监管食品卫生，而不是按照食品公司自己制定的标准，从这个角度来看，麦当劳在食品卫生上没有责任（除了使用掉在地上的食物）。…[详细]\
    \
    但三里屯麦当劳的行为确实违背了诚信\
    麦当劳的内部卫生规定虽然并未被作为卖点进行宣扬，但洋快餐在中国是便捷和卫生的代名词，却是不争的事实。谁也不是活雷锋，麦当劳制定的严苛内部标准，为的是树立自己的品牌优势，进而在市场定位上取得明显的价格优势，或者说让自己“贵得有理由”。但如果他的员工在执行上不能贯彻这一企业标准，相对于其价格水平而言，就有欺诈和损害消费者权益之嫌，这也是不言而喻的。从这个意义上来说，央视曝光麦当劳的问题并无不妥，麦当劳至少涉嫌消费欺诈，因为它没有向消费者提供它向人们承诺的标准的食品。也就是说，工商部门而非食品卫生监管部门约谈麦当劳，也并非师出无名。";
    [message setThumbImage:[UIImage imageNamed:@"res2.jpg"]];
    
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = @"http://view.news.qq.com/zt2012/mdl/index.htm";
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[[SendMessageToWXReq alloc] init]autorelease];
    req.bText = NO;
    req.message = message;
    req.scene = _scene;
    
    [WXApi sendReq:req];
}

-(void) RespNewsContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"麦当劳“销售过期食品”其实不是卫生问题";
    message.description = @"3.15晚会播出当晚，麦当劳该店所在辖区的卫生、工商部门就连夜登门调查，并对腾讯财经等媒体公布初步结果；而尽管未接到闭店处罚通知，麦当劳中国总部还是在发布道歉声明后暂停了该店营业。\
    \
    不得不承认，麦当劳“销售过期食品”固然是事实，但这个“过期”仅仅是他们自己定义的过期，普通中国家庭也不会把刚炸出来30分钟的鸡翅拿去扔掉。麦当劳在食品卫生上的严格程度，不仅远远超出了一般国内企业，而且也超出了一般中国民众的心理预期和生活想象。大多数人以前并不知道，麦当劳厨房的食品架上还有计时器，辣鸡翅等大多数食品存放半个小时之后，按规定就应该扔掉。也正因如此，甚至有网友认为央视3.15晚会的曝光是给麦当劳做的软广告。\
    \
    央视视频中反映的情况，除了掉到地上的的食品未经任何处理继续加工显得很过分外，其它的问题都源于麦当劳自己制定的标准远远超出了国内一般快餐店的标准。比如北京市卫生监督所相关负责人介绍，麦当劳内部要求熟菜在70℃环境下保存2小时，是为了保存食品风味，属于企业内部卫生规范。目前的检查结果显示，麦当劳的保温盒温度在93℃，但在这种环境下保存的熟菜即便超过2小时，对公众也没有危害。也就是说麦当劳的一些保持时间标准是基于保持其食品的独特风味的要求，并非食品发生变质可能损害消费者身体健康的标准，麦当劳这家门店超时存放食品的行为，违反的是企业制定的内部标准，并不违反食品安全规定，政府应该依据法律法规来监管食品卫生，而不是按照食品公司自己制定的标准，从这个角度来看，麦当劳在食品卫生上没有责任（除了使用掉在地上的食物）。…[详细]\
    \
    但三里屯麦当劳的行为确实违背了诚信\
    麦当劳的内部卫生规定虽然并未被作为卖点进行宣扬，但洋快餐在中国是便捷和卫生的代名词，却是不争的事实。谁也不是活雷锋，麦当劳制定的严苛内部标准，为的是树立自己的品牌优势，进而在市场定位上取得明显的价格优势，或者说让自己“贵得有理由”。但如果他的员工在执行上不能贯彻这一企业标准，相对于其价格水平而言，就有欺诈和损害消费者权益之嫌，这也是不言而喻的。从这个意义上来说，央视曝光麦当劳的问题并无不妥，麦当劳至少涉嫌消费欺诈，因为它没有向消费者提供它向人们承诺的标准的食品。也就是说，工商部门而非食品卫生监管部门约谈麦当劳，也并非师出无名。";
    [message setThumbImage:[UIImage imageNamed:@"res2.jpg"]];
    
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = @"http://view.news.qq.com/zt2012/mdl/index.htm";
    
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[[GetMessageFromWXResp alloc] init] autorelease];
    resp.message = message;
    resp.bText = NO;
    
    [WXApi sendResp:resp];
}

-(void) sendMusicContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"五月天<后青春期的诗>";
    message.description = @"人群中哭着你只想变成透明的颜色\
    你再也不会梦或痛或心动了\
    你已经决定了你已经决定了\
    你静静忍着紧紧把昨天在拳心握着\
    而回忆越是甜就是越伤人\
    越是在手心留下密密麻麻深深浅浅的刀割\
    你不是真正的快乐\
    你的笑只是你穿的保护色\
    你决定不恨了也决定不爱了\
    把你的灵魂关在永远锁上的躯壳\
    这世界笑了于是你合群的一起笑了\
    当生存是规则不是你的选择\
    于是你含着眼泪飘飘荡荡跌跌撞撞地走着\
    你不是真正的快乐\
    你的笑只是你穿的保护色\
    你决定不恨了也决定不爱了\
    把你的灵魂关在永远锁上的躯壳\
    你不是真正的快乐\
    你的伤从不肯完全的愈合\
    我站在你左侧却像隔着银河\
    难道就真的抱着遗憾一直到老了\
    然后才后悔着\
    你不是真正的快乐\
    你的笑只是你穿的保护色\
    你决定不恨了也决定不爱了\
    把你的灵魂关在永远锁上的躯壳\
    你不是真正的快乐\
    你的伤从不肯完全的愈合\
    我站在你左侧却像隔着银河\
    难道就真的抱着遗憾一直到老了\
    你值得真正的快乐\
    你应该脱下你穿的保护色\
    为什么失去了还要被惩罚呢\
    能不能就让悲伤全部结束在此刻\
    重新开始活着";
    [message setThumbImage:[UIImage imageNamed:@"res3.jpg"]];
    
    WXMusicObject *ext = [WXMusicObject object];
    ext.musicUrl = @"http://y.qq.com/i/song.html#p=7B22736F6E675F4E616D65223A22E4BDA0E4B88DE698AFE79C9FE6ADA3E79A84E5BFABE4B990222C22736F6E675F5761704C69766555524C223A22687474703A2F2F74736D7573696332342E74632E71712E636F6D2F586B303051563558484A645574315070536F4B7458796931667443755A68646C2F316F5A4465637734356375386355672B474B304964794E6A3770633447524A574C48795333383D2F3634363232332E6D34613F7569643D32333230303738313038266469723D423226663D312663743D3026636869643D222C22736F6E675F5769666955524C223A22687474703A2F2F73747265616D31382E71716D757369632E71712E636F6D2F33303634363232332E6D7033222C226E657454797065223A2277696669222C22736F6E675F416C62756D223A22E5889BE980A0EFBC9AE5B08FE5B7A8E89B8B444E414C495645EFBC81E6BC94E594B1E4BC9AE5889BE7BAAAE5BD95E99FB3222C22736F6E675F4944223A3634363232332C22736F6E675F54797065223A312C22736F6E675F53696E676572223A22E4BA94E69C88E5A4A9222C22736F6E675F576170446F776E4C6F616455524C223A22687474703A2F2F74736D757369633132382E74632E71712E636F6D2F586C464E4D31354C5569396961495674593739786D436534456B5275696879366A702F674B65356E4D6E684178494C73484D6C6A307849634A454B394568572F4E3978464B316368316F37636848323568413D3D2F33303634363232332E6D70333F7569643D32333230303738313038266469723D423226663D302663743D3026636869643D2673747265616D5F706F733D38227D";
    ext.musicDataUrl = @"http://mp3.mwap8.com/destdir/Music/2009/20090601/ZuiXuanMinZuFeng20090601119.mp3";
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[[SendMessageToWXReq alloc] init]autorelease];
    req.bText = NO;
    req.message = message;
    req.scene = _scene;
    
    [WXApi sendReq:req];
}

-(void) RespMusicContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"五月天<后青春期的诗>";
    message.description = @"人群中哭着你只想变成透明的颜色\
    你再也不会梦或痛或心动了\
    你已经决定了你已经决定了\
    你静静忍着紧紧把昨天在拳心握着\
    而回忆越是甜就是越伤人\
    越是在手心留下密密麻麻深深浅浅的刀割\
    你不是真正的快乐\
    你的笑只是你穿的保护色\
    你决定不恨了也决定不爱了\
    把你的灵魂关在永远锁上的躯壳\
    这世界笑了于是你合群的一起笑了\
    当生存是规则不是你的选择\
    于是你含着眼泪飘飘荡荡跌跌撞撞地走着\
    你不是真正的快乐\
    你的笑只是你穿的保护色\
    你决定不恨了也决定不爱了\
    把你的灵魂关在永远锁上的躯壳\
    你不是真正的快乐\
    你的伤从不肯完全的愈合\
    我站在你左侧却像隔着银河\
    难道就真的抱着遗憾一直到老了\
    然后才后悔着\
    你不是真正的快乐\
    你的笑只是你穿的保护色\
    你决定不恨了也决定不爱了\
    把你的灵魂关在永远锁上的躯壳\
    你不是真正的快乐\
    你的伤从不肯完全的愈合\
    我站在你左侧却像隔着银河\
    难道就真的抱着遗憾一直到老了\
    你值得真正的快乐\
    你应该脱下你穿的保护色\
    为什么失去了还要被惩罚呢\
    能不能就让悲伤全部结束在此刻\
    重新开始活着";
    [message setThumbImage:[UIImage imageNamed:@"res3.jpg"]];
    WXMusicObject *ext = [WXMusicObject object];
    ext.musicUrl = @"http://y.qq.com/i/song.html#p=7B22736F6E675F4E616D65223A22E4BDA0E4B88DE698AFE79C9FE6ADA3E79A84E5BFABE4B990222C22736F6E675F5761704C69766555524C223A22687474703A2F2F74736D7573696332342E74632E71712E636F6D2F586B303051563558484A645574315070536F4B7458796931667443755A68646C2F316F5A4465637734356375386355672B474B304964794E6A3770633447524A574C48795333383D2F3634363232332E6D34613F7569643D32333230303738313038266469723D423226663D312663743D3026636869643D222C22736F6E675F5769666955524C223A22687474703A2F2F73747265616D31382E71716D757369632E71712E636F6D2F33303634363232332E6D7033222C226E657454797065223A2277696669222C22736F6E675F416C62756D223A22E5889BE980A0EFBC9AE5B08FE5B7A8E89B8B444E414C495645EFBC81E6BC94E594B1E4BC9AE5889BE7BAAAE5BD95E99FB3222C22736F6E675F4944223A3634363232332C22736F6E675F54797065223A312C22736F6E675F53696E676572223A22E4BA94E69C88E5A4A9222C22736F6E675F576170446F776E4C6F616455524C223A22687474703A2F2F74736D757369633132382E74632E71712E636F6D2F586C464E4D31354C5569396961495674593739786D436534456B5275696879366A702F674B65356E4D6E684178494C73484D6C6A307849634A454B394568572F4E3978464B316368316F37636848323568413D3D2F33303634363232332E6D70333F7569643D32333230303738313038266469723D423226663D302663743D3026636869643D2673747265616D5F706F733D38227D";
    ext.musicDataUrl = @"http://mp3.mwap8.com/destdir/Music/2009/20090601/ZuiXuanMinZuFeng20090601119.mp3";
    
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[[GetMessageFromWXResp alloc] init] autorelease];
    resp.message = message;
    resp.bText = NO;
    
    [WXApi sendResp:resp];
}

-(void) sendVideoContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"步步惊奇";
    message.description = @"只能说胡戈是中国广告界的一朵奇葩！！！这次真的很多人给跪了、、、";
    [message setThumbImage:[UIImage imageNamed:@"res2.jpg"]];
    
    WXVideoObject *ext = [WXVideoObject object];
    ext.videoUrl = @"http://www.tudou.com/programs/view/6vx5h884JHY/?fr=1";
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[[SendMessageToWXReq alloc] init]autorelease];
    req.bText = NO;
    req.message = message;
    req.scene = _scene;
    
    [WXApi sendReq:req];
}

-(void) RespVideoContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"步步惊奇";
    message.description = @"只能说胡戈是中国广告界的一朵奇葩！！！这次真的很多人给跪了、、、";
    [message setThumbImage:[UIImage imageNamed:@"res2.jpg"]];
    
    WXVideoObject *ext = [WXVideoObject object];
    ext.videoUrl = @"http://www.tudou.com/programs/view/6vx5h884JHY/?fr=1";
    
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[[GetMessageFromWXResp alloc] init] autorelease];
    resp.message = message;
    resp.bText = NO;
    
    [WXApi sendResp:resp];
}

- (void) sendTextContent:(NSString*)nsText
{
    SendMessageToWXReq* req = [[[SendMessageToWXReq alloc] init]autorelease];
    req.bText = YES;
    req.text = nsText;
    req.scene = _scene;
    
    [WXApi sendReq:req];
}

-(void) RespTextContent:(NSString *)nsText
{
    GetMessageFromWXResp* resp = [[[GetMessageFromWXResp alloc] init] autorelease];
    resp.text = nsText;
    resp.bText = YES;
    
    [WXApi sendResp:resp];
}

#define BUFFER_SIZE 1024 * 100
- (void) sendAppContent
{
    // 发送内容给微信
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"这是App消息";
    message.description = @"你看不懂啊， 看不懂啊， 看不懂！";
    [message setThumbImage:[UIImage imageNamed:@"res2.jpg"]];
    
    WXAppExtendObject *ext = [WXAppExtendObject object];
    ext.extInfo = @"<xml>test</xml>";
    ext.url = @"http://www.qq.com";
    
    Byte* pBuffer = (Byte *)malloc(BUFFER_SIZE);
    memset(pBuffer, 0, BUFFER_SIZE);
    NSData* data = [NSData dataWithBytes:pBuffer length:BUFFER_SIZE];
    free(pBuffer);
    
    ext.fileData = data;
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[[SendMessageToWXReq alloc] init]autorelease];
    req.bText = NO;
    req.message = message;
    req.scene = _scene;
    
    [WXApi sendReq:req];
}

-(void) RespAppContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"这是App消息";
    message.description = @"你看不懂啊， 看不懂啊， 看不懂！";
    [message setThumbImage:[UIImage imageNamed:@"res2.jpg"]];
    
    WXAppExtendObject *ext = [WXAppExtendObject object];
    ext.extInfo = @"<xml>test</xml>";
    
    Byte* pBuffer = (Byte *)malloc(BUFFER_SIZE);
    memset(pBuffer, 0, BUFFER_SIZE);
    NSData* data = [NSData dataWithBytes:pBuffer length:BUFFER_SIZE];
    free(pBuffer);
    
    ext.fileData = data;
    
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[[GetMessageFromWXResp alloc] init] autorelease];
    resp.message = message;
    resp.bText = NO;
    
    [WXApi sendResp:resp];
}

- (void) sendNonGifContent
{
    //发送内容给微信
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:[UIImage imageNamed:@"res1thumb.png"]];
    
    WXEmoticonObject *ext = [WXEmoticonObject object];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res1" ofType:@"jpg"];
    ext.emoticonData = [NSData dataWithContentsOfFile:filePath] ;
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[[SendMessageToWXReq alloc] init]autorelease];
    req.bText = NO;
    req.message = message;
    req.scene = _scene;
    
    [WXApi sendReq:req];
}

- (void)RespNonGifContent{
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:[UIImage imageNamed:@"res1thumb.png"]];
    
    WXEmoticonObject *ext = [WXEmoticonObject object];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res1" ofType:@"jpg"];
    ext.emoticonData = [NSData dataWithContentsOfFile:filePath] ;
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[[GetMessageFromWXResp alloc] init] autorelease];
    resp.message = message;
    resp.bText = NO;
    
    [WXApi sendResp:resp];
}

- (void) sendGifContent
{
    //发送内容给微信
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:[UIImage imageNamed:@"res6thumb.png"]];
    
    WXEmoticonObject *ext = [WXEmoticonObject object];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"];
    ext.emoticonData = [NSData dataWithContentsOfFile:filePath] ;
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[[SendMessageToWXReq alloc] init]autorelease];
    req.bText = NO;
    req.message = message;
    req.scene = _scene;
    
    [WXApi sendReq:req];
}

- (void)RespGifContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:[UIImage imageNamed:@"res6thumb.png"]];
    WXEmoticonObject *ext = [WXEmoticonObject object];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"];
    ext.emoticonData = [NSData dataWithContentsOfFile:filePath] ;
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[[GetMessageFromWXResp alloc] init] autorelease];
    resp.message = message;
    resp.bText = NO;
    
    [WXApi sendResp:resp];
}

- (void) RespEmoticonContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:[UIImage imageNamed:@"res2.jpg"]];
    WXEmoticonObject *ext = [WXEmoticonObject object];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res2" ofType:@"jpg"];
    ext.emoticonData = [NSData dataWithContentsOfFile:filePath] ;
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[[GetMessageFromWXResp alloc] init] autorelease];
    resp.message = message;
    resp.bText = NO;
    
    [WXApi sendResp:resp];
}

@end
