# iOS Getting Started Guide

## Step1: The ShareSDK into your project. 

* Login ShareSDK official website to download and extract the latest version of the SDK. If you have not downloaded yet, please [click here](http://sharesdk.cn/Download) to download or access http://sharesdk.cn/Download. After extracting the following diagram

![img](http://getsharesdk.com/doc/images/c/ca/ios_doc_001.png)

* Put the ShareSDK framework directory into your project

Decompress the SDK download archive. Directly drag ShareSDK directory to the project, as shown:

![img](http://getsharesdk.com/doc/images/c/cc/ios_doc_002.png)

After dragging the project, the following dialog box, check the "Copy items into destination group's folder (if needed)", and click "Finish" button, as

![img](http://getsharesdk.com/doc/images/4/4b/ios_doc_003.png)

After importing the final results as shown below:

![img](http://getsharesdk.com/doc/images/e/e6/ios_doc_004.png)

> Note: Be sure to select "Create groups for any added folders" radio button group in the steps above. If you choose the "Create folder references for any added folders", a reference to a blue folder will be added to the project and can not find its resources.

## Step2: Add dependency

Add the following framework to your project:

```
SystemConfiguration.framework

QuartzCore.framework

CoreTelephony.framework

libicucore.dylib

libz.1.2.5.dylib

libstdc++.dylib        if not use the SSO Login of QZone or QQ Friend share can not add.

libsqlite3.dylib        if not use the SSO Login of QZone or QQ Friend share can not add.

Security.framework        if not use the SSO Login of QZone or QQ Friend share or Google+ can not add.

CoreMotion.framework        if not use Google+ can not add

CoreLocation.framework        if not use Google+ can not add

MediaPlayer.framework        if not use Google+ can not add

CoreText.framework        if not use Google+ can not add

AssetsLibrary.framework        if not use Google+ can not add

MessageUI.framework        if not use Mail or SMS can not add
```

Adding steps shown below:

![img](http://getsharesdk.com/doc/images/6/63/ios_doc_005.jpg)

## Step3: Import the header files and registry ShareSDK AppKey

* Login ShareSDK official website add applications and get AppKey. If you have not yet registered, please [click here to register](http://sharesdk.cn/Customer/register)

* Initialization ShareSDK

Open *AppDelegate.m (* represents your project name), import ShareSDK.h header file:

```
#import <ShareSDK/ShareSDK.h>
```

In the - (BOOL) application: didFinishLaunchingWithOptions: method calls registerApp method to initialize the SDK

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [ShareSDK registerApp:@"api20"];     // Parameter is the AppKey that added ShareSDK application from the official website
    
    //……
    return YES;
}
```

## Step4: Configure the socialization platform AppKeys

In the - (BOOL) application: didFinishLaunchingWithOptions: method, add the following statement to the application of social platform for each set.

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //……

    //Initialize SinaWeibo Application
    [ShareSDK connectSinaWeiboWithAppKey:@"3201194191"
                             appSecret:@"0334252914651e8f76bad63337b3b78f"
                             redirectUri:@"http://appgo.cn"];

    //Initialize TencentWeibo Application
    [ShareSDK connectTencentWeiboWithAppKey:@"801307650"
                             appSecret:@"ae36f4ee3946e1cbb98d6965b0b2ff5c"
                             redirectUri:@"http://www.sharesdk.cn"];

    //Initialize QZone Application
    [ShareSDK connectQZoneWithAppKey:@"100371282"
                             appSecret:@"aed9b0303e3ed1e27bae87c33761161d"];

    //Initialize NetEase Weibo Application
    [ShareSDK connect163WeiboWithAppKey:@"T5EI7BXe13vfyDuy"
                             appSecret:@"gZxwyNOvjFYpxwwlnuizHRRtBRZ2lV1j"
                             redirectUri:@"http://www.shareSDK.cn"];

    //Initialize Sohu Weibo Application
    [ShareSDK connectSohuWeiboWithConsumerKey:@"SAfmTG1blxZY3HztESWx"
                             consumerSecret:@"yfTZf]!rVwh*3dqQuVJVsUL37!F}!yS9S!Orcsij"
                             redirectUri:@"http://www.sharesdk.cn"};   

    //Initialize DouBan Application
    [ShareSDK connectDoubanWithAppKey:@"07d08fbfc1210e931771af3f43632bb9"
                             appSecret:@"e32896161e72be91"
                             redirectUri:@"http://dev.kumoway.com/braininference/infos.php"];

    //Initialize RenRen Application
    [ShareSDK connectRenRenWithAppKey:@"fc5b8aed373c4c27a05b712acba0f8c3"
                             appSecret:@"f29df781abdd4f49beca5a2194676ca4"];

    //Initialize KaiXin Application
    [ShareSDK connectKaiXinWithAppKey:@"358443394194887cee81ff5890870c7c"
                             appSecret:@"da32179d859c016169f66d90b6db2a23"
                             redirectUri:@"http://www.sharesdk.cn/"];

    //Initialize Instapaper Application
    [ShareSDK connectInstapaperWithAppKey:@"4rDJORmcOcSAZL1YpqGHRI605xUvrLbOhkJ07yO0wWrYrc61FA"
                             appSecret:@"GNr1GespOQbrm8nvd7rlUsyRQsIo3boIbMguAl9gfpdL0aKZWe"];

    //Initialize YouDaoNote Application
    [ShareSDK connectYouDaoNoteWithConsumerKey:@"dcde25dca105bcc36884ed4534dab940"
                             consumerSecret:@"d98217b4020e7f1874263795f44838fe"
                             redirectUri:@"http://www.sharesdk.cn/"];

    //Initialize Facebook Application
    [ShareSDK connectFacebookWithAppKey:@"107704292745179"
                             appSecret:@"38053202e1a5fe26c80c753071f0b573"];
    
    //Initialize Twitter Application
    [ShareSDK connectTwitterWithConsumerKey:@"mnTGqtXk0TYMXYTN7qUxg"
                             consumerSecret:@"ROkFqr8c3m1HXqS3rm3TJ0WkAJuwBOSaWhPbZ9Ojuc"
                             redirectUri:@"http://www.sharesdk.cn"];

    //Initialize Sohu SuiShenKan Application
    [ShareSDK connectSohuKanWithAppKey:@"e16680a815134504b746c86e08a19db0"
                             appSecret:@"b8eec53707c3976efc91614dd16ef81c"
                             redirectUri:@"http://sharesdk.cn"];
    
    //Initialize Pocket Application
    [ShareSDK connectPocketWithConsumerKey:@"11496-de7c8c5eb25b2c9fcdc2b627"
                             redirectUri:@"pocketapp1234"];
    
    //Initialize Evernote Application
    [ShareSDK connectEvernoteWithType:SSEverNoteTypeSandbox
                             consumerKey:@"sharesdk-7807"
                             consumerSecret:@"d05bf86993836004"];

    //Initialize LinkedIn Application
    [ShareSDK connectLinkedInWithApiKey:@"ejo5ibkye3vo"
                             secretKey:@"cC7B2jpxITqPLZ5M"
                             redirectUri:@"http://sharesdk.cn"];

    //……
}
```

> Note: You can integrate the platform according to their needs to select some platform initialization. AppKey specified in the configuration information needed to relevant social platform to get registered by the application.

## Step5: Set rootViewController property

In the - (BOOL) application: didFinishLaunchingWithOptions: method to check settings window object rootViewController property. If not, then set. Similar to the following code:

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //……

    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];

    self.viewController = [[[UINavigationController alloc] init] autorelease];       
    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];

    return YES;
}

```

> Note: You must set rootViewController, otherwise it will lead to the pop-up authorized interface or share interface without reflecting by clicked, stuck phenomena. If you create using storyBoard application can omit this step, the system will automatically set rootViewController.

## Step6: Share Content

First, you need to create a content object that is used to specify what needs to share in the social platform. Then be shared through showShareActionSheet methods. share content usually after the ViewDidAppear event, in response to a user action for the method, such as: a method in response to the button press. Code is as follows:

```
NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"ShareSDK"  ofType:@"jpg"];
    
//Create a share content
id<ISSContent> publishContent = [ShareSDK content:@"Share Content"
                                          defaultContent:@" The default share content. No content displayed"
                                          image:[ShareSDK imageWithPath:imagePath]
                                          title:@"ShareSDK"
                                          url:@"http://www.sharesdk.cn"
                                          description:@"This is a test message"
                                          mediaType:SSPublishContentMediaTypeNews];

[ShareSDK showShareActionSheet:nil
                     shareList:nil
                     content:publishContent
                     statusBarTips:YES
                     authOptions:nil
                     shareOptions: nil
                     result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                               if (state == SSResponseStateSuccess)
                                               {
                                                       NSLog(@"Share Success!");
                                               }
                                               else if (state == SSResponseStateFail)
                                               {
                                                       NSLog(@"Share Fail,Error code:%d,Error description:%@", [error errorCode], [error errorDescription]);
                                               }
                            }];
```

Operating results as shown below:

![img](http://getsharesdk.com/doc/images/9/91/ios_doc_006.png)

![img](http://getsharesdk.com/doc/images/3/3d/ios_doc_007.png)

Click to [download the code](https://github.com/ShareSDKPlatform/ShareSDKIntegrationSample-for-iOS/archive/master.zip).

## Option: Share menu integration for iPad

If you need to display on the iPad, you need to use the + container; method to create a container object and call setIPadContainer series method to set the iPad container.

In general, we recommend the use a child view of ViewController as the "anchor" to set the container. For example an existing button. This share interface or authorization interface to display correctly.

Its implementation code as follows:

```
id<ISSContainer> container = [ShareSDK container];
[container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
```

Then the container object passed in the first parameter of the showShareActionSheet method. such as:

```
//Pop-up the share menu
[ShareSDK showShareActionSheet:container
                         shareList:nil
                         content:publishContent
                         statusBarTips:YES
                         authOptions:authOptions
                         shareOptions:shareOptions
                         result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSResponseStateSuccess)
                                {
                                    NSLog(@"Share Success!");
                                }
                                else if (state == SSResponseStateFail)
                                {
                                    NSLog(@"Share Fail,Error code:%d,Error description:%@", [error errorCode], [error errorDescription]);
                                }
                            }];
