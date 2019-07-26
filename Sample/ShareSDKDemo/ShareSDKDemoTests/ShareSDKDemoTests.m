//
//  ShareSDKDemoTests.m
//  ShareSDKDemoTests
//
//  Created by youzu_Max on 2017/10/12.
//  Copyright © 2017年 mob. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <ShareSDK/ShareSDK.h>
#import <ShareSDK/ShareSDK+Base.h>
#import <ShareSDK/SSDKContext.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <ShareSDKExtension/ShareSDK+Extension.h>
#import <objc/message.h>
#import <FacebookAccountConnector/FacebookAccountConnector.h>
#import <MOBFoundation/MOBFoundation.h>
#import <Photos/Photos.h>

@interface ShareSDKDemoTests : XCTestCase

@end

@implementation ShareSDKDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


#pragma mark - Common Interface

- (void)testHasAuthed
{
    [self testRegistNormal];//先注册
    for(NSInteger i=0; i<1000; i++)
    {
        BOOL hasAuthed = [ShareSDK hasAuthorized:i];
        NSLog(@"-------> hasAuthed: %d",hasAuthed);
    }
}

- (void)testGetCurrentUser
{
    [self testRegistNormal];//先注册
    for(NSInteger i=0; i<1000; i++)
    {
        SSDKUser *user = [ShareSDK currentUser:i];
        NSLog(@"-------> currentUser: %@",user);
    }
}

- (void)testGetConfig
{
    for(NSInteger i=0; i<1000; i++)
    {
        NSDictionary * config = [ShareSDK configWithPlatform:i];
        NSLog(@"-------> config: %@",config);
    }
}

- (void)testGetVersion
{
    for(NSInteger i=0; i<1000; i++)
    {
        NSLog(@"-------> version:%@",[ShareSDK sdkVersion]);
    }
}

#pragma mark - Regist

- (void)testRegistNormal
{
    [ShareSDK registPlatforms:^(SSDKRegister *platformsRegister) {
        [platformsRegister setupQQWithAppId:@"1111111" appkey:@"2222222"];
        [platformsRegister setupWeChatWithAppId:@"333333" appSecret:@"444444"];
        [platformsRegister setupSinaWeiboWithAppkey:@"568898243" appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3" redirectUrl:@"http://www.sharesdk.cn"];
        [platformsRegister setupFacebookWithAppkey:@"1412473428822331" appSecret:@"a42f4f3f867dc947b9ed6020c2e93558" displayName:@"shareSDK"];
        [platformsRegister setupTwitterWithKey:@"0000000" secret:@"999999" redirectUrl:@"http://vvvv"];
        [platformsRegister setupInstagramWithClientId:@"ff68e3216b4f4f989121aa1c2962d058" clientSecret:@"1b2e82f110264869b3505c3fe34e31a1" redirectUrl:@"http://sharesdk.cn"];
        [platformsRegister setupDingTalkWithAppId:@"dingoabcwtuab76wy0kyzo"];
        [platformsRegister setupAliSocialWithAppId:@"2017062107540437"];
        [platformsRegister setupDouBanWithApikey:@"02e2cbe5ca06de5908a863b15e149b0b" appSecret:@"9f1e7b4f71304f2f" redirectUrl:@"http://www.sharesdk.cn"];
        [platformsRegister setupDropboxWithAppKey:@"us514wslpfojbxc" appSecret:@"w0nmp4os3ngo1ja" redirectUrl:@"http://localhost"];
        [platformsRegister setupYiXinByAppId:@"yx0d9a9f9088ea44d78680f3274da1765f" appSecret:@"1a5bd421ae089c3" redirectUrl:@"https://open.yixin.im/resource/oauth2_callback.html"];
        [platformsRegister setupFlickrWithApiKey:@"cbed81d4a1bc7417693ab7865e354717" apiSecret:@"4c490343869091f2"];
        [platformsRegister setupInstapaperWithConsumerKey:@"4rDJORmcOcSAZL1YpqGHRI605xUvrLbOhkJ07yO0wWrYrc61FA" consumerSecret:@"GNr1GespOQbrm8nvd7rlUsyRQsIo3boIbMguAl9gfpdL0aKZWe"];
        [platformsRegister setupLineAuthType:SSDKAuthorizeTypeBoth];
        [platformsRegister setupEvernoteByConsumerKey:@"46131514-6903" consumerSecret:@"08d7a6f3afcc888a" sandbox:YES];
        [platformsRegister setupKaKaoWithAppkey:@"9c17eb03317e0e627ec95a400f5785fb" restApiKey:@"802e551a5048c3172fc1dedaaf40fcf1" redirectUrl:@"http://www.mob.com/oauth"];
        [platformsRegister setupVKontakteWithApplicationId:@"5312801" secretKey:@"ZHG2wGymmNUCRLG2r6CY" authType:SSDKAuthorizeTypeBoth];
        [platformsRegister setupYouTubeWithClientId:@"906418427202-jinnbqal1niq4s8isbg2ofsqc5ddkcgr.apps.googleusercontent.com" clientSecret:@"" redirectUrl:@"http://localhost"];
        [platformsRegister setupMeiPaiWithAppkey:@"1089867639"];
        [platformsRegister setupTencentWeiboWithAppkey:@"801307650" appSecret:@"ae36f4ee3946e1cbb98d6965b0b2ff5c" redirectUrl:@"http://www.sharesdk.cn"];
        
        [platformsRegister setupRenRenWithAppId:@"226427" appKey:@"fc5b8aed373c4c27a05b712acba0f8c3" secretKey:@"f29df781abdd4f49beca5a2194676ca4" authType:SSDKAuthorizeTypeBoth];
        [platformsRegister setupCMCCByAppId:@"300011862498" appKey:@"38D9CA1CC280C5F207E2C343745D4A4B" displayUI:YES];
        [platformsRegister setupYouDaoNoteWithConsumerKey:@"dcde25dca105bcc36884ed4534dab940" consumerSecret:@"d98217b4020e7f1874263795f44838fe" oauthCallback:@"http://www.sharesdk.cn/"];
    }];
}

- (void)testRegistParamsIllegal
{
    [ShareSDK registPlatforms:^(SSDKRegister *platformsRegister) {
        [platformsRegister setupQQWithAppId:nil appkey:nil];
        [platformsRegister setupWeChatWithAppId:nil appSecret:nil];
        [platformsRegister setupSinaWeiboWithAppkey:nil appSecret:nil redirectUrl:nil];
        [platformsRegister setupFacebookWithAppkey:nil appSecret:nil displayName:nil];
        [platformsRegister setupTwitterWithKey:nil secret:nil redirectUrl:nil];
        [platformsRegister setupInstagramWithClientId:nil clientSecret:nil redirectUrl:nil];
        [platformsRegister setupDingTalkWithAppId:nil];
        [platformsRegister setupAliSocialWithAppId:nil];
        [platformsRegister setupDouBanWithApikey:nil appSecret:nil redirectUrl:nil];
        [platformsRegister setupDropboxWithAppKey:nil appSecret:nil redirectUrl:nil];
        [platformsRegister setupYiXinByAppId:nil appSecret:nil redirectUrl:nil];
        [platformsRegister setupFlickrWithApiKey:nil apiSecret:nil];
        [platformsRegister setupInstapaperWithConsumerKey:nil consumerSecret:nil];
        [platformsRegister setupLineAuthType:SSDKAuthorizeTypeBoth];
        [platformsRegister setupEvernoteByConsumerKey:nil consumerSecret:nil sandbox:YES];
        [platformsRegister setupKaKaoWithAppkey:nil restApiKey:nil redirectUrl:nil];
        [platformsRegister setupVKontakteWithApplicationId:nil secretKey:nil authType:SSDKAuthorizeTypeBoth];
        [platformsRegister setupYouTubeWithClientId:nil clientSecret:nil redirectUrl:nil];
        [platformsRegister setupMeiPaiWithAppkey:nil];
        [platformsRegister setupTencentWeiboWithAppkey:nil appSecret:nil redirectUrl:nil];
        
        [platformsRegister setupRenRenWithAppId:nil appKey:nil secretKey:nil authType:SSDKAuthorizeTypeBoth];
        [platformsRegister setupCMCCByAppId:nil appKey:nil displayUI:YES];
        [platformsRegister setupYouDaoNoteWithConsumerKey:nil consumerSecret:nil oauthCallback:nil];
    }];
    
    [self testRegistNormal];//注册回去，防止后续test出错
}

- (void)testRegistHighConcurrency
{
    for (NSInteger i=0; i<100; i++)
    {
        [self testRegistNormal];
    }
}

#pragma mark - 微信分享

- (void)testWeChatSessionShareTextWithCommonParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
        
        [ShareSDK share:SSDKPlatformTypeWechat parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
        
    }];
}

- (void)testWeChatTimelineShareTextWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
        
        [ShareSDK share:SSDKPlatformSubTypeWechatTimeline parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeChatFavShareTextWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
        
        [ShareSDK share:SSDKPlatformSubTypeWechatFav parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeChatSessionShareImageWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params SSDKSetupShareParamsByText:@"testText"
                                    images:@[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1526463559502&di=f078ab4b4d8ebfb092c76a4bead1bd87&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201805%2F11%2F190556y96ja6qjal9l99ah.jpg"]
                                       url:[NSURL URLWithString:@"www.mob.com"]
                                     title:@"I love u"
                                      type:SSDKContentTypeImage];
        
        [ShareSDK share:SSDKPlatformTypeWechat parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeChatTimelineShareImageWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params SSDKSetupShareParamsByText:@"testText"
                                    images:@[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1526463559502&di=f078ab4b4d8ebfb092c76a4bead1bd87&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201805%2F11%2F190556y96ja6qjal9l99ah.jpg"]
                                       url:[NSURL URLWithString:@"www.mob.com"]
                                     title:@"I love u"
                                      type:SSDKContentTypeImage];
        
        [ShareSDK share:SSDKPlatformSubTypeWechatTimeline parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeChatFavShareImageWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params SSDKSetupShareParamsByText:@"testText"
                                    images:@[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1526463559502&di=f078ab4b4d8ebfb092c76a4bead1bd87&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201805%2F11%2F190556y96ja6qjal9l99ah.jpg"]
                                       url:[NSURL URLWithString:@"www.mob.com"]
                                     title:@"I love u"
                                      type:SSDKContentTypeImage];
        
        [ShareSDK share:SSDKPlatformSubTypeWechatFav parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeChatSessionShareLinkWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"https://www.mob.com"]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformTypeWechat parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeChatTimelineShareLinkWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"https://www.mob.com"]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformSubTypeWechatTimeline parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeChatFavShareLinkWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"https://www.mob.com"]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformSubTypeWechatFav parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeChatSessionShareMusicWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params SSDKSetupShareParamsByText:@"崔健"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
                                     title:@"一无所有"
                                      type:SSDKContentTypeAudio];
        [ShareSDK share:SSDKPlatformTypeWechat parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeChatTimelineShareMusicWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params SSDKSetupShareParamsByText:@"崔健"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
                                     title:@"一无所有"
                                      type:SSDKContentTypeAudio];
        [ShareSDK share:SSDKPlatformSubTypeWechatTimeline parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeChatFavShareMusicWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params SSDKSetupShareParamsByText:@"崔健"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
                                     title:@"一无所有"
                                      type:SSDKContentTypeAudio];
        [ShareSDK share:SSDKPlatformSubTypeWechatFav parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeChatSessionShareVideoWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params SSDKSetupShareParamsByText:@"视频"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html"]
                                     title:@"乔布斯"
                                      type:SSDKContentTypeVideo];
        [ShareSDK share:SSDKPlatformTypeWechat parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeChatTimelineShareVideoWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params SSDKSetupShareParamsByText:@"视频"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html"]
                                     title:@"乔布斯"
                                      type:SSDKContentTypeVideo];
        [ShareSDK share:SSDKPlatformSubTypeWechatTimeline parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeChatFavShareVideoWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params SSDKSetupShareParamsByText:@"视频"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html"]
                                     title:@"乔布斯"
                                      type:SSDKContentTypeVideo];
        [ShareSDK share:SSDKPlatformSubTypeWechatFav parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeChatSessionShareAppWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params SSDKSetupShareParamsByText:@"Share SDK"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                     title:@"App消息"
                                      type:SSDKContentTypeApp];
        [params SSDKSetupWeChatParamsByText:nil
                                      title:nil
                                        url:nil
                                 thumbImage:nil
                                      image:nil
                               musicFileURL:nil
                                    extInfo:nil
                                   fileData:[@"13232" dataUsingEncoding:NSUTF8StringEncoding]
                               emoticonData:nil
                        sourceFileExtension:nil
                             sourceFileData:nil
                                       type:SSDKContentTypeAuto
                         forPlatformSubType:SSDKPlatformSubTypeWechatSession];
        
        [ShareSDK share:SSDKPlatformTypeWechat parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeChatSessionShareEmotioconWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:[NSURL URLWithString:@"http://www.mob.com"]
                                         title:nil
                                          type:SSDKContentTypeAuto];
        
        [parameters SSDKSetupWeChatParamsByText:nil
                                          title:nil
                                            url:nil
                                     thumbImage:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                          image:nil
                                   musicFileURL:nil
                                        extInfo:nil
                                       fileData:nil
                                   emoticonData:[[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"]
                            sourceFileExtension:nil
                                 sourceFileData:nil
                                           type:SSDKContentTypeImage
                             forPlatformSubType:SSDKPlatformSubTypeWechatSession];
        [ShareSDK share:SSDKPlatformTypeWechat parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeChatSessionShareTextWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        
        [params SSDKSetupWeChatParamsByText:@"Share SDK" title:nil url:nil thumbImage:nil image:nil musicFileURL:nil extInfo:nil fileData:nil emoticonData:nil sourceFileExtension:nil sourceFileData:nil type:SSDKContentTypeAuto forPlatformSubType:SSDKPlatformSubTypeWechatSession];
        [ShareSDK share:SSDKPlatformTypeWechat parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeChatSessionShareImageWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params SSDKSetupWeChatParamsByText:@"Share SDK"
                                      title:@"I love u"
                                        url:[NSURL URLWithString:@"www.mob.com"]
                                 thumbImage:nil
                                      image:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1526463559502&di=f078ab4b4d8ebfb092c76a4bead1bd87&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201805%2F11%2F190556y96ja6qjal9l99ah.jpg"
                               musicFileURL:nil
                                    extInfo:nil
                                   fileData:nil
                               emoticonData:nil
                        sourceFileExtension:nil
                             sourceFileData:nil
                                       type:SSDKContentTypeImage
                         forPlatformSubType:SSDKPlatformSubTypeWechatSession];
        
        [ShareSDK share:SSDKPlatformTypeWechat parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeChatSessionShareLinkWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        
        [params SSDKSetupWeChatParamsByText:@"Share SDK"
                                      title:@"I love u"
                                        url:[NSURL URLWithString:@"www.mob.com"]
                                 thumbImage:nil
                                      image:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1526463559502&di=f078ab4b4d8ebfb092c76a4bead1bd87&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201805%2F11%2F190556y96ja6qjal9l99ah.jpg"
                               musicFileURL:nil
                                    extInfo:nil
                                   fileData:nil
                               emoticonData:nil
                        sourceFileExtension:nil
                             sourceFileData:nil
                                       type:SSDKContentTypeWebPage
                         forPlatformSubType:SSDKPlatformSubTypeWechatSession];
        [ShareSDK share:SSDKPlatformTypeWechat parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeChatSessionShareMusicWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        
        [params SSDKSetupWeChatParamsByText:@"崔健"
                                      title:@"一无所有"
                                        url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
                                 thumbImage:nil
                                      image:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1526463559502&di=f078ab4b4d8ebfb092c76a4bead1bd87&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201805%2F11%2F190556y96ja6qjal9l99ah.jpg"
                               musicFileURL:nil
                                    extInfo:nil
                                   fileData:nil
                               emoticonData:nil
                        sourceFileExtension:nil
                             sourceFileData:nil
                                       type:SSDKContentTypeAudio
                         forPlatformSubType:SSDKPlatformSubTypeWechatSession];
        [ShareSDK share:SSDKPlatformTypeWechat parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeChatSessionShareVideoWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        
        [params SSDKSetupWeChatParamsByText:@"视频"
                                      title:@"乔布斯"
                                        url:[NSURL URLWithString:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html"]
                                 thumbImage:nil
                                      image:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1526463559502&di=f078ab4b4d8ebfb092c76a4bead1bd87&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201805%2F11%2F190556y96ja6qjal9l99ah.jpg"
                               musicFileURL:nil
                                    extInfo:nil
                                   fileData:nil
                               emoticonData:nil
                        sourceFileExtension:nil
                             sourceFileData:nil
                                       type:SSDKContentTypeVideo
                         forPlatformSubType:SSDKPlatformSubTypeWechatSession];
        
        [ShareSDK share:SSDKPlatformTypeWechat parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeChatSessionShareAppWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        
        [params SSDKSetupWeChatParamsByText:@"Share SDK"
                                      title:@"App消息"
                                        url:[NSURL URLWithString:@"http://www.mob.com"]
                                 thumbImage:nil
                                      image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                               musicFileURL:nil
                                    extInfo:nil
                                   fileData:[@"13232" dataUsingEncoding:NSUTF8StringEncoding]
                               emoticonData:nil
                        sourceFileExtension:nil
                             sourceFileData:nil
                                       type:SSDKContentTypeApp
                         forPlatformSubType:SSDKPlatformSubTypeWechatSession];
        
        [ShareSDK share:SSDKPlatformTypeWechat parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeChatSessionShareEmotioconWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        
        [parameters SSDKSetupWeChatParamsByText:@"Share SDK"
                                          title:nil
                                            url:[NSURL URLWithString:@"http://www.mob.com"]
                                     thumbImage:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                          image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                   musicFileURL:nil
                                        extInfo:nil
                                       fileData:nil
                                   emoticonData:[[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"]
                            sourceFileExtension:nil
                                 sourceFileData:nil
                                           type:SSDKContentTypeAuto
                             forPlatformSubType:SSDKPlatformSubTypeWechatSession];
        [ShareSDK share:SSDKPlatformTypeWechat parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeChatSessionShareParamsIllegalWithoutType
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK share:SSDKPlatformTypeWechat parameters:nil onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssert(error.code == 200101);
            terminate();
        }];
    }];
}

- (void)testWeChatSessionShareParamsIllegalWithType
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        for (NSInteger i=0; i<=10; i++)
        {
            NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
            [parameters SSDKSetupShareParamsByText:nil images:nil url:nil title:nil type:i];
            
            [ShareSDK share:SSDKPlatformTypeWechat parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
                
                NSLog(@"IllegalWithType ---------------->:%@",error);
                if (i==10) {
                    terminate();
                }
            }];
        }
    }];
}

- (void)testWeChatSessionShareHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params SSDKSetupShareParamsByText:@"testText"
                                    images:@[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1526463559502&di=f078ab4b4d8ebfb092c76a4bead1bd87&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201805%2F11%2F190556y96ja6qjal9l99ah.jpg"]
                                       url:[NSURL URLWithString:@"www.mob.com"]
                                     title:@"I love u"
                                      type:SSDKContentTypeImage];
        for (NSInteger i=0; i<10 ; i++)
        {
            [ShareSDK share:SSDKPlatformTypeWechat parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
                
                NSLog(@"%s ---------------->:%@",__func__,error);
                
                XCTAssert(!error || error.code == 200300);
                if (i==9) {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - 微信授权

- (void)testWechatAuth
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeWechat settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWechatGetUserinfoUnAuthed
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeWechat result:^(NSError *error) {
            
            [ShareSDK getUserInfo:SSDKPlatformTypeWechat onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                NSLog(@"%@",user.dictionaryValue);
                XCTAssertNil(error);
                terminate();
            }];
            
        }];
    }];
}

- (void)testWechatAuthHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK authorize:SSDKPlatformTypeWechat settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                NSLog(@"%s ---------------->:%@",__func__,error);
                
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

- (void)testWechatGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK getUserInfo:SSDKPlatformTypeWechat onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                XCTAssertNil(error);
                NSLog(@"%@",user);
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}


#pragma mark - QQ分享

- (void)testQQShareTextWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:nil
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeAuto];
        
        [ShareSDK share:SSDKPlatformTypeQQ parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testQQShareImageWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeQQ parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testQQShareLinkWithCommonParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:[NSURL URLWithString:@"http://www.mob.com"]
                                         title:@"Share SDK"
                                          type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeQQ parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testQQShareAudioWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT""http://www.mob.com"]
                                         title:@"Share SDK"
                                          type:SSDKContentTypeAudio];
        
        [ShareSDK share:SSDKPlatformTypeQQ parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testQQShareVideoWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:[NSURL URLWithString:@"http://www.mob.com"]
                                         title:@"Share SDK"
                                          type:SSDKContentTypeVideo];
        
        [ShareSDK share:SSDKPlatformTypeQQ parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testQZoneShareTextWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:nil
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeAuto];
        
        [ShareSDK share:SSDKPlatformSubTypeQZone parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testQZoneShareImageWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformSubTypeQZone parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testQZoneShareLinkWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:[NSURL URLWithString:@"http://www.mob.com"]
                                         title:@"Share SDK"
                                          type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformSubTypeQZone parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testQZoneShareAudioWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT""http://www.mob.com"]
                                         title:@"Share SDK"
                                          type:SSDKContentTypeAudio];
        
        [ShareSDK share:SSDKPlatformSubTypeQZone parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssert(error.code == 200105);
            terminate();
        }];
    }];
}