```

## Option: Use server hosting mode initialization SDK

To use the hosted mode can put the AppKey of social platforms into ShareSDK server hosting, no need to initialize the social platform information in native code. Configure the application information in the following figure:

![img](http://getsharesdk.com/doc/images/8/83/ios_doc_008.png)

Open *AppDelegate.m (* represents your project name), Import the ShareSDK.h file header

```
#import <ShareSDK/ShareSDK.h>
```

In the - (BOOL) application: didFinishLaunchingWithOptions: method calls registerApp method to initialize the SDK

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [ShareSDK registerApp:@"api20" useAppTrusteeship:YES];    //参数为ShareSDK官网中添加应用后得到的AppKey
    
    //……

    return YES;
}
```

> Note: If you have previously been operated in step 3 to initialize, please change registerApp: method to registerApp: useAppTrusteeship: method. And methods useAppTrusteeship parameter is set to YES, to activate hosted mode.

When using the server hosting the configuration information to initialize, due to get information from the server has a certain time delay, so as to ensure that you can call the relevant function after initialized platform, SDK provides a waitAppSettingComplete methods used to perform related operations wait for set completion of the App information. Its usage is as follows:

```
[ShareSDK waitAppSettingComplete:^{

        // Calls the ShareSDK API

}];
```

## Option: Configure WeChat Platform

There is a [WeChat platform integration examples](https://github.com/ShareSDKPlatform/ShareSDKWeChatIntegrationSample) available for download.

Login WeChat open platform (http://open.weixin.qq.com/). Registration application and obtain the AppID, open *-Info.plist (* represents your project name). Add a WeChat callback URL Scheme, The format is: WeChat AppID (eg: wx4868b35061f87885). Procedure as shown:

![img](http://getsharesdk.com/doc/images/7/75/ios_doc_009.png)

Open * AppDelegate.m (* represents your project name), import WeChat SDK header file:

```
#import "WXApi.h"
```

Check whether the handleOpenURL method added, if not then add the following code:

```
- (BOOL)application:(UIApplication *)application  handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url
                            wxDelegate:self];
}

- (BOOL)application:(UIApplication *)application
                openURL:(NSURL *)url
                sourceApplication:(NSString *)sourceApplication
                annotation:(id)annotation
{
    return [ShareSDK handleOpenURL:url
                   sourceApplication:sourceApplication
                   annotation:annotation
                   wxDelegate:self];
}
```

* Native code initialization

In - application: didFinishLaunchingWithOptions: method add the following statement:

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
       //...

       //Initialize WeChat Application
      [ShareSDK connectWeChatWithAppId:@"wx6dd7a9b94f3dd72a"  // This parameter is the AppID of WeChat Application
                             wechatCls:[WXApi class] ];
      //...
}
```

* Server hosting mode initialization

In this mode does not require initialize the application configuration by native code. Since need to rely on WeChat SDK to share, so you need to import the WeChat SDK classes. In - application: didFinishLaunchingWithOptions: method, add the following statement:

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
       //...

      // Importing WeChat SDK, if you do not share the WeChat can not call this method
      [ShareSDK importWeChatClass:[WXApi class] ];

       //...
}
```

## Option: Configure QQ Platform

Login QQ Connect website (http://connect.qq.com/). Registered as a developer and registration applications made AppId (can be used the configure QZone application Id). Open *-Info.plist(* represents your project name). Add a callback for QQ client URL Scheme. in the format: "QQ" + AppId hexadecimal number (hexadecimal number conversion is not enough if appId 8 in leading zeros, such as the conversion is: 5FB8B52, then eventually fill as: QQ05FB8B52). Procedure as shown:

![img](http://getsharesdk.com/doc/images/7/75/ios_doc_009.png)

Then open the project * AppDelegate.m (* represents your project name) file, import QQSDK header file:

```
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
```

Check whether the method handleOpenURL added, if not then add the following code:

```
- (BOOL)application:(UIApplication *)application  handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url
                            wxDelegate:self];
}

- (BOOL)application:(UIApplication *)application
                openURL:(NSURL *)url
                sourceApplication:(NSString *)sourceApplication
                annotation:(id)annotation
{
    return [ShareSDK handleOpenURL:url
                   sourceApplication:sourceApplication
                   annotation:annotation
                   wxDelegate:self];
}
```

* Native code initialization:

In - (BOOL)application: didFinishLaunchingWithOptions: method, Add the following statement:

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
        //...

        //Initialize QQ Platform
        [ShareSDK connectQQWithQZoneAppKey:@"100371282"                 //Fill in the application of QQ AppId
                         qqApiInterfaceCls:[QQApiInterface class]
                           tencentOAuthCls:[TencentOAuth class] ];

        //...
}
```

* Server hosting mode initialization

In this mode does not require initialize the application configuration by native code. Since need to rely on QQ SDK to share, so you need to import the QQ SDK classes. In - application: didFinishLaunchingWithOptions: method, add the following statement:

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
        //...

        //Importing QQ Connect and QQ friends require external libraries type, and if you do not QZone SSO and QQ friends to share can not call this method
        [ShareSDK importQQClass:[QQApiInterface class] 
                tencentOAuthCls:[TencentOAuth class] ];


        //...
}
```

> Note: The mobile QQ developer platform registered appId, when initializing need to use -connectQQWithAppId:qqApiCls: method.

## Option: Configure Google+ Platform

Login Google+ Developer Platform (https://code.google.com/apis/console/) Register the application and get the ClientID.

Confirm whether GoogleOpenSource.framework and GooglePlus.framework have been added to the project. if not, from ShareSDK package Extend directory to GooglPlusSDK dragged into the project directory. As shown:

![img](http://getsharesdk.com/doc/images/3/39/ios_doc_010.png)

Open the Build Settings, add -ObjC to Other linker flags. Procedure as shown:

![img](http://getsharesdk.com/doc/images/c/c1/ios_doc_011.jpg)

Open (* represents your project name) *-Info.plist. Add a URL Scheme for Google+ callback client, in the format: BundleID (eg cn.appgo.sharebyone). Meanwhile URL identifier also need to fill BundleID. Procedure as shown:

![img](http://getsharesdk.com/doc/images/a/a6/ios_doc_012.jpg)

Then open the project * AppDelegate.m (* represents your project name) file. Importing Google+ header files:

```
#import <GoogleOpenSource/GoogleOpenSource.h>
#import <GooglePlus/GooglePlus.h>
```

Check whether the method handleOpenURL added, if not then add the following code:

```
- (BOOL)application:(UIApplication *)application  handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url
                            wxDelegate:self];
}

- (BOOL)application:(UIApplication *)application
                openURL:(NSURL *)url
                sourceApplication:(NSString *)sourceApplication
                annotation:(id)annotation
{
    return [ShareSDK handleOpenURL:url
                   sourceApplication:sourceApplication
                   annotation:annotation
                   wxDelegate:self];
}
```

* Native code initialization:

In - application: didFinishLaunchingWithOptions: method Add the following statement:

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
       //...

       //Initialize Google+ Platform
       [ShareSDK connectGooglePlusWithClientId:@"232554794995.apps.googleusercontent.com"        //Fill in the ClientID of application 
                                             clientSecret:@"PEdFgtrMw97aCvf0joQj7EMk"                                          //Fill in the ClientSecret of application
                                             redirectUri:@"http://localhost"                                                               //Redirect uri
                                             signInCls:[GPPSignIn class]
                                             shareCls:[GPPShare class] ];

       //...
}
```

* Server hosting mode initialization

In this mode does not require initialize the application configuration by native code. Since need to rely on Google+ SDK to share, so you need to import the Google+ SDK classes. In - application: didFinishLaunchingWithOptions: method, add the following statement:

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
       //……

       [ShareSDK importGooglePlusClass:[GPPSignIn class]
                            shareClass:[GPPShare class] ];

       //……
}
```

> Note: integration of this platform, the system can only run on iOS 5.0 version above.

## Option: Configure Pinterest Platform

Login Pinterest Developer Platform (http://developers.pinterest.com/) registration application and get the ClientID.

Confirm whether Pinterest.framework been added to the project, if not from ShareSDK package Extend directory to Pinterest.embeddedframework dragged into the project directory. Figure:

![img](http://getsharesdk.com/doc/images/f/f9/ios_doc_013.png)

Open *-Info.plist (* represents your project name). Find the URL types configuration items (if not then add), in the URL types -- URL Schemes add a Scheme for Pinterest's (if not add will cause not return application). The format is: pin + clientID (which you are applying in Pinterest clientID). Such as: pin1432928. As shown:

![img](http://getsharesdk.com/doc/images/e/e5/ios_doc_014.jpg)

Then open *AppDelegate.m (* represents your project name) file, import Pinterest header files:

```
#import <Pinterest/Pinterest.h>
```

Check whether the method handleOpenURL added, if not then add the following code:

```
- (BOOL)application:(UIApplication *)application  handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url
                            wxDelegate:self];
}

- (BOOL)application:(UIApplication *)application
                openURL:(NSURL *)url
                sourceApplication:(NSString *)sourceApplication
                annotation:(id)annotation
{
    return [ShareSDK handleOpenURL:url
                   sourceApplication:sourceApplication
                   annotation:annotation
                   wxDelegate:self];
}
```

* Native code initialization:

In - application: didFinishLaunchingWithOptions: method add the following statement:

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
       //...

       //Initialize Pinterest
       [ShareSDK connectPinterestWithClientId:@"1432928"       //This parameter is the application ClientID
                                pinterestCls:[Pinterest class] ];


       //...
}
```

* Server hosting mode initialization

In this mode does not require initialize the application configuration by native code. Since need to rely on Pinterest SDK to share, so you need to import the Pinterest SDK classes. In - application: didFinishLaunchingWithOptions: method, add the following statement:

```
[ShareSDK importPinterestClass:[Pinterest class] ];
```

## Option: Configure YiXin Platform

Login YiXin open platform (http://open.yixin.im/) registration application and get the AppID, open *-Info.plist (* represents your project name). Add a URL Scheme for the client callback, in the format: YiXin AppID (eg: yx0d9a9f9088ea44d78680f3274da1765f). Procedure as shown:

![img](http://getsharesdk.com/doc/images/7/75/ios_doc_009.png)

Open * AppDelegate.m (* represents your project name) file, import YiXin SDK header file:

```
#import "YXApi.h"
```

Check whether the method handleOpenURL added, if not then add the following code:

```
- (BOOL)application:(UIApplication *)application  handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url
                            wxDelegate:self];
}

- (BOOL)application:(UIApplication *)application
                openURL:(NSURL *)url
                sourceApplication:(NSString *)sourceApplication
                annotation:(id)annotation
{
    return [ShareSDK handleOpenURL:url
                   sourceApplication:sourceApplication
                   annotation:annotation
                   wxDelegate:self];
}
```

* Native code initialization:

In - application: didFinishLaunchingWithOptions: method add the following statement:

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
       //……

       //Initialize YiXin Platform
       [ShareSDK connectYiXinWithAppId:@"yx0d9a9f9088ea44d78680f3274da1765f"
                             yixinCls:[YXApi class] ];

      //……
}
```

* Server hosting mode initialization

In this mode does not require initialize the application configuration by native code. Since need to rely on YiXin SDK to share, so you need to import the YiXin SDK classes. In - application: didFinishLaunchingWithOptions: method, add the following statement:

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
       //……

      //Importing YiXin needs external library type, if you do not share the YIXin can not call this method
      [ShareSDK importYiXinClass:[YXApi class] ];

       //……
}
```