- (void)testQZoneShareVideoWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:[NSURL URLWithString:@"http://www.mob.com"]
                                         title:@"Share SDK"
                                          type:SSDKContentTypeVideo];
        
        [ShareSDK share:SSDKPlatformSubTypeQZone parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testQQShareTextWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupQQParamsByText:@"Share SDK"
                                      title:nil
                                        url:nil
                              audioFlashURL:nil
                              videoFlashURL:nil
                                 thumbImage:nil
                                     images:nil
                                       type:SSDKContentTypeText
                         forPlatformSubType:SSDKPlatformSubTypeQQFriend];
        
        [ShareSDK share:SSDKPlatformTypeQQ parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testQQShareImageWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupQQParamsByText:@"Share SDK"
                                      title:nil
                                        url:nil
                              audioFlashURL:nil
                              videoFlashURL:nil
                                 thumbImage:nil
                                     images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       type:SSDKContentTypeImage
                         forPlatformSubType:SSDKPlatformSubTypeQQFriend];
        
        [ShareSDK share:SSDKPlatformTypeQQ parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testQQShareLinkWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupQQParamsByText:@"Share SDK Link Desc"
                                      title:@"Share SDK"
                                        url:[NSURL URLWithString:@"https://www.mob.com"]
                              audioFlashURL:nil
                              videoFlashURL:nil
                                 thumbImage:nil
                                     images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       type:SSDKContentTypeWebPage
                         forPlatformSubType:SSDKPlatformSubTypeQQFriend];
        [ShareSDK share:SSDKPlatformTypeQQ parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testQQShareAudioWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupQQParamsByText:@"Share SDK Link Desc"
                                      title:@"Share SDK"
                                        url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
                              audioFlashURL:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
                              videoFlashURL:nil
                                 thumbImage:nil
                                     images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       type:SSDKContentTypeAudio
                         forPlatformSubType:SSDKPlatformSubTypeQQFriend];
        
        [ShareSDK share:SSDKPlatformTypeQQ parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testQQShareVideoWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupQQParamsByText:@"Share SDK Link Desc"
                                      title:@"Share SDK"
                                        url:[NSURL URLWithString:@"https://www.mob.com"]
                              audioFlashURL:nil
                              videoFlashURL:nil
                                 thumbImage:nil
                                     images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       type:SSDKContentTypeWebPage
                         forPlatformSubType:SSDKPlatformSubTypeQQFriend];
        
        [ShareSDK share:SSDKPlatformTypeQQ parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testQZoneShareTextWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupQQParamsByText:@"Share SDK"
                                      title:nil
                                        url:nil
                              audioFlashURL:nil
                              videoFlashURL:nil
                                 thumbImage:nil
                                     images:nil
                                       type:SSDKContentTypeText
                         forPlatformSubType:SSDKPlatformSubTypeQZone];
        
        [ShareSDK share:SSDKPlatformSubTypeQZone parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testQZoneShareImageWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSString *path1 = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
        NSString *path2 = [[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"];
        NSString *path3 = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
        NSString *path4 = [[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"];
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupQQParamsByText:@"Share SDK"
                                      title:nil
                                        url:nil
                              audioFlashURL:nil
                              videoFlashURL:nil
                                 thumbImage:nil
                                     images:@[path1,path2,path3,path4]
                                       type:SSDKContentTypeImage
                         forPlatformSubType:SSDKPlatformSubTypeQZone];
        [ShareSDK share:SSDKPlatformSubTypeQZone parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testQZoneShareLinkWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupQQParamsByText:@"Share SDK Link Desc"
                                      title:@"Share SDK"
                                        url:[NSURL URLWithString:@"https://www.mob.com"]
                              audioFlashURL:nil
                              videoFlashURL:nil
                                 thumbImage:nil
                                     images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       type:SSDKContentTypeWebPage
                         forPlatformSubType:SSDKPlatformSubTypeQZone];
        [ShareSDK share:SSDKPlatformSubTypeQZone parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testQZoneShareAudioWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupQQParamsByText:nil
                                      title:@"cat"
                                        url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT""http://www.mob.com"]
                              audioFlashURL:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
                              videoFlashURL:nil
                                 thumbImage:nil
                                     images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       type:SSDKContentTypeAudio
                         forPlatformSubType:SSDKPlatformSubTypeQZone];
        
        [ShareSDK share:SSDKPlatformSubTypeQZone parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssert(error.code == 200105);
            terminate();
        }];
    }];
}

- (void)testQZoneShareVideoWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
        NSURL *url = [NSURL URLWithString:path];
        ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
        [assetsLibrary writeVideoAtPathToSavedPhotosAlbum:url completionBlock:^(NSURL *assetURL, NSError *error) {
            
            NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
            //通用参数设置
            [parameters SSDKSetupQQParamsByText:nil
                                          title:@"cat"
                                            url:assetURL
                                  audioFlashURL:nil
                                  videoFlashURL:nil
                                     thumbImage:nil
                                         images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           type:SSDKContentTypeVideo
                             forPlatformSubType:SSDKPlatformSubTypeQZone];
            
            [ShareSDK share:SSDKPlatformSubTypeQZone parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
                XCTAssertNil(error);
                terminate();
            }];
        }];
    }];
}

- (void)testQQShareParamsIllegalWithoutType
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK share:SSDKPlatformTypeQQ parameters:nil onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssert(error.code == 200101);
            terminate();
        }];
    }];
}

- (void)testQQShareParamsIllegalWithType
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        for (NSInteger i=0; i<=10; i++)
        {
            NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
            [parameters SSDKSetupShareParamsByText:nil images:nil url:nil title:nil type:i];
            
            [ShareSDK share:SSDKPlatformTypeQQ parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
                
                NSLog(@"IllegalWithType ---------------->:%@",error);
                if (i==10) {
                    terminate();
                }
            }];
        }
    }];
}

- (void)testQQShareHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params SSDKSetupShareParamsByText:@"testText"
                                    images:@[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1526463559502&di=f078ab4b4d8ebfb092c76a4bead1bd87&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201805%2F11%2F190556y96ja6qjal9l99ah.jpg"]
                                       url:[NSURL URLWithString:@"www.mob.com"]
                                     title:@"I love u"
                                      type:SSDKContentTypeImage];
        for (NSInteger i=0; i<10 ; i++)
        {
            [ShareSDK share:SSDKPlatformTypeQQ parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
                
                NSLog(@" ---------------->:%zd",error.code);
                
                XCTAssert(!error || error.code == 200300);
                if (i==9) {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - QQ授权

- (void)testQQAuth
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeQQ settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testQQGetUserinfoUnAuthed
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeQQ result:^(NSError *error) {
            
            [ShareSDK getUserInfo:SSDKPlatformTypeQQ onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                NSLog(@"%@",user.dictionaryValue);
                XCTAssertNil(error);
                terminate();
            }];
            
        }];
    }];
}

- (void)testQQAuthHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        __block NSInteger tmp = 0;
        
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK authorize:SSDKPlatformTypeQQ settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                NSLog(@"%s ---------------->:%@",__func__,error);
                
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

- (void)testQQGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK getUserInfo:SSDKPlatformTypeQQ onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                XCTAssertNil(error);
                NSLog(@"%@",user.dictionaryValue);
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - Twitter 分享

- (void)testTwitterShareTextWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:[NSString stringWithFormat:@"Share SDK %0.0f",[[NSDate date] timeIntervalSince1970]]
                                        images:nil
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeText];
        
        [ShareSDK share:SSDKPlatformTypeTwitter parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testTwitterShareImagesWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSString *path1 = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
        NSString *path2 = [[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"];
        NSString *path3 = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:@[path1,path2,path3]
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeImage];
        
        [ShareSDK share:SSDKPlatformTypeTwitter parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testTwitterShareGifWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSString *path4 = [[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"];
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:path4
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeImage];
        
        [ShareSDK share:SSDKPlatformTypeTwitter parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testTwitterShareGifAndImageWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //图片最多4张 GIF只能1张
        NSString *path1 = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
        NSString *path2 = [[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"];
        NSString *path3 = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
        NSString *path4 = [[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:@[path1,path2,path3,path4]
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeImage];
        
        [ShareSDK share:SSDKPlatformTypeTwitter parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssert(error.code == 200302);
            terminate();
        }];
    }];
}

- (void)testTwitterShareVideoWithCommonParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:nil
                                           url:[NSURL fileURLWithPath:filePath]
                                         title:nil
                                          type:SSDKContentTypeVideo];
        
        [ShareSDK share:SSDKPlatformTypeTwitter parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            
            if (state != SSDKResponseStateUpload)
            {
                XCTAssert(state == SSDKResponseStateSuccess);
                terminate();
            }
            
        }];
    }];
}

- (void)testTwitterShareVideoAndCancelWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:nil
                                           url:[NSURL fileURLWithPath:filePath]
                                         title:nil
                                          type:SSDKContentTypeVideo];
        
        SSDKSession *session = [ShareSDK share:SSDKPlatformTypeTwitter parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            if (state != SSDKResponseStateUpload)
            {
                XCTAssert(state == SSDKResponseStateCancel);
                terminate();
            }
            
        }];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [session cancel];
        });
    }];
}

- (void)testTwitterShareTextWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        NSString *text = [NSString stringWithFormat:@"Share SDK %0.0f",[[NSDate date] timeIntervalSince1970]];
        [parameters SSDKSetupTwitterParamsByText:text images:nil video:nil latitude:0 longitude:0 type:SSDKContentTypeAuto];
        
        [ShareSDK share:SSDKPlatformTypeTwitter parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testTwitterShareImagesWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSString *path1 = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
        NSString *path2 = [[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"];
        NSString *path3 = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupTwitterParamsByText:@"ShareSDK" images:@[path1,path2,path3] video:nil latitude:0 longitude:0 type:SSDKContentTypeAuto];
        
        [ShareSDK share:SSDKPlatformTypeTwitter parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testTwitterShareGifWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSString *path4 = [[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"];
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupTwitterParamsByText:@"ShareSDK" images:path4 video:nil latitude:0 longitude:0 type:SSDKContentTypeAuto];
        
        [ShareSDK share:SSDKPlatformTypeTwitter parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testTwitterShareVideoWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
        
        [parameters SSDKSetupTwitterParamsByText:@"ShareSDK" images:nil video:[NSURL URLWithString:filePath] latitude:0 longitude:0 type:SSDKContentTypeAuto];
        
        [ShareSDK share:SSDKPlatformTypeTwitter parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testTwitterShareParamsIllegalWithoutType
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK share:SSDKPlatformTypeTwitter parameters:nil onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssert(error.code == 200101);
            terminate();
        }];
    }];
}

- (void)testTwitterShareParamsIllegalWithType
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        for (NSInteger i=0; i<=10; i++)
        {
            NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
            [parameters SSDKSetupShareParamsByText:nil images:nil url:nil title:nil type:i];
            
            [ShareSDK share:SSDKPlatformTypeTwitter parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
                
                NSLog(@"IllegalWithType ---------------->:%@",error);
                if (i==10) {
                    terminate();
                }
            }];
        }
    }];
}

- (void)testTwitterShareHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params SSDKSetupShareParamsByText:@"testText"
                                    images:@[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1526463559502&di=f078ab4b4d8ebfb092c76a4bead1bd87&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201805%2F11%2F190556y96ja6qjal9l99ah.jpg"]
                                       url:[NSURL URLWithString:@"www.mob.com"]
                                     title:@"I love u"
                                      type:SSDKContentTypeImage];
        for (NSInteger i=0; i<10 ; i++)
        {
            [ShareSDK share:SSDKPlatformTypeTwitter parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
                
                NSLog(@" ---------------->:%zd",error.code);
                
                XCTAssert(!error || error.code == 200300);
                if (i==9) {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - Twitter Auth

- (void)testTwitterAuth
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeTwitter settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testTwitterGetUserinfoUnAuthed
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeTwitter result:^(NSError *error) {
            
            [ShareSDK getUserInfo:SSDKPlatformTypeTwitter onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                NSLog(@"%@",user.dictionaryValue);
                XCTAssertNil(error);
                terminate();
            }];
            
        }];
    }];
}

- (void)testTwitterAuthHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK authorize:SSDKPlatformTypeTwitter settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                NSLog(@"%s ---------------->:%@",__func__,error);
                
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

- (void)testTwitterGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK getUserInfo:SSDKPlatformTypeTwitter onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                XCTAssertNil(error);
                NSLog(@"%@",user.dictionaryValue);
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - 支付宝

- (void)testAliSocialSessionShareTextWithCommonParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:nil
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeAuto];
        
        [ShareSDK share:SSDKPlatformTypeAliSocial parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testAliSocialSessionShareImageWithCommonParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:nil
                                        images:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"//[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeAuto];
        
        [ShareSDK share:SSDKPlatformTypeAliSocial parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testAliSocialSessionShareWebPageWithCommonParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:[NSURL URLWithString:@"https://www.mob.com"]
                                         title:@"Share SDK"
                                          type:SSDKContentTypeWebPage];
        
        [ShareSDK share:SSDKPlatformTypeAliSocial parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testAliSocialSessionShareTextWithCustomParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        
        [parameters SSDKSetupAliSocialParamsByText:@"Share SDK"
                                             image:nil
                                             title:nil
                                               url:nil
                                              type:SSDKContentTypeAuto
                                      platformType:SSDKPlatformTypeAliSocial];
        
        [ShareSDK share:SSDKPlatformTypeAliSocial parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testAliSocialSessionShareImageWithCustomParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        
        [parameters SSDKSetupAliSocialParamsByText:nil
                                             image:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
                                             title:nil
                                               url:nil
                                              type:SSDKContentTypeAuto
                                      platformType:SSDKPlatformTypeAliSocial];
        
        [ShareSDK share:SSDKPlatformTypeAliSocial parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testAliSocialSessionShareWebPageWithCustomParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        
        [parameters SSDKSetupAliSocialParamsByText:@"Share SDK"
                                             image:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
                                             title:@"Share SDK"
                                               url:[NSURL URLWithString:@"https://www.mob.com"]
                                              type:SSDKContentTypeWebPage
                                      platformType:SSDKPlatformTypeAliSocial];
        
        [ShareSDK share:SSDKPlatformTypeAliSocial parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testAliSocialTimelineShareTextWithCommonParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:nil
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeAuto];
        
        [ShareSDK share:SSDKPlatformTypeAliSocialTimeline parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssert(error.code == 200102);
            terminate();
        }];
    }];
}

- (void)testAliSocialTimelineShareImageWithCommonParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:nil
                                        images:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"//[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeAuto];
        
        [ShareSDK share:SSDKPlatformTypeAliSocialTimeline parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testAliSocialTimelineShareWebPageWithCommonParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:[NSURL URLWithString:@"https://www.mob.com"]
                                         title:@"Share SDK"
                                          type:SSDKContentTypeWebPage];
        
        [ShareSDK share:SSDKPlatformTypeAliSocialTimeline parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testAliSocialTimelineShareTextWithCustomParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        
        [parameters SSDKSetupAliSocialParamsByText:@"Share SDK"
                                             image:nil
                                             title:nil
                                               url:nil
                                              type:SSDKContentTypeAuto
                                      platformType:SSDKPlatformTypeAliSocialTimeline];
        
        [ShareSDK share:SSDKPlatformTypeAliSocialTimeline parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssert(error.code == 200102);
            terminate();
        }];
    }];
}

- (void)testAliSocialTimelineShareImageWithCustomParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        
        [parameters SSDKSetupAliSocialParamsByText:nil
                                             image:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
                                             title:nil
                                               url:nil
                                              type:SSDKContentTypeAuto
                                      platformType:SSDKPlatformTypeAliSocialTimeline];
        
        [ShareSDK share:SSDKPlatformTypeAliSocialTimeline parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testAliSocialTimelineShareWebPageWithCustomParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        
        [parameters SSDKSetupAliSocialParamsByText:@"Share SDK"
                                             image:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
                                             title:@"Share SDK"
                                               url:[NSURL URLWithString:@"https://www.mob.com"]
                                              type:SSDKContentTypeWebPage
                                      platformType:SSDKPlatformTypeAliSocialTimeline];
        
        [ShareSDK share:SSDKPlatformTypeAliSocialTimeline parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testAliSocialAuth
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK authorize:SSDKPlatformTypeAliSocial settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssert(error.code == 200105);
            terminate();
        }];
    }];
}

- (void)testAliSocialGetuserInfo
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK getUserInfo:SSDKPlatformTypeAliSocial onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            XCTAssert(error.code == 200105);
            terminate();
        }];
    }];
}

#pragma mark - 新浪微博分享

- (void)testSinaWeiboShareTextWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:nil
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeAuto];
        
        [ShareSDK share:SSDKPlatformTypeSinaWeibo parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testSinaWeiboShareImageWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeSinaWeibo parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testSinaWeiboShareLinkWithCommonParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:[NSURL URLWithString:@"http://www.mob.com"]
                                         title:@"MOB"
                                          type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformTypeSinaWeibo parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testSinaWeiboShareTextWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupSinaWeiboShareParamsByText:@"Share SDK"
                                                  title:nil
                                                 images:nil
                                                  video:nil
                                                    url:nil
                                               latitude:0
                                              longitude:0
                                               objectID:0
                                         isShareToStory:NO
                                                   type:SSDKContentTypeText];
        
        [ShareSDK share:SSDKPlatformTypeSinaWeibo parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testSinaWeiboShareImageWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupSinaWeiboShareParamsByText:@"Share SDK"
                                                  title:nil
                                                 images:@[[UIImage imageNamed:@"COD13.jpg"],[UIImage imageNamed:@"D45.jpg"]]
                                                  video:nil
                                                    url:nil
                                               latitude:0
                                              longitude:0
                                               objectID:0
                                         isShareToStory:NO
                                                   type:SSDKContentTypeImage];
        
        [ShareSDK share:SSDKPlatformTypeSinaWeibo parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testSinaWeiboShareLinkWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupSinaWeiboShareParamsByText:@"Share SDK Link Desc"
                                                  title:@"MOB"
                                                 images:[UIImage imageNamed:@"COD13.jpg"]
                                                  video:nil
                                                    url:[NSURL URLWithString:@"http://www.mob.com"]
                                               latitude:0
                                              longitude:0
                                               objectID:0
                                         isShareToStory:NO
                                                   type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformTypeSinaWeibo parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testSinaWeiboShareVideoWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
        //通用参数设置
        [parameters SSDKSetupSinaWeiboShareParamsByText:@"ShareSDK"
                                                  title:nil
                                                 images:nil
                                                  video:videoPath
                                                    url:nil
                                               latitude:0
                                              longitude:0
                                               objectID:nil
                                         isShareToStory:NO
                                                   type:SSDKContentTypeVideo];
        
        [ShareSDK share:SSDKPlatformTypeSinaWeibo parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testSinaWeiboShareParamsIllegalWithoutType
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK share:SSDKPlatformTypeSinaWeibo parameters:nil onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssert(error.code == 200101);
            terminate();
        }];
    }];
}

- (void)testSinaWeiboShareParamsIllegalWithType
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        for (NSInteger i=0; i<=10; i++)
        {
            NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
            [parameters SSDKSetupShareParamsByText:nil images:nil url:nil title:nil type:i];
            
            [ShareSDK share:SSDKPlatformTypeSinaWeibo parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
                
                NSLog(@"IllegalWithType ---------------->:%@",error);
                if (i==10) {
                    terminate();
                }
            }];
        }
    }];
}

- (void)testSinaWeiboShareHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params SSDKSetupShareParamsByText:@"testText"
                                    images:@[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1526463559502&di=f078ab4b4d8ebfb092c76a4bead1bd87&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201805%2F11%2F190556y96ja6qjal9l99ah.jpg"]
                                       url:[NSURL URLWithString:@"www.mob.com"]
                                     title:@"I love u"
                                      type:SSDKContentTypeImage];
        for (NSInteger i=0; i<10 ; i++)
        {
            [ShareSDK share:SSDKPlatformTypeSinaWeibo parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
                
                NSLog(@" ---------------->:%zd",error.code);
                
                XCTAssert(!error || error.code == 200300);
                if (i==9) {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - 新浪微博授权

- (void)testSinaWeiboAuth
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeSinaWeibo settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testSinaWeiboGetUserinfoUnAuthed
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeSinaWeibo result:^(NSError *error) {
            
            [ShareSDK getUserInfo:SSDKPlatformTypeSinaWeibo onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                NSLog(@"%@",user.dictionaryValue);
                XCTAssertNil(error);
                terminate();
            }];
            
        }];
    }];
}

- (void)testSinaWeiboAuthHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        __block int num = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK authorize:SSDKPlatformTypeSinaWeibo settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                NSLog(@"%s ---------------->:%@",__func__,error);
                
                if (++num == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

- (void)testSinaWeiboGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK getUserInfo:SSDKPlatformTypeSinaWeibo onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                XCTAssertNil(error);
                NSLog(@"%@",user);
                if (i == 9)
                {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - Pinterst

- (void)testPinterestShareImageWithCommonParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
                                           url:[NSURL URLWithString:@"http://www.mob.com"]
                                         title:nil
                                          type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypePinterest parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testPinterestShareImageWithCustomParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupPinterestParamsByImage:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"] desc:@"test" url:[NSURL URLWithString:@"http://www.mob.com"] boardName:nil];
        [ShareSDK share:SSDKPlatformTypePinterest parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testPinterestShareParamsIllegal
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK share:SSDKPlatformTypePinterest parameters:nil onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssert(error.code == 200101);
            terminate();
        }];
    }];
}

- (void)testPinterestAuth
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypePinterest settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testPinterestGetUserinfo
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        [ShareSDK getUserInfo:SSDKPlatformTypePinterest onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

#pragma mark - 易信分享

- (void)testYixinSessionShareTextWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"Share Text" images:nil url:nil title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeYiXin parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinFavShareTextWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"Share Text" images:nil url:nil title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformSubTypeYiXinFav parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinTimelineShareTextWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"Share Text" images:nil url:nil title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformSubTypeYiXinTimeline parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinSessionShareTextWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                         title:nil
                                           url:nil
                                    thumbImage:nil
                                         image:nil
                                  musicFileURL:nil
                                       extInfo:nil
                                      fileData:nil
                                       comment:nil
                                      toUserId:nil
                                          type:SSDKContentTypeText
                            forPlatformSubType:SSDKPlatformSubTypeYiXinSession];
        [ShareSDK share:SSDKPlatformTypeYiXin parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinFavShareTextWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                         title:nil
                                           url:nil
                                    thumbImage:nil
                                         image:nil
                                  musicFileURL:nil
                                       extInfo:nil
                                      fileData:nil
                                       comment:nil
                                      toUserId:nil
                                          type:SSDKContentTypeText
                            forPlatformSubType:SSDKPlatformSubTypeYiXinFav];
        [ShareSDK share:SSDKPlatformSubTypeYiXinFav parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinTimelineShareTextWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                         title:nil
                                           url:nil
                                    thumbImage:nil
                                         image:nil
                                  musicFileURL:nil
                                       extInfo:nil
                                      fileData:nil
                                       comment:nil
                                      toUserId:nil
                                          type:SSDKContentTypeText
                            forPlatformSubType:SSDKPlatformSubTypeYiXinTimeline];
        [ShareSDK share:SSDKPlatformSubTypeYiXinTimeline parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinSessionShareImageWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:nil images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg" url:nil title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeYiXin parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinFavShareImageWithCommonParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:nil images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg" url:nil title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformSubTypeYiXinFav parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinTimelineShareImageWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"ShareSDK" images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg" url:nil title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformSubTypeYiXinTimeline parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinSessionShareImageWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                         title:nil
                                           url:nil
                                    thumbImage:nil
                                         image:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg"
                                  musicFileURL:nil
                                       extInfo:nil
                                      fileData:nil
                                       comment:nil
                                      toUserId:nil
                                          type:SSDKContentTypeImage
                            forPlatformSubType:SSDKPlatformSubTypeYiXinSession];
        [ShareSDK share:SSDKPlatformTypeYiXin parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinFavShareImageWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                         title:nil
                                           url:nil
                                    thumbImage:nil
                                         image:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg"
                                  musicFileURL:nil
                                       extInfo:nil
                                      fileData:nil
                                       comment:nil
                                      toUserId:nil
                                          type:SSDKContentTypeImage
                            forPlatformSubType:SSDKPlatformSubTypeYiXinFav];
        [ShareSDK share:SSDKPlatformSubTypeYiXinFav parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinTimelineShareImageWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                         title:nil
                                           url:nil
                                    thumbImage:nil
                                         image:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg"
                                  musicFileURL:nil
                                       extInfo:nil
                                      fileData:nil
                                       comment:nil
                                      toUserId:nil
                                          type:SSDKContentTypeImage
                            forPlatformSubType:SSDKPlatformSubTypeYiXinTimeline];
        [ShareSDK share:SSDKPlatformSubTypeYiXinTimeline parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinSessionShareLinkWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"Share SDK" images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg" url:[NSURL URLWithString:@"https://www.mob.com"] title:@"title" type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformTypeYiXin parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinFavShareLinkWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"Share SDK" images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg" url:[NSURL URLWithString:@"https://www.mob.com"] title:@"title" type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformSubTypeYiXinFav parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinTimelineShareLinkWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"Share SDK" images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg" url:[NSURL URLWithString:@"https://www.mob.com"] title:@"title" type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformSubTypeYiXinTimeline parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinSessionShareLinkWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                         title:@"Share SDK title"
                                           url:[NSURL URLWithString:@"https://www.mob.com"]
                                    thumbImage:nil
                                         image:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg"
                                  musicFileURL:nil
                                       extInfo:nil
                                      fileData:nil
                                       comment:nil
                                      toUserId:nil
                                          type:SSDKContentTypeWebPage
                            forPlatformSubType:SSDKPlatformSubTypeYiXinSession];
        [ShareSDK share:SSDKPlatformTypeYiXin parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinFavShareLinkWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                         title:@"Share SDK title"
                                           url:[NSURL URLWithString:@"https://www.mob.com"]
                                    thumbImage:nil
                                         image:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg"
                                  musicFileURL:nil
                                       extInfo:nil
                                      fileData:nil
                                       comment:nil
                                      toUserId:nil
                                          type:SSDKContentTypeWebPage
                            forPlatformSubType:SSDKPlatformSubTypeYiXinFav];
        [ShareSDK share:SSDKPlatformSubTypeYiXinFav parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinTimelineShareLinkWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                         title:@"Share SDK title"
                                           url:[NSURL URLWithString:@"https://www.mob.com"]
                                    thumbImage:nil
                                         image:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg"
                                  musicFileURL:nil
                                       extInfo:nil
                                      fileData:nil
                                       comment:nil
                                      toUserId:nil
                                          type:SSDKContentTypeWebPage
                            forPlatformSubType:SSDKPlatformSubTypeYiXinTimeline];
        [ShareSDK share:SSDKPlatformSubTypeYiXinTimeline parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinSessionShareAudioWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"Share SDK" images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg" url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"] title:@"title" type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeYiXin parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinFavShareAudioWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"Share SDK" images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg" url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"] title:@"title" type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformSubTypeYiXinFav parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinTimelineShareAudioWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"Share SDK" images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg" url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"] title:@"title" type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformSubTypeYiXinTimeline parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinSessionShareAudioWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                         title:@"Share SDK"
                                           url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
                                    thumbImage:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
                                         image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                  musicFileURL:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
                                       extInfo:nil
                                      fileData:nil
                                       comment:nil
                                      toUserId:nil
                                          type:SSDKContentTypeAudio
                            forPlatformSubType:SSDKPlatformSubTypeYiXinSession];
        [ShareSDK share:SSDKPlatformTypeYiXin parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinFavShareAudioWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                         title:@"Share SDK"
                                           url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
                                    thumbImage:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
                                         image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                  musicFileURL:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
                                       extInfo:nil
                                      fileData:nil
                                       comment:nil
                                      toUserId:nil
                                          type:SSDKContentTypeAudio
                            forPlatformSubType:SSDKPlatformSubTypeYiXinFav];
        [ShareSDK share:SSDKPlatformSubTypeYiXinFav parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinTimelineShareAudioWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                         title:@"Share SDK"
                                           url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
                                    thumbImage:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
                                         image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                  musicFileURL:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
                                       extInfo:nil
                                      fileData:nil
                                       comment:nil
                                      toUserId:nil
                                          type:SSDKContentTypeAudio
                            forPlatformSubType:SSDKPlatformSubTypeYiXinTimeline];
        [ShareSDK share:SSDKPlatformSubTypeYiXinTimeline parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinSessionShareVideoWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"Share SDK" images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg" url:[NSURL URLWithString:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html"] title:@"title" type:SSDKContentTypeVideo];
        [ShareSDK share:SSDKPlatformTypeYiXin parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinFavShareVideoWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"Share SDK" images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg" url:[NSURL URLWithString:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html"] title:@"title" type:SSDKContentTypeVideo];
        [ShareSDK share:SSDKPlatformSubTypeYiXinFav parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinTimelineShareVideoWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"Share SDK" images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg" url:[NSURL URLWithString:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html"] title:@"title" type:SSDKContentTypeVideo];
        [ShareSDK share:SSDKPlatformSubTypeYiXinTimeline parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinSessionShareVideoWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                         title:@"Share SDK"
                                           url:[NSURL URLWithString:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html"]
                                    thumbImage:nil
                                         image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                  musicFileURL:nil
                                       extInfo:nil
                                      fileData:nil
                                       comment:nil
                                      toUserId:nil
                                          type:SSDKContentTypeVideo
                            forPlatformSubType:SSDKPlatformSubTypeYiXinSession];
        [ShareSDK share:SSDKPlatformTypeYiXin parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinFavShareVideoWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                         title:@"Share SDK"
                                           url:[NSURL URLWithString:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html"]
                                    thumbImage:nil
                                         image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                  musicFileURL:nil
                                       extInfo:nil
                                      fileData:nil
                                       comment:nil
                                      toUserId:nil
                                          type:SSDKContentTypeVideo
                            forPlatformSubType:SSDKPlatformSubTypeYiXinFav];
        [ShareSDK share:SSDKPlatformSubTypeYiXinFav parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
           XCTAssert(error.code == 200101 || !error);
            terminate();
        }];
    }];
}

- (void)testYixinTimelineShareVideoWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                         title:@"Share SDK"
                                           url:[NSURL URLWithString:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html"]
                                    thumbImage:nil
                                         image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                  musicFileURL:nil
                                       extInfo:nil
                                      fileData:nil
                                       comment:nil
                                      toUserId:nil
                                          type:SSDKContentTypeVideo
                            forPlatformSubType:SSDKPlatformSubTypeYiXinTimeline];
        [ShareSDK share:SSDKPlatformSubTypeYiXinTimeline parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssert(error.code == 200101 || !error);
            terminate();
        }];
    }];
}

- (void)testYixinSessionShareAppWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"Share SDK" images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg" url:[NSURL URLWithString:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html"] title:@"title" type:SSDKContentTypeApp];
        [ShareSDK share:SSDKPlatformTypeYiXin parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssert(error.code == 200101 || !error);
            terminate();
        }];
    }];
}

- (void)testYixinFavShareAppWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"Share SDK" images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg" url:[NSURL URLWithString:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html"] title:@"title" type:SSDKContentTypeApp];
        [ShareSDK share:SSDKPlatformSubTypeYiXinFav parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssert(error.code == 200101);
            terminate();
        }];
    }];
}

- (void)testYixinTimelineShareAppWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"Share SDK" images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg" url:[NSURL URLWithString:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html"] title:@"title" type:SSDKContentTypeApp];
        [ShareSDK share:SSDKPlatformSubTypeYiXinTimeline parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
           XCTAssert(error.code == 200101 || !error);
            terminate();
        }];
    }];
}

- (void)testYixinSessionShareAppWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                         title:@"App消息"
                                           url:[NSURL URLWithString:@"http://www.mob.com"]
                                    thumbImage:@"http://c.hiphotos.baidu.com/image/h%3D300/sign=4bc239aadda20cf45990f8df46094b0c/9d82d158ccbf6c81924a92c5b13eb13533fa4099.jpg"
                                         image:@"http://c.hiphotos.baidu.com/image/h%3D300/sign=4bc239aadda20cf45990f8df46094b0c/9d82d158ccbf6c81924a92c5b13eb13533fa4099.jpg"
                                  musicFileURL:nil
                                       extInfo:@"1111"
                                      fileData:[@"13232" dataUsingEncoding:NSUTF8StringEncoding]
                                       comment:nil
                                      toUserId:nil
                                          type:SSDKContentTypeApp
                            forPlatformSubType:SSDKPlatformSubTypeYiXinSession];
        [ShareSDK share:SSDKPlatformTypeYiXin parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinFavShareAppWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                         title:@"App消息"
                                           url:[NSURL URLWithString:@"http://www.mob.com"]
                                    thumbImage:nil
                                         image:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg"
                                  musicFileURL:nil
                                       extInfo:@"1111"
                                      fileData:[@"13232" dataUsingEncoding:NSUTF8StringEncoding]
                                       comment:nil
                                      toUserId:nil
                                          type:SSDKContentTypeApp
                            forPlatformSubType:SSDKPlatformSubTypeYiXinFav];
        [ShareSDK share:SSDKPlatformSubTypeYiXinFav parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYixinTimelineShareAppWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                         title:@"App消息"
                                           url:[NSURL URLWithString:@"http://www.mob.com"]
                                    thumbImage:nil
                                         image:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg"
                                  musicFileURL:nil
                                       extInfo:@"1111"
                                      fileData:[@"13232" dataUsingEncoding:NSUTF8StringEncoding]
                                       comment:nil
                                      toUserId:nil
                                          type:SSDKContentTypeApp
                            forPlatformSubType:SSDKPlatformSubTypeYiXinTimeline];
        [ShareSDK share:SSDKPlatformSubTypeYiXinTimeline parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

#pragma mark - 易信授权

- (void)testEasychatAuth
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeYiXin settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testEasychatGetUserinfoUnAuthed
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeYiXin result:^(NSError *error) {
            
            [ShareSDK getUserInfo:SSDKPlatformTypeYiXin onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                NSLog(@"%@",user.dictionaryValue);
                XCTAssertNil(error);
                terminate();
            }];
        }];
    }];
}

- (void)testEasychatAuthHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK authorize:SSDKPlatformTypeYiXin settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                NSLog(@"%s ---------------->:%@",__func__,error);
                
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

- (void)testEasychatGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK getUserInfo:SSDKPlatformTypeYiXin onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                XCTAssertNil(error);
                NSLog(@"%@",user.dictionaryValue);
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - Flickr

//vanusyi@yahoo.com vanusyi sharesdk.cn
- (void)testFlickrShareImageWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeText];
        
        [ShareSDK share:SSDKPlatformTypeFlickr parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testFlickrAuth
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeFlickr settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testFlickrGetUserinfoUnAuthed
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeFlickr result:^(NSError *error) {
            
            [ShareSDK getUserInfo:SSDKPlatformTypeFlickr onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                NSLog(@"%@",user.dictionaryValue);
                terminate();
            }];
        }];
    }];
}

- (void)testFlickrAuthHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK authorize:SSDKPlatformTypeFlickr settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                NSLog(@"%s ---------------->:%@",__func__,error);
                
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

- (void)testFlickrGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK getUserInfo:SSDKPlatformTypeFlickr onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                XCTAssertNil(error);
                NSLog(@"%@",user.dictionaryValue);
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - 印象笔记

- (void)testYinXiangShareTextWithCommonParams
{
    [self _wait:30 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupShareParamsByText:@"123123" images:nil url:nil title:@"必填" type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeYinXiang parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testEvernoteShareTextWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupShareParamsByText:@"123123" images:nil url:nil title:@"必填" type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeEvernote parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYinXiangShareTextWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupEvernoteParamsByText:@"Share SDK"
                                       images:nil
                                        video:nil
                                        title:@"Share SDK"
                                     notebook:nil
                                         tags:nil
                                 platformType:SSDKPlatformTypeYinXiang];
        [ShareSDK share:SSDKPlatformTypeYinXiang parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testEvernoteShareTextWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupEvernoteParamsByText:@"Share SDK"
                                       images:nil
                                        video:nil
                                        title:@"Share SDK"
                                     notebook:nil
                                         tags:nil
                                 platformType:SSDKPlatformTypeEvernote];
        [ShareSDK share:SSDKPlatformTypeEvernote parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYinXiangShareImageWithCommonParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupShareParamsByText:@"123123" images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"] url:nil title:@"必填" type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeYinXiang parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testEvernoteShareImageWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupShareParamsByText:@"123123" images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"] url:nil title:@"必填" type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeEvernote parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYinXiangShareImageWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupEvernoteParamsByText:@"Share SDK"
                                       images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                        video:nil
                                        title:@"Share SDK"
                                     notebook:nil
                                         tags:nil
                                 platformType:SSDKPlatformTypeYinXiang];
        [ShareSDK share:SSDKPlatformTypeYinXiang parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testEvernoteShareImageWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupEvernoteParamsByText:@"Share SDK"
                                       images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                        video:nil
                                        title:@"Share SDK"
                                     notebook:nil
                                         tags:nil
                                 platformType:SSDKPlatformTypeEvernote];
        [ShareSDK share:SSDKPlatformTypeEvernote parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYinXiangShareVideoWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupShareParamsByText:@"123123" images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"] url:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]] title:@"必填" type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeYinXiang parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testEvernoteShareVideoWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupShareParamsByText:@"123123" images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"] url:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]] title:@"必填" type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeEvernote parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYinXiangShareVideoWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupEvernoteParamsByText:@"Share SDK"
                                       images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                        video:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                        title:@"Share SDK"
                                     notebook:nil
                                         tags:nil
                                 platformType:SSDKPlatformTypeYinXiang];
        [ShareSDK share:SSDKPlatformTypeYinXiang parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testEvernoteShareVideoWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupEvernoteParamsByText:@"Share SDK"
                                       images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                        video:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                        title:@"Share SDK"
                                     notebook:nil
                                         tags:nil
                                 platformType:SSDKPlatformTypeEvernote];
        [ShareSDK share:SSDKPlatformTypeEvernote parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testEvernoteAuth
{
    [self _wait:30 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeEvernote settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testEvernoteGetUserinfoUnAuthed
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeEvernote result:^(NSError *error) {
            
            [ShareSDK getUserInfo:SSDKPlatformTypeEvernote onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                NSLog(@"%@",user.dictionaryValue);
                terminate();
            }];
            
        }];
    }];
}

- (void)testEvernoteAuthHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK authorize:SSDKPlatformTypeEvernote settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                NSLog(@"%s ---------------->:%@",__func__,error);
                
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

- (void)testEvernoteGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK getUserInfo:SSDKPlatformTypeEvernote onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                XCTAssertNil(error);
                NSLog(@"%@",user);
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - Google Plus

- (void)testGooglePlusShareTextWithCommonParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupShareParamsByText:@"Share SDK" images:nil url:nil title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeGooglePlus parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testGooglePlusShareTextWithCustomParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupGooglePlusParamsByText:@"Share SDK"
                                            url:nil
                                           type:SSDKContentTypeText];
        [ShareSDK share:SSDKPlatformTypeGooglePlus parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testGooglePlusShareWebWithCommonParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupShareParamsByText:@"Share SDK" images:nil url:[NSURL URLWithString:@"http://sharesdk.mob.com/"] title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeGooglePlus parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testGooglePlusShareWebWithCustomParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupGooglePlusParamsByText:@"Share SDK"
                                            url:[NSURL URLWithString:@"http://sharesdk.mob.com/"]
                                           type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformTypeGooglePlus parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testGooglePlusAuth
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeGooglePlus settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testGooglePlusGetUserinfoUnAuthed
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeGooglePlus result:^(NSError *error) {
            
            [ShareSDK getUserInfo:SSDKPlatformTypeGooglePlus onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                NSLog(@"%@",user.dictionaryValue);
                XCTAssertNil(error);
                terminate();
            }];
            
        }];
    }];
}

- (void)testGooglePlusAuthHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK authorize:SSDKPlatformTypeGooglePlus settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                NSLog(@"%s ---------------->:%@",__func__,error);
                
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

- (void)testGooglePlusGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
         __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK getUserInfo:SSDKPlatformTypeGooglePlus onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
//                XCTAssertNil(error);
                NSLog(@"%@",user);
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - Kakao

- (void)testKakaoTalkShareTextWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupShareParamsByText:@"ssssssssss" images:nil url:nil title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeKakao parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssert(error.code == 11);
            terminate();
        }];
    }];
}

- (void)testKakaoStoryShareTextWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupShareParamsByText:@"ssssssssss" images:nil url:nil title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformSubTypeKakaoStory parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testKakaoTalkShareTextWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupKaKaoParamsByText:@"Share SDK"
                                    images:nil
                                     title:nil
                                       url:nil
                                permission:nil
                               enableShare:YES
                                 imageSize:CGSizeZero
                            appButtonTitle:nil
                          androidExecParam:nil
                          androidMarkParam:nil
                          iphoneExecParams:nil
                           iphoneMarkParam:nil
                            ipadExecParams:nil
                             ipadMarkParam:nil
                                      type:SSDKContentTypeText
                           forPlatformSubType:SSDKPlatformTypeKakao];
        [ShareSDK share:SSDKPlatformTypeKakao parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssert(error.code == 11);
            terminate();
        }];
    }];
}

- (void)testKakaoStoryShareTextWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupKaKaoParamsByText:@"Share SDK"
                                    images:nil
                                     title:nil
                                       url:nil
                                permission:nil
                               enableShare:YES
                                 imageSize:CGSizeZero
                            appButtonTitle:nil
                          androidExecParam:nil
                          androidMarkParam:nil
                          iphoneExecParams:nil
                           iphoneMarkParam:nil
                            ipadExecParams:nil
                             ipadMarkParam:nil
                                      type:SSDKContentTypeText
                           forPlatformSubType:SSDKPlatformSubTypeKakaoStory];
        [ShareSDK share:SSDKPlatformSubTypeKakaoStory parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testKakaoTalkShareImageWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupShareParamsByText:@"ssssssssss" images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg" url:nil title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeKakao parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssert(error.code == 11);
            terminate();
        }];
    }];
}

- (void)testKakaoStoryShareImageWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupShareParamsByText:@"ssssssssss" images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg" url:nil title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformSubTypeKakaoStory parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testKakaoTalkShareImageWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupKaKaoParamsByText:@"Share SDK"
                                    images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg"
                                     title:nil
                                       url:nil
                                permission:nil
                               enableShare:YES
                                 imageSize:CGSizeZero
                            appButtonTitle:nil
                          androidExecParam:nil
                          androidMarkParam:nil
                          iphoneExecParams:nil
                           iphoneMarkParam:nil
                            ipadExecParams:nil
                             ipadMarkParam:nil
                                      type:SSDKContentTypeImage
                           forPlatformSubType:SSDKPlatformTypeKakao];
        [ShareSDK share:SSDKPlatformTypeKakao parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssert(error.code == 11);
            terminate();
        }];
    }];
}

- (void)testKakaoStoryShareImageWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupKaKaoParamsByText:@"Share SDK"
                                    images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg"
                                     title:nil
                                       url:nil
                                permission:nil
                               enableShare:YES
                                 imageSize:CGSizeZero
                            appButtonTitle:nil
                          androidExecParam:nil
                          androidMarkParam:nil
                          iphoneExecParams:nil
                           iphoneMarkParam:nil
                            ipadExecParams:nil
                             ipadMarkParam:nil
                                      type:SSDKContentTypeImage
                           forPlatformSubType:SSDKPlatformSubTypeKakaoStory];
        [ShareSDK share:SSDKPlatformSubTypeKakaoStory parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testKakaoTalkShareWebWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupShareParamsByText:@"ssssssssss" images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg" url:[NSURL URLWithString:@"http://www.mob.com"] title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeKakao parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testKakaoStoryShareWebWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupShareParamsByText:@"ssssssssss" images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg" url:[NSURL URLWithString:@"http://www.mob.com"] title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformSubTypeKakaoStory parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testKakaoTalkShareWebWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupKaKaoParamsByText:@"Share SDK"
                                    images:@"http://www.mob.com/images/logo_black.png"
                                     title:@"Share SDK"
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                permission:nil
                               enableShare:YES
                                 imageSize:CGSizeZero
                            appButtonTitle:nil
                          androidExecParam:nil
                          androidMarkParam:nil
                          iphoneExecParams:nil
                           iphoneMarkParam:nil
                            ipadExecParams:nil
                             ipadMarkParam:nil
                                      type:SSDKContentTypeWebPage
                           forPlatformSubType:SSDKPlatformTypeKakao];
        [ShareSDK share:SSDKPlatformTypeKakao parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssert(error.code == 11);
            terminate();
        }];
    }];
}

- (void)testKakaoStoryShareWebWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupKaKaoParamsByText:@"Share SDK"
                                    images:@"http://www.mob.com/images/logo_black.png"
                                     title:@"Share SDK"
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                permission:nil
                               enableShare:YES
                                 imageSize:CGSizeZero
                            appButtonTitle:nil
                          androidExecParam:nil
                          androidMarkParam:nil
                          iphoneExecParams:nil
                           iphoneMarkParam:nil
                            ipadExecParams:nil
                             ipadMarkParam:nil
                                      type:SSDKContentTypeWebPage
                           forPlatformSubType:SSDKPlatformSubTypeKakaoStory];
        [ShareSDK share:SSDKPlatformSubTypeKakaoStory parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testKakaoTalkShareAppWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupShareParamsByText:@"ssssssssss" images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg" url:[NSURL URLWithString:@"http://www.mob.com"] title:@"appButtonTitle" type:SSDKContentTypeApp];
        [ShareSDK share:SSDKPlatformTypeKakao parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testKakaoStoryShareAppWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupShareParamsByText:@"ssssssssss" images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg" url:[NSURL URLWithString:@"http://www.mob.com"] title:@"appButtonTitle" type:SSDKContentTypeApp];
        [ShareSDK share:SSDKPlatformSubTypeKakaoStory parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testKakaoTalkShareAppWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupKaKaoParamsByText:@"Share SDK"
                                    images:@"http://www.mob.com/images/logo_black.png"
                                     title:@"Share SDK"
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                permission:nil
                               enableShare:YES
                                 imageSize:CGSizeZero
                            appButtonTitle:@"appButtonTitle"
                          androidExecParam:nil
                          androidMarkParam:nil
                          iphoneExecParams:nil
                           iphoneMarkParam:nil
                            ipadExecParams:nil
                             ipadMarkParam:nil
                                      type:SSDKContentTypeApp
                           forPlatformSubType:SSDKPlatformTypeKakao];
        [ShareSDK share:SSDKPlatformTypeKakao parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssert(error.code == 11);
            terminate();
        }];
    }];
}

- (void)testKakaoStoryShareAppWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupKaKaoParamsByText:@"Share SDK"
                                    images:@"http://www.mob.com/images/logo_black.png"
                                     title:@"Share SDK"
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                permission:nil
                               enableShare:YES
                                 imageSize:CGSizeZero
                            appButtonTitle:@"appButtonTitle"
                          androidExecParam:nil
                          androidMarkParam:nil
                          iphoneExecParams:nil
                           iphoneMarkParam:nil
                            ipadExecParams:nil
                             ipadMarkParam:nil
                                      type:SSDKContentTypeApp
                           forPlatformSubType:SSDKPlatformSubTypeKakaoStory];
        [ShareSDK share:SSDKPlatformSubTypeKakaoStory parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testKakaoAuth
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeKakao settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testKakaoGetUserinfoUnAuthed
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeKakao result:^(NSError *error) {
            
            [ShareSDK getUserInfo:SSDKPlatformTypeKakao onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                NSLog(@"%@",user.dictionaryValue);
                XCTAssertNil(error);
                terminate();
            }];
            
        }];
    }];
}

- (void)testKakaoAuthHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK authorize:SSDKPlatformTypeKakao settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                NSLog(@"%s ---------------->:%@",__func__,error);
                
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

- (void)testKakaoGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK getUserInfo:SSDKPlatformTypeKakao onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                NSLog(@"%@",user);
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - Facebook分享

- (void)testFacebookShareImagesWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSString *path1 = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
        NSString *path2 = [[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"];
        NSString *path3 = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
        NSString *path4 = [[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"];
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:nil
                                        images:@[path1,path2,path3,path4]
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeFacebook parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testFacebookShareLinkWithCommonParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                        images:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
                                           url:[NSURL URLWithString:@"https://www.mob.com"]
                                         title:@"Share SDK"
                                          type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformTypeFacebook parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testFacebookShareVideoWithCommonParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
        NSURL *url = [NSURL URLWithString:path];
        ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
        [assetsLibrary writeVideoAtPathToSavedPhotosAlbum:url completionBlock:^(NSURL *assetURL, NSError *error) {
            NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
            //通用参数设置
            [parameters SSDKSetupShareParamsByText:nil
                                            images:nil
                                               url:assetURL
                                             title:nil
                                              type:SSDKContentTypeVideo];
            [ShareSDK share:SSDKPlatformTypeFacebook parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
                XCTAssertNil(error);
                terminate();
            }];
        }];
    }];
}

- (void)testFacebookShareAppWithCustomParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupFacebookParamsByText:nil
                                        image:@"http://www.mob.com/public/images/logo_black.png"
                                          url:[NSURL URLWithString:@"https://fb.me/1492137904189216"]
                                     urlTitle:nil
                                      urlName:nil
                               attachementUrl:nil
                                         type:SSDKContentTypeApp];
        [ShareSDK share:SSDKPlatformTypeFacebook parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}


- (void)testFacebookShareImagesWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSString *path1 = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
        NSString *path2 = [[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"];
        NSString *path3 = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
        NSString *path4 = [[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"];
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupFacebookParamsByText:nil
                                            image:@[path1,path2,path3,path4]
                                              url:nil
                                         urlTitle:nil
                                          urlName:nil
                                   attachementUrl:nil
                                             type:SSDKContentTypeImage];

        [ShareSDK share:SSDKPlatformTypeFacebook parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testFacebookShareLinkWithCustomParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupFacebookParamsByText:@"Share SDK Link Desc"
                                            image:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
                                              url:[NSURL URLWithString:@"https://www.mob.com"]
                                         urlTitle:@"Share SDK"
                                          urlName:nil
                                   attachementUrl:nil
                                             type:SSDKContentTypeWebPage];

        [ShareSDK share:SSDKPlatformTypeFacebook parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testFacebookShareVideoWithCustomParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
        NSURL *url = [NSURL URLWithString:path];
        ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
        [assetsLibrary writeVideoAtPathToSavedPhotosAlbum:url completionBlock:^(NSURL *assetURL, NSError *error) {
            NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
            //平台定制
            [parameters SSDKSetupFacebookParamsByText:nil
                                                image:nil
                                                  url:assetURL
                                             urlTitle:nil
                                              urlName:nil
                                       attachementUrl:nil
                                                 type:SSDKContentTypeVideo];
            [ShareSDK share:SSDKPlatformTypeFacebook parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
                XCTAssertNil(error);
                terminate();
            }];
        }];
    }];
}


- (void)testFacebookShareParamsIllegalWithoutType
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK share:SSDKPlatformTypeFacebook parameters:nil onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssert(error.code == 200102);
            terminate();
        }];
    }];
}

- (void)testFacebookShareParamsIllegalWithType
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        for (NSInteger i=0; i<=10; i++)
        {
            NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
            [parameters SSDKSetupShareParamsByText:nil images:nil url:nil title:nil type:i];
            
            [ShareSDK share:SSDKPlatformTypeFacebook parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
                
                NSLog(@"IllegalWithType ---------------->:%@",error);
                if (i==10) {
                    terminate();
                }
            }];
        }
    }];
}

- (void)testFacebookShareHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params SSDKSetupShareParamsByText:@"testText"
                                    images:@[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1526463559502&di=f078ab4b4d8ebfb092c76a4bead1bd87&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201805%2F11%2F190556y96ja6qjal9l99ah.jpg"]
                                       url:[NSURL URLWithString:@"www.mob.com"]
                                     title:@"I love u"
                                      type:SSDKContentTypeImage];
        for (NSInteger i=0; i<10 ; i++)
        {
            [ShareSDK share:SSDKPlatformTypeFacebook parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
                
                NSLog(@" ---------------->:%zd",error.code);
                
                XCTAssert(!error || error.code == 200300);
                if (i==9) {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - Facebook授权

- (void)testFacebookAuth
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeFacebook settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testFacebookGetUserinfoUnAuthed
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeFacebook result:^(NSError *error) {
            
            [ShareSDK getUserInfo:SSDKPlatformTypeFacebook onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                NSLog(@"%@",user.dictionaryValue);
                XCTAssertNil(error);
                terminate();
            }];
            
        }];
    }];
}

- (void)testFacebookAuthHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK authorize:SSDKPlatformTypeFacebook settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                NSLog(@"%s ---------------->:%@",__func__,error);
                
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

- (void)testFacebookGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK getUserInfo:SSDKPlatformTypeFacebook onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                XCTAssertNil(error);
                NSLog(@"%@",user);
                if (i == 9)
                {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - FacebookMessenger分享

- (void)testFacebookMessengerShareImageWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:nil
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeFacebookMessenger parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testFacebookMessengerShareImageWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupFacebookMessengerParamsByTitle:nil
                                                        url:nil
                                                  quoteText:nil
                                                     images:@[[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]]
                                                        gif:nil
                                                      audio:nil
                                                      video:nil
                                                       type:SSDKContentTypeImage];

        [ShareSDK share:SSDKPlatformTypeFacebookMessenger parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testFacebookMessengerShareGifWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupFacebookMessengerParamsByTitle:nil
                                                        url:nil
                                                  quoteText:nil
                                                     images:nil
                                                        gif:[[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"]
                                                      audio:nil
                                                      video:nil
                                                       type:SSDKContentTypeImage];
        
        [ShareSDK share:SSDKPlatformTypeFacebookMessenger parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testFacebookMessengerShareVideoWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:nil
                                        images:nil
                                           url:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                         title:nil
                                          type:SSDKContentTypeVideo];
        [ShareSDK share:SSDKPlatformTypeFacebookMessenger parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testFacebookMessengerShareVideoWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupFacebookMessengerParamsByTitle:nil
                                                        url:nil
                                                  quoteText:nil
                                                     images:nil
                                                        gif:nil
                                                      audio:nil
                                                      video:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                                       type:SSDKContentTypeVideo];
        
        [ShareSDK share:SSDKPlatformTypeFacebookMessenger parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testFacebookMessengerShareAudioWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupFacebookMessengerParamsByTitle:nil
                                                        url:nil
                                                  quoteText:nil
                                                     images:nil
                                                        gif:nil
                                                      audio:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]
                                                      video:nil
                                                       type:SSDKContentTypeAudio];
        
        [ShareSDK share:SSDKPlatformTypeFacebookMessenger parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

//- (void)testFacebookMessengerShareImagesWithCommonParams
//{
//    [self _wait:10 testOperation:^(void (^terminate)(void)) {
//
//        NSString *path1 = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
//        NSString *path2 = [[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"];
//        NSString *path3 = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
//        NSString *path4 = [[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"];
//        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//        //通用参数设置
//        [parameters SSDKSetupShareParamsByText:nil
//                                        images:@[path1,path2,path3,path4]
//                                           url:nil
//                                         title:nil
//                                          type:SSDKContentTypeFBMessageImages];
//        [ShareSDK share:SSDKPlatformTypeFacebookMessenger parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
//            XCTAssertNil(error);
//            terminate();
//        }];
//    }];
//}
//
//- (void)testFacebookMessengerShareImagesWithCustomParams
//{
//    [self _wait:10 testOperation:^(void (^terminate)(void)) {
//
//        NSString *path1 = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
//        NSString *path2 = [[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"];
//        NSString *path3 = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
//        NSString *path4 = [[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"];
//        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//        //平台定制
//        [parameters SSDKSetupFacebookMessengerParamsByTitle:nil
//                                                        url:nil
//                                                  quoteText:nil
//                                                     images:@[path1,path2,path3,path4]
//                                                        gif:nil
//                                                      audio:nil
//                                                      video:nil
//                                                       type:SSDKContentTypeFBMessageImages];
//
//        [ShareSDK share:SSDKPlatformTypeFacebookMessenger parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
//            XCTAssertNil(error);
//            terminate();
//        }];
//    }];
//}


- (void)testFacebookMessengerShareLinkWithCommonParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                        images:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
                                           url:[NSURL URLWithString:@"https://www.mob.com"]
                                         title:@"Share SDK"
                                          type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformTypeFacebookMessenger parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testFacebookMessengerShareLinkWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupFacebookMessengerParamsByTitle:@"Share SDK"
                                                        url:[NSURL URLWithString:@"http://www.mob.com"]
                                                  quoteText:@"Share SDK Link Desc"
                                                     images:@"http://weixintest.ihk.cn/ihkwx_upload/heji/material/img/20160414/1460616012469.jpg"
                                                        gif:nil
                                                      audio:nil
                                                      video:nil
                                                       type:SSDKContentTypeWebPage];

        [ShareSDK share:SSDKPlatformTypeFacebookMessenger parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

//- (void)testFacebookMessengerShareAssetVideoWithCommonParams
//{
//    [self _wait:10 testOperation:^(void (^terminate)(void)) {
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
//        NSURL *url = [NSURL URLWithString:path];
//        ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
//        [assetsLibrary writeVideoAtPathToSavedPhotosAlbum:url completionBlock:^(NSURL *assetURL, NSError *error) {
//            NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//            //通用参数设置
//            [parameters SSDKSetupShareParamsByText:nil
//                                            images:nil
//                                               url:assetURL
//                                             title:nil
//                                              type:SSDKContentTypeFBMessageVideo];
//            [ShareSDK share:SSDKPlatformTypeFacebookMessenger parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
//                XCTAssertNil(error);
//                terminate();
//            }];
//        }];
//    }];
//}
//
//- (void)testFacebookMessengerShareAssetVideoWithCustomParams
//{
//    [self _wait:15 testOperation:^(void (^terminate)(void)) {
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
//        NSURL *url = [NSURL URLWithString:path];
//        ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
//        [assetsLibrary writeVideoAtPathToSavedPhotosAlbum:url completionBlock:^(NSURL *assetURL, NSError *error) {
//            NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//            //平台定制
//            [parameters SSDKSetupFacebookMessengerParamsByTitle:nil
//                                                            url:nil
//                                                      quoteText:nil
//                                                         images:nil
//                                                            gif:nil
//                                                          audio:nil
//                                                          video:assetURL
//                                                           type:SSDKContentTypeFBMessageVideo];
//            [ShareSDK share:SSDKPlatformTypeFacebookMessenger parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
//                XCTAssertNil(error);
//                terminate();
//            }];
//        }];
//    }];
//}

- (void)testFacebookMessengerShareParamsIllegalWithoutType
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK share:SSDKPlatformTypeFacebookMessenger parameters:nil onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssert((error.code == 200101)||(error.code == 200102));
            terminate();
        }];
    }];
}

#pragma mark - Instagram分享

- (void)testInstagramShareImageWithCommonParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:nil
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeInstagram parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testInstagramShareImageWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupInstagramByImage:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                             menuDisplayPoint:CGPointMake(0, 0)];
        
        [ShareSDK share:SSDKPlatformTypeInstagram parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testInstagramShareVideoWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:nil
                                        images:nil
                                           url:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                         title:nil
                                          type:SSDKContentTypeVideo];
        [ShareSDK share:SSDKPlatformTypeInstagram parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testInstagramShareVideoWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupInstagramByVideo:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]];
        
        [ShareSDK share:SSDKPlatformTypeInstagram parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testInstagramShareParamsIllegalWithoutType
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK share:SSDKPlatformTypeInstagram parameters:nil onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssert(error.code == 200101);
            terminate();
        }];
    }];
}

#pragma mark - Instagram授权

- (void)testInstagramAuth
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeInstagram settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testInstagramGetUserinfoUnAuthed
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeInstagram result:^(NSError *error) {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [ShareSDK getUserInfo:SSDKPlatformTypeInstagram onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                    
                    NSLog(@"%@",user.dictionaryValue);
                    XCTAssertNil(error);
                    terminate();
                }];
            });
        }];
    }];
}

- (void)testInstagramGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK getUserInfo:SSDKPlatformTypeInstagram onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - 钉钉分享

- (void)testDingTalkShareTextWithCommonParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:nil
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeText];
        [ShareSDK share:SSDKPlatformTypeDingTalk parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testDingTalkShareTextWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupDingTalkParamsByText:@"Share SDK"
                                            image:nil
                                            title:nil
                                              url:nil
                                             type:SSDKContentTypeText];
        [ShareSDK share:SSDKPlatformTypeDingTalk parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testDingTalkShareImageWithCommonParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:nil
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeDingTalk parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testDingTalkShareImageWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupDingTalkParamsByText:@"Share SDK"
                                            image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                            title:nil
                                              url:nil
                                             type:SSDKContentTypeImage];

        [ShareSDK share:SSDKPlatformTypeDingTalk parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testDingTalkShareWebPageWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:[NSURL URLWithString:@"https://www.mob.com"]
                                         title:@"Share SDK"
                                          type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformTypeDingTalk parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testDingTalkShareWebPageWithCustomParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupDingTalkParamsByText:@"Share SDK"
                                            image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                            title:@"Share SDK"
                                              url:[NSURL URLWithString:@"https://www.mob.com"]
                                             type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformTypeDingTalk parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testDingTalkShareParamsIllegalWithoutType
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK share:SSDKPlatformTypeDingTalk parameters:nil onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNotNil(error);
            terminate();
        }];
    }];
}

#pragma mark - 豆瓣分享

- (void)testDouBanShareTextWithCommonParams
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:nil
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeText];
        [ShareSDK share:SSDKPlatformTypeDouBan parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testDouBanShareTextWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupDouBanParamsByText:@"Share SDK"
                                          image:nil
                                          title:nil
                                            url:nil
                                        urlDesc:nil
                                           type:SSDKContentTypeText];

        [ShareSDK share:SSDKPlatformTypeDouBan parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testDouBanShareImageWithCommonParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:nil
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeDouBan parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testDouBanShareImageWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupDouBanParamsByText:@"Share SDK"
                                          image:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
                                          title:nil
                                            url:nil
                                        urlDesc:nil
                                           type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeDouBan parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testDouBanShareWebPageWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:[NSURL URLWithString:@"https://www.mob.com"]
                                         title:@"Share SDK"
                                          type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformTypeDouBan parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testDouBanShareWebPageWithCustomParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupDouBanParamsByText:@"Share SDK"
                                          image:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
                                          title:@"Share SDK"
                                            url:[NSURL URLWithString:@"http://www.mob.com"]
                                        urlDesc:@"Share SDK DESC"
                                           type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformTypeDouBan parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testDouBanShareParamsIllegalWithoutType
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK share:SSDKPlatformTypeDouBan parameters:nil onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNotNil(error);
            terminate();
        }];
    }];
}

#pragma mark - 豆瓣授权

- (void)testDouBanAuth
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeDouBan settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            terminate();
        }];
    }];
}

- (void)testDouBanGetUserinfoUnAuthed
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeDouBan result:^(NSError *error) {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [ShareSDK getUserInfo:SSDKPlatformTypeDouBan onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                    
                    NSLog(@"%@",user.dictionaryValue);
                    XCTAssertNil(error);
                    terminate();
                }];
            });
        }];
    }];
}

- (void)testDouBanGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK getUserInfo:SSDKPlatformTypeDouBan onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                XCTAssertNil(error);
                NSLog(@"%@",user);
                if (i == 9)
                {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - Dropbox分享

- (void)testDropboxShareImageWithCommonParams
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeDropbox parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            switch (state) {
                case SSDKResponseStateSuccess:
                {
                    XCTAssertNil(error);
                    terminate();
                    break;
                }
                case SSDKResponseStateCancel:
                case SSDKResponseStateFail:
                {
                    XCTAssert(NO);
                    terminate();
                    break;
                }
                default:
                {
                    
                }
            }
        }];
    }];
}

- (void)testDropboxShareImageWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
        [parameters SSDKSetupDropboxParamsByAttachment:[NSURL fileURLWithPath:filePath]];
        [ShareSDK share:SSDKPlatformTypeDropbox parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            switch (state) {
                case SSDKResponseStateSuccess:
                {
                    XCTAssertNil(error);
                    terminate();
                    break;
                }
                case SSDKResponseStateCancel:
                case SSDKResponseStateFail:
                {
                    XCTAssert(NO);
                    terminate();
                    break;
                }
                default:
                {
                    
                }
            }
        }];
    }];
}

- (void)testDropboxShareFileWithCustomParams
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
        [parameters SSDKSetupDropboxParamsByAttachment:[NSURL fileURLWithPath:filePath]];
        [ShareSDK share:SSDKPlatformTypeDropbox parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            switch (state) {
                case SSDKResponseStateSuccess:
                {
                    XCTAssertNil(error);
                    terminate();
                    break;
                }
                case SSDKResponseStateCancel:
                case SSDKResponseStateFail:
                {
                    XCTAssert(NO);
                    terminate();
                    break;
                }
                default:
                {
                    
                }
            }
        }];
    }];
}

- (void)testDropboxShareParamsIllegalWithoutType
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK share:SSDKPlatformTypeDropbox parameters:nil onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNotNil(error);
            terminate();
        }];
    }];
}

#pragma mark - Dropbox授权

- (void)testDropboxAuth
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeDropbox settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {

            terminate();
        }];
    }];
}

- (void)testDropboxGetUserinfoUnAuthed
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeDropbox result:^(NSError *error) {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [ShareSDK getUserInfo:SSDKPlatformTypeDropbox onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                    
                    NSLog(@"%@",user.dictionaryValue);
                    XCTAssertNil(error);
                    terminate();
                }];
            });
        }];
    }];
}

- (void)testDropboxGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK getUserInfo:SSDKPlatformTypeDropbox onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                XCTAssertNil(error);
                NSLog(@"%@",user);
                if (i == 9)
                {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - Instapaper分享

- (void)testInstapaperShareWebPageWithCommonParams
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:[NSURL URLWithString:@"http://www.mob.com"]
                                         title:@"Share SDK"
                                          type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformTypeInstapaper parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testInstapaperShareWebPageWithCustomParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupInstapaperParamsByUrl:[NSURL URLWithString:@"http://www.mob.com"]
                                             title:@"Share SDK"
                                              desc:@"Share SDK Link Desc"
                                           content:@"Share SDK Link Desc"
                               isPrivateFromSource:NO
                                          folderId:0
                                   resolveFinalUrl:YES];

        [ShareSDK share:SSDKPlatformTypeInstapaper parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testInstapaperShareParamsIllegalWithoutType
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK share:SSDKPlatformTypeInstapaper parameters:nil onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNotNil(error);
            terminate();
        }];
    }];
}

#pragma mark - Instapaper授权

- (void)testInstapaperAuth
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeInstapaper settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testInstapaperGetUserinfoUnAuthed
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeInstapaper result:^(NSError *error) {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [ShareSDK getUserInfo:SSDKPlatformTypeInstapaper onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                    
                    NSLog(@"%@",user.dictionaryValue);
                    XCTAssertNil(error);
                    terminate();
                }];
            });
        }];
    }];
}

- (void)testInstapaperGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK getUserInfo:SSDKPlatformTypeInstapaper onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                XCTAssertNil(error);
                NSLog(@"%@",user);
                if (i == 9)
                {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - Line分享

- (void)testLineShareTextWithCommonParams
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:nil
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeText];
        [ShareSDK share:SSDKPlatformTypeLine parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testLineShareTextWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupLineParamsByText:@"Share SDK"
                                        image:nil
                                         type:SSDKContentTypeText];
        [ShareSDK share:SSDKPlatformTypeLine parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testLineShareImageWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:nil
                                        images:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"//[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeLine parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testLineShareImageWithCustomParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupLineParamsByText:nil image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"] type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeLine parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testLineShareParamsIllegalWithoutType
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK share:SSDKPlatformTypeLine parameters:nil onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNotNil(error);
            terminate();
        }];
    }];
}


#pragma mark - Line授权

- (void)testLineAuth
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeLine settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testLineGetUserinfoUnAuthed
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeLine result:^(NSError *error) {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [ShareSDK getUserInfo:SSDKPlatformTypeLine onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                    
                    NSLog(@"%@",user.dictionaryValue);
                    XCTAssertNil(error);
                    terminate();
                }];
            });
        }];
    }];
}

- (void)testLineGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp =0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK getUserInfo:SSDKPlatformTypeLine onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {

                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - VKontakte分享

- (void)testVKontakteShareTextWithCommonParams
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:nil
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeText];
        [ShareSDK share:SSDKPlatformTypeVKontakte parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testVKontakteShareTextWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupVKontakteParamsByText:@"Share SDK"
                                            images:nil
                                               url:nil
                                           groupId:nil
                                       friendsOnly:NO
                                          latitude:0
                                         longitude:0
                                              type:SSDKContentTypeText];

        [ShareSDK share:SSDKPlatformTypeVKontakte parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testVKontakteShareImageWithCommonParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"]];
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:image
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeVKontakte parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testVKontakteShareImageWithCustomParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"]];
        [parameters SSDKSetupVKontakteParamsByText:@"Share SDK Link Desc"
                                            images:image
                                               url:nil
                                           groupId:nil
                                       friendsOnly:NO
                                          latitude:0
                                         longitude:0
                                              type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeVKontakte parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testVKontakteShareWebPageWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"]];
        [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                        images:image
                                           url:[NSURL URLWithString:@"http://www.mob.com"]
                                         title:@"Share SDK"
                                          type:SSDKContentTypeWebPage];
        [parameters setValue:@(0) forKey:@"group_id"];
        [ShareSDK share:SSDKPlatformTypeVKontakte parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testVKontakteShareWebPageWithCustomParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"]];
        [parameters SSDKSetupVKontakteParamsByText:@"Share SDK Link Desc"
                                            images:image
                                               url:[NSURL URLWithString:@"http://www.mob.com"]
                                           groupId:nil
                                       friendsOnly:NO
                                          latitude:0
                                         longitude:0
                                              type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformTypeVKontakte parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testVKontakteShareParamsIllegalWithoutType
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK share:SSDKPlatformTypeVKontakte parameters:nil onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNotNil(error);
            terminate();
        }];
    }];
}


#pragma mark - VKontakte授权

- (void)testVKontakteAuth
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeVKontakte settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
//            XCTAssertNil(error);// UITest测试
            terminate();
        }];
    }];
}

- (void)testVKontakteGetUserinfoUnAuthed
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeVKontakte result:^(NSError *error) {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [ShareSDK getUserInfo:SSDKPlatformTypeVKontakte onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                    
                    terminate();
                }];
            });
        }];
    }];
}

- (void)testVKontakteGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        for (NSInteger i=0; i<10; i++)
        {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * i * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [ShareSDK getUserInfo:SSDKPlatformTypeVKontakte onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                    
                    XCTAssertNil(error);
                    NSLog(@"%@",user);
                    if (i == 9)
                    {
                        terminate();
                    }
                }];
            });
        }
    }];
}

#pragma mark - YouTube分享

- (void)testYouTubeShareVideoWithCommonParams
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:nil
                                        images:nil
                                           url:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                         title:nil
                                          type:SSDKContentTypeVideo];
        [ShareSDK share:SSDKPlatformTypeYouTube parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            switch (state) {
                case SSDKResponseStateSuccess:
                {
                    XCTAssertNil(error);
                    terminate();
                    break;
                }
                case SSDKResponseStateCancel:
                case SSDKResponseStateFail:
                {
                    XCTAssert(NO);
                    terminate();
                    break;
                }
                default:
                {
                    
                }
            }
        }];
    }];
}

- (void)testYouTubeShareVideoWithCustomParams
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupYouTubeParamsByVideo:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]
                                            title:@"share SDK"
                                      description:@"share SDK video updata"
                                             tags:@[@"cool",@"cat"]
                                    privacyStatus:SSDKPrivacyStatusPublic];
        [ShareSDK share:SSDKPlatformTypeYouTube parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            switch (state) {
                case SSDKResponseStateSuccess:
                {
                    XCTAssertNil(error);
                    terminate();
                    break;
                }
                case SSDKResponseStateCancel:
                case SSDKResponseStateFail:
                {
                    XCTAssert(NO);
                    terminate();
                    break;
                }
                default:
                {
                    
                }
            }
        }];
    }];
}

- (void)testYouTubeShareVideoWithCustomTwoParams
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //完全自定义
        NSDictionary *dic = @{
                              @"snippet" : @{
                                      @"title" : @"My video title",
                                      @"description" : @"This is a description of my video",
                                      @"tags" : @[@"cool", @"video", @"more keywords"],
                                      @"categoryId" : @(20)
                                      },
                              @"status" : @{
                                      @"privacyStatus" : @"public",
                                      @"license" : @"creativeCommon",
                                      }
                              };
        NSData *jsonData = [NSJSONSerialization  dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        
        //    @param parts 多个使用逗号隔开 例如 snippet,status  参考 https://developers.google.com/youtube/v3/docs/videos/insert#part
        //    @param jsonString Video resource 的 json数据  参考 https://developers.google.com/youtube/v3/docs/videos
        [parameters SSDKSetupYouTubeParamsByVideo:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]
                                            parts:@"snippet,status"
                                       jsonString:json];
        [ShareSDK share:SSDKPlatformTypeYouTube parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            switch (state) {
                case SSDKResponseStateSuccess:
                {
                    XCTAssertNil(error);
                    terminate();
                    break;
                }
                case SSDKResponseStateCancel:
                case SSDKResponseStateFail:
                {
                    XCTAssert(NO);
                    terminate();
                    break;
                }
                default:
                {
                    
                }
            }
        }];
    }];
}

#pragma mark - YouTube授权

- (void)testYouTubeAuth
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeYouTube settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYouTubeGetUserinfoUnAuthed
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeYouTube result:^(NSError *error) {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [ShareSDK getUserInfo:SSDKPlatformTypeYouTube onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                    
                    terminate();
                }];
            });
        }];
    }];
}

- (void)testYouTubeGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        for (NSInteger i=0; i<10; i++)
        {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * i * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [ShareSDK getUserInfo:SSDKPlatformTypeYouTube onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                    
                    XCTAssertNil(error);
                    NSLog(@"%@",user);
                    if (i == 9)
                    {
                        terminate();
                    }
                }];
            });
        }
    }];
}

#pragma mark - WhatsApp分享

- (void)testWhatsAppShareTextWithCommonParams
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:nil
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeText];
        [ShareSDK share:SSDKPlatformTypeWhatsApp parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWhatsAppShareTextWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupWhatsAppParamsByText:@"Share SDK"
                                            image:nil
                                            audio:nil
                                            video:nil
                                 menuDisplayPoint:CGPointZero
                                             type:SSDKContentTypeText];
        [ShareSDK share:SSDKPlatformTypeWhatsApp parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWhatsAppShareImageWithCommonParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeWhatsApp parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWhatsAppShareImageWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupWhatsAppParamsByText:@"Share SDK"
                                            image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                            audio:nil
                                            video:nil
                                 menuDisplayPoint:CGPointZero
                                             type:SSDKContentTypeImage];

        [ShareSDK share:SSDKPlatformTypeWhatsApp parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWhatsAppShareAudioWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupWhatsAppParamsByText:@"Share SDK"
                                            image:nil
                                            audio:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]
                                            video:nil
                                 menuDisplayPoint:CGPointZero
                                             type:SSDKContentTypeAudio];
        [ShareSDK share:SSDKPlatformTypeWhatsApp parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWhatsAppShareVideoWithCustomParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupWhatsAppParamsByText:@"Share SDK"
                                            image:nil
                                            audio:nil
                                            video:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                 menuDisplayPoint:CGPointZero
                                             type:SSDKContentTypeVideo];
        [ShareSDK share:SSDKPlatformTypeWhatsApp parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWhatsAppShareParamsIllegalWithoutType
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK share:SSDKPlatformTypeWhatsApp parameters:nil onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNotNil(error);
            terminate();
        }];
    }];
}

#pragma mark - Mail分享

- (void)testMailShareTextWithCommonParams
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:nil
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeText];
        [ShareSDK share:SSDKPlatformTypeMail parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testMailShareTextWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupMailParamsByText:@"Share SDK"
                                        title:nil
                                       images:nil
                                  attachments:nil
                                   recipients:nil
                                 ccRecipients:nil
                                bccRecipients:nil
                                         type:SSDKContentTypeText];
        [ShareSDK share:SSDKPlatformTypeMail parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testMailShareImageWithCommonParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeMail parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testMailShareImageWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupMailParamsByText:@"Share SDK"
                                        title:nil
                                       images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                  attachments:nil
                                   recipients:nil
                                 ccRecipients:nil
                                bccRecipients:nil
                                         type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeMail parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testMailShareVideoWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:nil
                                           url:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                         title:nil
                                          type:SSDKContentTypeVideo];
        [ShareSDK share:SSDKPlatformTypeMail parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testMailShareVideoWithCustomParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupMailParamsByText:@"Share SDK"
                                        title:nil
                                       images:nil
                                  attachments:@[[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]]
                                   recipients:nil
                                 ccRecipients:nil
                                bccRecipients:nil
                                         type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeMail parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testMailShareParamsIllegalWithoutType
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK share:SSDKPlatformTypeMail parameters:nil onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

#pragma mark - 打印

- (void)testPrintShareTextWithCommonParams
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:nil
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeText];
        [ShareSDK share:SSDKPlatformTypePrint parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testPrintShareImageWithCommonParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypePrint parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testPrintShareParamsIllegalWithoutType
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK share:SSDKPlatformTypePrint parameters:nil onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNotNil(error);
            terminate();
        }];
    }];
}

#pragma mark - renren分享

- (void)testRenrenShareImageWithCommonParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeRenren parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testRenrenShareImageWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupRenRenParamsByText:@"Share SDK"
                                          image:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
                                            url:nil
                                        albumId:nil
                                           type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeRenren parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testRenrenShareWebPageWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:[NSURL URLWithString:@"http://www.mob.com"]
                                         title:@"Share SDK"
                                          type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformTypeRenren parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testRenrenShareWebPageWithCustomParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupRenRenParamsByText:@"Share SDK"
                                          image:nil
                                            url:[NSURL URLWithString:@"http://www.mob.com"]
                                        albumId:nil
                                           type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformTypeRenren parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testRenrenShareParamsIllegalWithoutType
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK share:SSDKPlatformTypeRenren parameters:nil onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssertNotNil(error);
            terminate();
        }];
    }];
}

#pragma mark - renren授权

- (void)testRenrenAuth
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeRenren settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {

            terminate();
        }];
    }];
}

- (void)testRenrenGetUserinfoUnAuthed
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeRenren result:^(NSError *error) {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [ShareSDK getUserInfo:SSDKPlatformTypeRenren onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                    
                    terminate();
                }];
            });
        }];
    }];
}

- (void)testRenrenGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        for (NSInteger i=0; i<10; i++)
        {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * i * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [ShareSDK getUserInfo:SSDKPlatformTypeRenren onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                    
                    XCTAssertNil(error);
                    NSLog(@"%@",user);
                    if (i == 9)
                    {
                        terminate();
                    }
                }];
            });
        }
    }];
}

#pragma mark - 有道云笔记 分享

- (void)testYouDaoNoteShareTextWithCommonParams
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:nil
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeText];
        [ShareSDK share:SSDKPlatformTypeYouDaoNote parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYouDaoNoteShareTextWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupYouDaoNoteParamsByText:@"Share SDK"
                                             images:nil
                                              title:@"Share SDK"
                                             source:@"MOB"
                                             author:@"mob"
                                           notebook:nil];
        [ShareSDK share:SSDKPlatformTypeYouDaoNote parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYouDaoNoteShareImageWithCommonParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:nil
                                         title:@"Share SDK"
                                          type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeYouDaoNote parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYouDaoNoteShareImageWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupYouDaoNoteParamsByText:@"Share SDK"
                                             images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                              title:@"Share SDK"
                                             source:@"MOB"
                                             author:@"mob"
                                           notebook:nil];
        [ShareSDK share:SSDKPlatformTypeYouDaoNote parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testYouDaoNoteShareParamsIllegalWithoutType
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK share:SSDKPlatformTypeYouDaoNote parameters:nil onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssert(state == SSDKResponseStateSuccess);
            terminate();
        }];
    }];
}


#pragma mark - 有道云笔记 授权

- (void)testYouDaoNoteAuth
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeYouDaoNote settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            terminate();
        }];
    }];
}

- (void)testYouDaoNoteGetUserinfoUnAuthed
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeYouDaoNote result:^(NSError *error) {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [ShareSDK getUserInfo:SSDKPlatformTypeYouDaoNote onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                    terminate();
                }];
            });
        }];
    }];
}

- (void)testYouDaoNoteGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        for (NSInteger i=0; i<10; i++)
        {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * i * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [ShareSDK getUserInfo:SSDKPlatformTypeYouDaoNote onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                    
                    XCTAssertNil(error);
                    NSLog(@"%@",user);
                    if (i == 9)
                    {
                        terminate();
                    }
                }];
            });
        }
    }];
}

#pragma mark - telegram分享

- (void)testTelegramShareTextWithCommonParams
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"[Share SDK](https://www.mob.com)"
                                        images:nil
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeText];
        [ShareSDK share:SSDKPlatformTypeTelegram parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testTelegramShareTextWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupTelegramParamsByText:@"Share SDK"
                                            image:nil
                                            audio:nil
                                            video:nil
                                             file:nil
                                 menuDisplayPoint:CGPointZero
                                             type:SSDKContentTypeText];
        [ShareSDK share:SSDKPlatformTypeTelegram parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testTelegramShareImageWithCommonParams
{
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeTelegram parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testTelegramShareImageWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupTelegramParamsByText:@""
                                            image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                            audio:nil
                                            video:nil
                                             file:nil
                                 menuDisplayPoint:CGPointZero
                                             type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeTelegram parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testTelegramShareVideoWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupTelegramParamsByText:@"Share SDK"
                                            image:nil
                                            audio:nil
                                            video:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                             file:nil
                                 menuDisplayPoint:CGPointZero
                                             type:SSDKContentTypeVideo];
        [ShareSDK share:SSDKPlatformTypeTelegram parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testTelegramShareFileWithCustomParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //平台定制
        [parameters SSDKSetupTelegramParamsByText:@"Share SDK"
                                            image:nil
                                            audio:nil
                                            video:nil
                                             file:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"]]
                                 menuDisplayPoint:CGPointZero
                                             type:SSDKContentTypeFile];
        [ShareSDK share:SSDKPlatformTypeTelegram parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testTelegramShareParamsIllegalWithoutType
{
    [self _wait:50 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK share:SSDKPlatformTypeTelegram parameters:nil onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            XCTAssert(state == SSDKResponseStateFail);
            terminate();
        }];
    }];
}

#pragma mark - LinkedIn

- (void)testLinkedInShareTextWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupShareParamsByText:@"ssssssssss" images:nil url:nil title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeLinkedIn parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testLinkedInShareTextWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupLinkedInParamsByText:@"Share SDK Link Desc"
                                        image:nil
                                          url:nil
                                        title:nil
                                      urlDesc:nil
                                   visibility:nil
                                         type:SSDKContentTypeText];
        [ShareSDK share:SSDKPlatformTypeLinkedIn parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testLinkedInShareWebWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupShareParamsByText:@"ssssssssss" images:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg" url:[NSURL URLWithString:@"http://www.mob.com"] title:@"Share SDK" type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeLinkedIn parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testLinkedInShareWebWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupLinkedInParamsByText:@"Share SDK Link Desc"
                                        image:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
                                          url:[NSURL URLWithString:@"http://www.mob.com"]
                                        title:@"Share SDK"
                                      urlDesc:@"Mob"
                                   visibility:nil
                                         type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformTypeLinkedIn parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testLinkedInAuth
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeLinkedIn settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
//            XCTAssert(state == SSDKResponseStateSuccess);
            terminate();
        }];
    }];
}

- (void)testLinkedInGetUserinfoUnAuthed
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeLinkedIn result:^(NSError *error) {
            
            [ShareSDK getUserInfo:SSDKPlatformTypeLinkedIn onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                terminate();
            }];
            
        }];
    }];
}

- (void)testLinkedInAuthHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK authorize:SSDKPlatformTypeLinkedIn settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                NSLog(@"%s ---------------->:%@",__func__,error);
                
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

- (void)testLinkedInGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK getUserInfo:SSDKPlatformTypeLinkedIn onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                XCTAssertNil(error);
                NSLog(@"%@",user);
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - Tumblr

- (void)testTumblrShareTextWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupShareParamsByText:@"ssssssssss" images:nil url:nil title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeTumblr parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testTumblrShareTextWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupTumblrParamsByText:@"Share SDK"
                                          image:nil
                                            url:nil
                                          title:nil
                                       blogName:nil
                                           type:SSDKContentTypeText];
        [ShareSDK share:SSDKPlatformTypeTumblr parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testTumblrShareImageWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupShareParamsByText:@"ssssssssss" images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"] url:nil title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeTumblr parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testTumblrShareImageWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupTumblrParamsByText:@"Share SDK"
                                      image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                        url:nil
                                      title:nil
                                   blogName:nil
                                       type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeTumblr parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testTumblrAuth
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeTumblr settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testTumblrGetUserinfoUnAuthed
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeTumblr result:^(NSError *error) {
            
            [ShareSDK getUserInfo:SSDKPlatformTypeTumblr onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                NSLog(@"%@",user.dictionaryValue);
                XCTAssertNil(error);
                terminate();
            }];
            
        }];
    }];
}

- (void)testTumblrAuthHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK authorize:SSDKPlatformTypeTumblr settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                NSLog(@"%s ---------------->:%@",__func__,error);
                
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

- (void)testTumblrGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK getUserInfo:SSDKPlatformTypeTumblr onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                XCTAssertNil(error);
                NSLog(@"%@",user);
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - 美拍

- (void)testMeiPaiShareImageWithCommonParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        
        [parameters SSDKSetupShareParamsByText:nil images:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]] url:nil title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeMeiPai parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testMeiPaiShareImageWithCustomParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupMeiPaiParamsByUrl:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]] contentType:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeMeiPai parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testMeiPaiShareAlbumImageWithCommonParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
        ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        [assetsLibrary writeImageToSavedPhotosAlbum:[image CGImage]
                                        orientation:(ALAssetOrientation)image.imageOrientation
                                    completionBlock:^(NSURL *assetURL, NSError *error) {
                                        
                                        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
                                        [parameters SSDKSetupShareParamsByText:nil images:assetURL url:nil title:nil type:SSDKContentTypeAuto];
                                        [ShareSDK share:SSDKPlatformTypeMeiPai parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
                                            XCTAssertNil(error);
                                            terminate();
                                        }];
                                    }];
    }];
}

- (void)testMeiPaiShareAlbumImageWithCustomParams
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
        ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        [assetsLibrary writeImageToSavedPhotosAlbum:[image CGImage]
                                        orientation:(ALAssetOrientation)image.imageOrientation
                                    completionBlock:^(NSURL *assetURL, NSError *error) {
                                        
                                        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
                                        [parameters SSDKSetupMeiPaiParamsByUrl:assetURL contentType:SSDKContentTypeAuto];
                                        [ShareSDK share:SSDKPlatformTypeMeiPai parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
                                            XCTAssertNil(error);
                                            terminate();
                                        }];
                                    }];
    }];
}

- (void)testMeiPaiAuth
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK authorize:SSDKPlatformTypeMeiPai settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssert(error.code == 200105);
            terminate();
        }];
    }];
}

- (void)testMeiPaiGetuserInfo
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK getUserInfo:SSDKPlatformTypeMeiPai onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssert(error.code == 200105);
            terminate();
        }];
    }];
}

#pragma mark - Pocket

- (void)testPocketShareWebWithCommonParams
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        [parameters SSDKSetupShareParamsByText:nil images:nil url:[NSURL URLWithString:@"http://www.mob.com"] title:@"Share SDK" type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypePocket parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testPocketShareWebWithCustomParams
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        [parameters SSDKSetupPocketParamsByUrl:[NSURL URLWithString:@"http://www.mob.com"]
                                         title:@"Share SDK"
                                          tags:@"page"
                                       tweetId:nil];
        [ShareSDK share:SSDKPlatformTypePocket parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testPocketAuth
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypePocket settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testPocketGetUserinfoUnAuthed
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypePocket result:^(NSError *error) {
            
            [ShareSDK getUserInfo:SSDKPlatformTypePocket onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                NSLog(@"%@",user.dictionaryValue);
                XCTAssertNil(error);
                terminate();
            }];
            
        }];
    }];
}

- (void)testPocketAuthHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK authorize:SSDKPlatformTypePocket settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                NSLog(@"%s ---------------->:%@",__func__,error);
                
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

- (void)testPocketGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK getUserInfo:SSDKPlatformTypePocket onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                XCTAssertNil(error);
                NSLog(@"%@",user);
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - Copy

- (void)testCopyShareTextWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupShareParamsByText:@"ssssssssss" images:nil url:nil title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeCopy parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testCopyShareImageWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupShareParamsByText:nil images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"] url:nil title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeCopy parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testCopyShareWebWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupShareParamsByText:nil images:nil url:[NSURL URLWithString:@"https://www.mob.com"] title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeCopy parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testCopyShareTextWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupCopyParamsByText:@"Share SDK"
                                   images:nil
                                      url:nil
                                     type:SSDKContentTypeText];
        [ShareSDK share:SSDKPlatformTypeCopy parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testCopyShareImageWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupCopyParamsByText:nil
                                   images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                      url:nil
                                     type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeCopy parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testCopyShareWebWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupCopyParamsByText:nil
                                   images:nil
                                      url:[NSURL URLWithString:@"https://www.mob.com"]
                                     type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformTypeCopy parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}


#pragma mark - SMS

- (void)testSMSShareTextWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"1231211" images:nil url:nil title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeSMS parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testSMSShareImageWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:nil images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"] url:nil title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeSMS parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testSMSShareVideoWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:nil images:nil url:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]] title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeSMS parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testSMSShareTextWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupSMSParamsByText:@"Share SDK"
                                       title:nil
                                      images:nil
                                 attachments:nil
                                  recipients:nil //收件人
                                        type:SSDKContentTypeText];
        [ShareSDK share:SSDKPlatformTypeSMS parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testSMSShareImageWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupSMSParamsByText:@"Share SDK"
                                       title:nil
                                      images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                 attachments:nil
                                  recipients:nil //收件人
                                        type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeSMS parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testSMSShareVideoWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupSMSParamsByText:@"Share SDK"
                                       title:nil
                                      images:nil
                                 attachments:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                  recipients:nil //收件人
                                        type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeSMS parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testSMSAuth
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
      
        [ShareSDK authorize:SSDKPlatformTypeSMS settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testSMSGetUserinfo
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK getUserInfo:SSDKPlatformTypeSMS onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
        
    }];
}

#pragma mark - 开心网

- (void)testKaiXinShareTextWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"1231211" images:nil url:nil title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeKaixin parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testKaiXinShareImageWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"1231211" images:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"] url:nil title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeKaixin parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testKaiXinShareTextWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupKaiXinParamsByText:@"Share SDK"
                                          image:nil
                                           type:SSDKContentTypeText];
        [ShareSDK share:SSDKPlatformTypeKaixin parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testKaiXinShareImageWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupKaiXinParamsByText:@"Share SDK"
                                          image:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
                                           type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeKaixin parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testKaiXinAuth
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeKaixin settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testKaiXinGetUserinfoUnAuthed
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeKaixin result:^(NSError *error) {
            
            [ShareSDK getUserInfo:SSDKPlatformTypeKaixin onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                NSLog(@"%@",user.dictionaryValue);
                XCTAssertNil(error);
                terminate();
            }];
            
        }];
    }];
}

- (void)testKaiXinAuthHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK authorize:SSDKPlatformTypeKaixin settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                NSLog(@"%s ---------------->:%@",__func__,error);
                
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

- (void)testKaiXinGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK getUserInfo:SSDKPlatformTypeKaixin onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                XCTAssertNil(error);
                NSLog(@"%@",user);
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - 明道

- (void)testMingDaoShareTextWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"1231211" images:nil url:nil title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeMingDao parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssert(error.code == 200302);
            terminate();
        }];
    }];
}

- (void)testMingDaoShareWebWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:@"1231211" images:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg" url:[NSURL URLWithString:@"http://www.mob.com"] title:nil type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeMingDao parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testMingDaoShareTextWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupMingDaoParamsByText:@"Share SDK"
                                           image:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
                                             url:[NSURL URLWithString:@"http://www.mob.com"]
                                           title:@"Share SDK"
                                            type:SSDKContentTypeText];
        [ShareSDK share:SSDKPlatformTypeMingDao parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssert(error.code == 200102);
            terminate();
        }];
    }];
}

- (void)testMingDaoShareWebWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupMingDaoParamsByText:@"Share SDK"
                                           image:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
                                             url:[NSURL URLWithString:@"http://www.mob.com"]
                                           title:@"Share SDK"
                                            type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformTypeMingDao parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testMingDaoAuth
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeMingDao settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testMingDaoGetUserinfoUnAuthed
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeMingDao result:^(NSError *error) {
            
            [ShareSDK getUserInfo:SSDKPlatformTypeMingDao onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                NSLog(@"%@",user.dictionaryValue);
                XCTAssertNil(error);
                terminate();
            }];
            
        }];
    }];
}

- (void)testMingDaoAuthHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK authorize:SSDKPlatformTypeMingDao settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                NSLog(@"%s ---------------->:%@",__func__,error);
                
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

- (void)testMingDaoGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK getUserInfo:SSDKPlatformTypeMingDao onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                XCTAssertNil(error);
                NSLog(@"%@",user.dictionaryValue);
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - CMCC

- (void)testCMCCShare
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK share:SSDKPlatformTypeCMCC parameters:@{}.mutableCopy onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssert(error.code == 200105);
            terminate();
        }];
    }];
}

- (void)testCMCCAuth
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeCMCC settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testCMCCGetUserinfoUnAuthed
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeCMCC result:^(NSError *error) {
            
            [ShareSDK getUserInfo:SSDKPlatformTypeCMCC onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                NSLog(@"%@",user.dictionaryValue);
                XCTAssertNil(error);
                terminate();
            }];
            
        }];
    }];
}

- (void)testCMCCGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK getUserInfo:SSDKPlatformTypeCMCC onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                XCTAssertNil(error);
                NSLog(@"%@",user);
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - ESurfing

- (void)testESurfingShare
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK share:SSDKPlatformTypeESurfing parameters:@{}.mutableCopy onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssert(error.code == 200105);
            terminate();
        }];
    }];
}

- (void)testESurfingAuth
{
    [self _wait:1000 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeESurfing settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testESurfingGetUserinfoUnAuthed
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeESurfing result:^(NSError *error) {
            
            [ShareSDK getUserInfo:SSDKPlatformTypeESurfing onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                NSLog(@"%@",user.dictionaryValue);
                XCTAssertNil(error);
                terminate();
            }];
            
        }];
    }];
}

- (void)testESurfingGetUserinfoHighConcurrency
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        __block NSInteger tmp = 0;
        for (NSInteger i=0; i<10; i++)
        {
            [ShareSDK getUserInfo:SSDKPlatformTypeESurfing onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                XCTAssertNil(error);
                NSLog(@"%@",user);
                if (++tmp == 10)
                {
                    terminate();
                }
            }];
        }
    }];
}

#pragma mark - FaceBookAccount

- (void)testFaceBookAccountShare
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK share:SSDKPlatformTypeFacebookAccount parameters:@{}.mutableCopy onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssert(error.code == 200105);
            terminate();
        }];
    }];
}

- (void)testFaceBookAccountAuth
{
    [self _wait:1000 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeFacebookAccount settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

// https://graph.accountkit.com/v1.3/access_token?grant_type=authorization_code&code=AQAJOeOplPrZrv0hUAHqfnozGRcOMvVqUE3rsrlEuRn7A0iFNghcS4aDRPdApNeernZN69bajdvAvAvFTWgMWthAIwTvR1_xODFtdGaK06MckHchNjqsG_L42az5PB9zcRi4qFkFMwsrWNstuEPrhnojGSePNW3Q9956i2PMrCm9B1iG9zcryQWwu69J9reruP21HwzqEUd1uqNAL1a61gA0QqZJ-r8Y6RRoyo9N0a2yP-2hwb7wUnTMwNaHSNh1js4j_yTiYFU0KaUJJ8GG6GFG&access_token=AA|1412473428822331|cbb4fcd506dfecbb56e86344287548d9

//
// Token:c30c08723aa8c48fbd5e01d1c3103891
//Secret:cbb4fcd506dfecbb56e86344287548d9
- (void)testFaceBookAccountAuthWithConfig
{
    SSCFacebookAccountConfiguration *config = [[SSCFacebookAccountConfiguration alloc] init];
    config.responseType = 1;
    
    config.authResumeHandler = ^(NSString *autCode, void (^resumeOperation)(NSDictionary *credentialInfo)) {
        
        NSString *token = [MOBFString urlEncodeString:@"AA|1412473428822331|cbb4fcd506dfecbb56e86344287548d9" forEncoding:NSUTF8StringEncoding];
       NSString *url = [NSString stringWithFormat:@"https://graph.accountkit.com/v1.3/access_token?grant_type=authorization_code&code=%@&access_token=%@",autCode,token];
        
        [MOBFHttpService sendHttpRequestByURLString:url method:kMOBFHttpMethodGet parameters:nil headers:nil onResult:^(NSHTTPURLResponse *response, NSData *responseData) {
            
            NSDictionary *cInfo = [MOBFJson objectFromJSONData:responseData];
            NSLog(@"%@",cInfo);
            
            resumeOperation(cInfo);
            
        } onFault:^(NSError *error) {
            
        } onUploadProgress:^(int64_t totalBytes, int64_t loadedBytes) {
            
        }];
    };
    
    [FacebookAccountConnector setConfiguration:config];
    [self _wait:1000 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeFacebookAccount settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}


#pragma mark - 抖音授权

- (void)testDouyinAuth
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeDouyin settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testDouyinGetUserinfoUnAuthed
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeDouyin result:^(NSError *error) {
            
            [ShareSDK getUserInfo:SSDKPlatformTypeDouyin onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                NSLog(@"%@",user.dictionaryValue);
                XCTAssertNil(error);
                terminate();
            }];
            
        }];
    }];
}

#pragma mark - 抖音分享

- (void)testDouyinShareImagesWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        // 通用参数设置----图片分享可以使用相册地址、沙盒路径、网络图片地址
        NSString *path = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
//        UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"]];//[[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"];
//        NSString *imageURL = @"http://www.mob.com/assets/images/ShareSDK_pic_1-09d293a6.png";
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:nil
                                        images:@[path]
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeDouyin parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testDouyinShareImagesWithCustomParams
{

    __block NSMutableArray *assetLocalIds = [NSMutableArray array];
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
            UIImage *image1 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"]];
//            UIImage *image2 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]];
            
            PHAssetChangeRequest *req_1 = [PHAssetChangeRequest creationRequestForAssetFromImage:image1];
            NSString *localId_1 = req_1.placeholderForCreatedAsset.localIdentifier;
            [assetLocalIds addObject:localId_1];
            
//            PHAssetChangeRequest *req_2 = [PHAssetChangeRequest creationRequestForAssetFromImage:image2];
//            NSString *localId_2 = req_2.placeholderForCreatedAsset.localIdentifier;
//            [assetLocalIds addObject:localId_2];
            
        } error:nil];
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupDouyinParamesByAssetLocalIds:assetLocalIds type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeDouyin parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testDouyinShareVideoWithCommonParams
{
    [self _wait:10 testOperation:^(void (^terminate)(void)) {
        
        NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:nil
                                        images:nil
                                           url:[NSURL URLWithString:videoPath]
                                         title:nil
                                          type:SSDKContentTypeVideo];
        [ShareSDK share:SSDKPlatformTypeDouyin parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testDouyinShareVideosWithCustomParams
{
    __block NSMutableArray *assetLocalIds = [NSMutableArray array];
    [self _wait:15 testOperation:^(void (^terminate)(void)) {
        [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
            NSURL *url_1 = [[NSBundle mainBundle] URLForResource:@"cat" withExtension:@"mp4"];
            NSURL *url_2 = [[NSBundle mainBundle] URLForResource:@"cat" withExtension:@"mp4"];
            
            PHAssetChangeRequest *req_1 = [PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:url_1];
            NSString *localId_1 = req_1.placeholderForCreatedAsset.localIdentifier;
            [assetLocalIds addObject:localId_1];
            
            PHAssetChangeRequest *req_2 = [PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:url_2];
            NSString *localId_2 = req_2.placeholderForCreatedAsset.localIdentifier;
            [assetLocalIds addObject:localId_2];
        } error:nil];
        dispatch_async(dispatch_get_main_queue(), ^{
            NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
            [parameters SSDKSetupDouyinParamesByAssetLocalIds:assetLocalIds type:SSDKContentTypeVideo];
            
            [ShareSDK share:SSDKPlatformTypeDouyin parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
                XCTAssertNil(error);
                terminate();
            }];
        });
    }];
}

#pragma mark - 企业微信授权

- (void)testWeworkAuth
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        [ShareSDK authorize:SSDKPlatformTypeWework settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeworkGetUserinfoUnAuthed
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        [ShareSDK cancelAuthorize:SSDKPlatformTypeWework result:^(NSError *error) {
            
            [ShareSDK getUserInfo:SSDKPlatformTypeWework onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
                NSLog(@"%@",user.dictionaryValue);
                XCTAssertNil(error);
                terminate();
            }];
            
        }];
    }];
}

#pragma mark - 企业微信分享

- (void)testWeworkShareTextWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TESTS_TEXT
                                        images:nil
                                           url:nil
                                         title:nil
                                          type:SSDKContentTypeText];
        [ShareSDK share:SSDKPlatformTypeWework parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeworkShareTextWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupWeWorkParamsByText:SHARESDKDEMO_TESTS_TEXT
                                          title:nil
                                            url:nil
                                     thumbImage:nil
                                          image:nil
                                          video:nil
                                       fileData:nil
                                           type:SSDKContentTypeText];
        [ShareSDK share:SSDKPlatformTypeWework parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeworkShareImagesWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:nil
                                        images:SHARESDKDEMO_TESTS_IMAGE_LOCALPATH
                                           url:nil
                                         title:@"share.jpg"
                                          type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeWework parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeworkShareImagesWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupWeWorkParamsByText:nil
                                          title:@"share.jpg"
                                            url:nil
                                     thumbImage:nil
                                          image:SHARESDKDEMO_TESTS_IMAGE_LOCALPATH
                                          video:nil
                                       fileData:nil
                                           type:SSDKContentTypeImage];
        [ShareSDK share:SSDKPlatformTypeWework parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeworkShareLinkWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TESTS_TEXT
                                        images:[[NSBundle mainBundle] pathForResource:@"Icon@2x" ofType:@"png"]
                                           url:[NSURL URLWithString:SHARESDKDEMO_TESTS_URLSTRING]
                                         title:SHARESDKDEMO_TESTS_TITLE
                                          type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformTypeWework parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeworkShareLinkWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupWeWorkParamsByText:SHARESDKDEMO_TESTS_TEXT
                                          title:SHARESDKDEMO_TESTS_TITLE
                                            url:[NSURL URLWithString:SHARESDKDEMO_TESTS_URLSTRING]
                                     thumbImage:[[NSBundle mainBundle] pathForResource:@"Icon@2x" ofType:@"png"]
                                          image:nil
                                          video:nil
                                       fileData:nil
                                           type:SSDKContentTypeWebPage];
        [ShareSDK share:SSDKPlatformTypeWework parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeworkShareVideoWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:nil
                                        images:nil
                                           url:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                         title:@"share.mp4"
                                          type:SSDKContentTypeVideo];
        [ShareSDK share:SSDKPlatformTypeWework parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeworkShareVideoWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupWeWorkParamsByText:nil
                                          title:@"share.mp4"
                                            url:nil
                                     thumbImage:nil
                                          image:nil
                                          video:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]
                                       fileData:nil
                                           type:SSDKContentTypeVideo];
        [ShareSDK share:SSDKPlatformTypeWework parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeworkShareFileWithCommonParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:nil
                                        images:nil
                                           url:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]]
                                         title:@"share.mp3"
                                          type:SSDKContentTypeFile];
        [ShareSDK share:SSDKPlatformTypeWework parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}

- (void)testWeworkShareFileWithCustomParams
{
    [self _wait:20 testOperation:^(void (^terminate)(void)) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupWeWorkParamsByText:nil
                                          title:@"share.mp3"
                                            url:nil
                                     thumbImage:nil
                                          image:nil
                                          video:nil
                                       fileData:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]
                                           type:SSDKContentTypeFile];
        [ShareSDK share:SSDKPlatformTypeWework parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            XCTAssertNil(error);
            terminate();
        }];
    }];
}


#pragma mark - 短链

- (void)testConvertUrl
{
    [self _wait:100 testOperation:^(void (^terminate)(void)) {
        
        SSDKPlatformType type = SSDKPlatformTypeWechat;
        
        NSArray *urls = @[@"https://leancloud.cn/",@"http://www.cocoachina.com/",@"http://image.baidu.com/search/detail?z=0&word=%E6%91%84%E5%BD%B1%E5%B8%88JannesC&hs=0&pn=0&spn=0&di=0&pi=55976035672&tn=baiduimagedetail&is=0%2C0&ie=utf-8&oe=utf-8&cs=279866240%2C1701301546&os=&simid=&adpicid=0&lpn=0&fm=&sme=&cg=&bdtype=-1&oriquery=&objurl=http%3A%2F%2Fa.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F8694a4c27d1ed21b567175dda06eddc451da3f49.jpg&fromurl=&gsm=0&catename=pcindexhot&islist=&querylist="];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            ((void(*)(id, SEL, NSArray *, SSDKUser *,SSDKPlatformType, void(^)(NSArray *, NSError *)))objc_msgSend)(ShareSDK.class, NSSelectorFromString(@"getShortUrls:user:platformType:result:"), urls, nil, type, ^(NSArray *urls, NSError *error){
                
                NSLog(@"------->%@",urls);
                XCTAssertNil(error);
                terminate();
            });
        });
    }];
}

#pragma mark - Privite

- (void)_wait:(NSTimeInterval)delay testOperation:(void(^)(void(^terminate)(void)))operation
{
    XCTestExpectation *expectation = [self expectationWithDescription:self.name];
    
    operation(^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [expectation fulfill];
        });
    });
    
    [self waitForExpectations:@[expectation] timeout:delay];
}

@end
