ShareSDK is the most comprehensive social SDK in the world , which share easily with 40+ platforms , from around the world.This wiki mainly tells how to easily and fastly integrate ShareSDK.

(中文文档：http://wiki.mob.com/%E5%BF%AB%E9%80%9F%E9%9B%86%E6%88%90%E6%8C%87%E5%8D%97/)


# How to integrate ShareSDK easily

## Step 1：Import the ShareSDK to your project

* 1、Download the latest version of the ShareSDK, then you will get the following files.

![img](http://www.mob.com/html/images/github/sharesdk-integrate-1.png)

* 2、Select the ShareSDK file and drag into your project (or just holding down the Control key on your keyboard and click your project,namely right-click your project, and choose “Add Files to …”).

then you will see the following window, check the "Copy items into destination group's folder (if needed)" and click "Finish" button.

![img](http://www.mob.com/html/images/github/sharesdk-integrate-2.png)

* 3、Now you have added the ShareSDK file to your project and it will look like this:

![img](http://www.mob.com/html/images/github/sharesdk-integrate-3.png)

## Step 2：add the necessary Framework

**Indispensable Framework：**

1. SystemConfiguration.framework  
2. QuartzCore.framework  
3. CoreTelephony.framework  
4. libicucore.dylib 
5. libz.1.2.5.dylib
6. Security.framework
7. JavaScriptCore.framework
8. libstdc++.dylib
9. CoreText.framework

**Optional Framework：**

necessary for the SSO Login of Sina weibo

1. ImageIO.framework

necessary for the SSO Login of Tencent weibo（iOS6.0+）

1. Social.framework        
2. Accounts.framework 

necessary for the SSO Login of QZone or QQ Friend share

1. libsqlite3.dylib   

necessary for Mail or SMS

1. MessageUI.framework   

necessary for Google+ platform 

1. CoreMotion.framework        
2. CoreLocation.framework      
3. MediaPlayer.framework      
4. AssetsLibrary.framework  
      
The steps of adding the framework:

![img](http://www.mob.com/html/images/github/sharesdk-integrate-4.png)


## Step3: import the header files and register for a Appkey

* 1、Log in to http://reg.sharesdk.cn/ to register to be a Mob developer , and click [here](http://dashboard.mob.com/ShareSDK#/) to create a Mob application, then you will get the Appkey.

* 2、Open AppDelegate.m to import the .h file 

```
#import <ShareSDK/ShareSDK.h>
```

and add the initialize code to the -(BOOL)application: didFinishLaunchingWithOptions: method 
```
-	(BOOL)application:(UIApplication )application didFinishLaunchingWithOptions:(NSDictionary )launchOptions 
{     
       [ShareSDK registerApp:@"***"]; // *** is the AppKey that you just got 
       //……     
       return YES; 
}

```

## Step 4：choose the platforms that you need and initialize them

Add the the initialized codes of platform that you need to the -(BOOL) application: didFinishLaunchingWithOptions: method

```
-	(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{     
[ShareSDK registerApp:@"***"];  //you just added it

//… … 

//Initialize SinaWeibo Application 
[ShareSDK connectSinaWeiboWithAppKey:@"3201194191"                              
appSecret:@"0334252914651e8f76bad63337b3b78f"                              
redirectUri:@"http://appgo.cn"];      
   
//Initialize QZone Application 
[ShareSDK connectQZoneWithAppKey:@"100371282"                              
appSecret:@"aed9b0303e3ed1e27bae87c33761161d"];   

//Initialize Facebook Application 
[ShareSDK connectFacebookWithAppKey:@"107704292745179"                              
appSecret:@"38053202e1a5fe26c80c753071f0b573"];   
  
//Initialize Twitter Application 
[ShareSDK connectTwitterWithConsumerKey:@"mnTGqtXk0TYMXYTN7qUxg"                              
consumerSecret:@"ROkFqr8c3m1HXqS3rm3TJ0WkAJuwBOSaWhPbZ9Ojuc"                              
redirectUri:@"http://www.sharesdk.cn"];    

//… … 
return YES;
}

}
```

> PS:the parameters of above connect… method are relevant with the social platform.If you don’t have the platform’ application, then you should go that platform and create one.

## Step 5：point out the rootViewController

If you create the project with storyboard ,then just ignore this step,
the system will set the rootViewController automatically.

Otherwise,you must set the rootViewController in the -(BOOL)application:
didFinishLaunchingWithOptions: method,or it may cause some error(s). The codes may look like this:

```
-	(BOOL)application:(UIApplication )application didFinishLaunchingWithOptions:(NSDictionary )launchOptions 
{     
//……      
self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen    
mainScreen] bounds]] autorelease];      
self.viewController = [[[UINavigationController alloc] init]
autorelease];             
self.window.rootViewController = self.viewController;     
[self.window makeKeyAndVisible];
       return YES; 
}

```

## Step 6：construct the share content and share it

* 1、Create an object that conforms to ISSContent protocol. Please refer to ShareSDK.h in ShareSDK.framework or ShareSDKDemo to get the specific usage.

* 2、To show the share content view ,you need to call the showShareActionSheet… method.

* 3、Share content event usually goes after the ViewDidAppear event, in response to some action(such as a button is pressed). If you really would like to click the button and show the share content view,then you may add the following codes to the buttonPressed method.

```
NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"ShareSDK"  ofType:@"jpg"];  //make sure you actually have the picture in your project

//Create a share content object
id<ISSContent> publishContent = [ShareSDK content:@"Share Content"                                           
          defaultContent:@" The default share content. No content displayed"                                                            
image:[ShareSDK imageWithPath:imagePath]                                              
title:@"ShareSDK"                                          
  url:@"http://www.sharesdk.cn"                                           
description:@"This is a test message"                                             
  mediaType:SSPublishContentMediaTypeNews];

//show share content view 
[ShareSDK showShareActionSheet:nil                     
                       shareList:nil                     
                         content:publishContent         
                  statusBarTips:YES                      
                    authOptions:nil                      
                   shareOptions: nil                     
                          result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) 
{                                                
if (state == SSResponseStateSuccess)                                                            
{                                         
             NSLog(@"Share Success!");                                        
       }                                         
else if (state == SSResponseStateFail)                                                      
{                                         
NSLog(@"Share Fail,Error code:%d,Error description:%@", [error  
errorCode], [error errorDescription]);                                                
       }                             
}];

```

Congratulations!you make it and the result may look like the following snapshop.

![img](http://www.mob.com/html/images/github/sharesdk-integrate-5.png)

![img](http://www.mob.com/html/images/github/sharesdk-integrate-6.png)


## Option 1：The way to share content for iPad 

* 1、If you need to use ShareSDK on the iPad,you need to use the +container method of ShareSDK class to create an object that conforms to ISSContainer protocol. 
and call setIPadContainer series method to set the iPad container.

* 2、In general, we recommend you to use a child view of ViewController as the "anchor" to be the container. It can be an button、custom view etc. Only in this way do the share view and authorization view display correctly.

* 3、Call the showShareActionSheet… method. And notice that the above container object should be one of the parameters. Here is an example:

```
//1,Create a container object
id<ISSContainer> container = [ShareSDK container]; 

//2,set the iPad container(in this example sender is a button)
[container setIPadContainerWithView:sender  
                          arrowDirect:UIPopoverArrowDirectionUp];

//3,Pop-up the share menu 
[ShareSDK showShareActionSheet:container                          
                   shareList:nil       
                     content:publishContent         
              statusBarTips:YES                         
                authOptions:authOptions                        
               shareOptions:shareOptions                          
                      result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) 
{                                 
     if (state == SSResponseStateSuccess)                                 
     {                                     
         NSLog(@"Share Success!");                                 
     }                                 
     else if (state == SSResponseStateFail)                                 
     {                                     
         NSLog(@"Share Fail,Error code:%d,Error description:%@", 
         [error errorCode], [error errorDescription]);                                 
     }                             
}]; 
```

## Option 2：Use “The Sever Hosting” Mode to initialize SDK

* 1、The Sever Hosting mode is a way that never need to initialize the social platform information in code any more.You can just set the social platform informations(such as Appkey、AppSecret etc) in mob management background system(http://dashboard.mob.com/). And it looks like this:

![img](http://www.mob.com/html/images/github/sharesdk-integrate-7.png)

* 2、Here are the codes that replace the Step 3 and Step 4 to initialize the ShareSDK and social platforms:

```
#import <ShareSDK/ShareSDK.h>
```

```
-	(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{     
//[ShareSDK registerApp:@"***"]; // *** is the Appkey of Mob app

// Here is the way of using The Sever Hosting mode
//the parameter YES means use The Sever Hosting mode
      [ShareSDK registerApp:@"***" useAppTrusteeship:YES];    
      //……      
      return YES; 
}
```
* 3、When changing the configuration information of Mob application in The Server Hosting mode, it needs some time(about 15 minutes) to really get worked. 
SDK provides a waitAppSettingComplete methods to make sure the change is getting works.You can use it like this: 

```
[ShareSDK waitAppSettingComplete:^{          
      // Calls the ShareSDK API  
}];
```

## Option 3：the specific way to integrate WeChat

* 1、Log in to WeChat open platform (http://open.weixin.qq.com/) to become a WeChat developer and create a application to get the app’s AppID,AppSecret.

* 2、Back to your project,choose the -Info.plist (- represents your project name) file. Add a WeChat URL Scheme key, the value is WeChat AppID (eg: wx4868b35061f87885). Here is a example:


![img](http://www.mob.com/html/images/github/sharesdk-integrate-8.png)

* 3、Open  -AppDelegate.m ( -represents your project name), import WeChat SDK’s header file:

```
#import "WXApi.h"
```

Check whether the handleOpenURL method had been added, if not then add the following codes(in AppDelegate.m file):

```
-	(BOOL)application:(UIApplication *)application  handleOpenURL:(NSURL *)url 
{     
return [ShareSDK handleOpenURL:url wxDelegate:self]; 
} 

 - (BOOL)application:(UIApplication *)application                 openURL:(NSURL *)url   sourceApplication:(NSString *)sourceApplication                 annotation:(id)annotation 
{     
      return [ShareSDK handleOpenURL:url       
sourceApplication:sourceApplication                      
        annotation:annotation         
        wxDelegate:self]; 
}
```

* 4、Native code mode

There are 2 methods to share content to WeChat,but if you want to use WeChat account to authorize and get the user’s information ,you need to use the method with appSecret parameter.

```
-	(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{        
      //...         
//Initialize WeChat Application 
//The parameter “wx6dd7a9b94f3dd72a” is the AppID of WeChat App   
//[ShareSDK connectWeChatWithAppId:@"wx6dd7a9b94f3dd72a"                                 
//                         wechatCls:[WXApi class]];     

//you can use WeChat account to authorize using this method
[ShareSDK connectWeChatWithAppId:@"wx4868b35061f87885"
                      appSecret:@"64020361b8ec4c99936c0e3999a9f249"  
                      wechatCls:[WXApi class]];
      
      //... 
}

```

* 5、The Server hosting mode

There’s not need to initialize the application configuration by code in this mode. Since ShareSDK relies on WeChat SDK to share, so you still need to  add a line of code in - application: didFinishLaunchingWithOptions: method, to import the WeChat SDK classes. Here is the example:

```
-	(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{        
//...        
// Add the WeChat SDK if your project or ShareSDK still don’s have one
      [ShareSDK importWeChatClass:[WXApi class] ];         
//... 
}
```

## Option 4：the specific way to integrate QQ 

* 1、Log in to Open QQ platform (http://open.qq.com/)to become a developer and create a application to get the app’s AppID.

* 2、Back to your project, choose the -Info.plist (- represents your project name) file. Add a URL Scheme for key, the value’s format is: "QQ" +the hexadecimal number of AppID (if the length of hexadecimal number is less than 8,then fill with zero to make sure the length is 8). Here is a example,if the hexadecimal number of your AppID is 5FB8B52,then the final value of the URL Scheme is QQ05FB8B52.


![img](http://www.mob.com/html/images/github/sharesdk-integrate-9.png)

* 3、Open  -AppDelegate.m ( -represents your project name), import QQSDK
SDK header file:

```
#import <TencentOpenAPI/QQApiInterface.h> 
#import <TencentOpenAPI/TencentOAuth.h>
```

Check whether the handleOpenURL method  is added, if not then add the following codes(in AppDelegate.m file):

```
-	(BOOL)application:(UIApplication *)application  handleOpenURL:(NSURL *)url 
{     
return [ShareSDK handleOpenURL:url wxDelegate:self]; 
} 

- (BOOL)application:(UIApplication *)application                 openURL:(NSURL *)url   sourceApplication:(NSString *)sourceApplication                 annotation:(id)annotation 
{     
      return [ShareSDK handleOpenURL:url       
sourceApplication:sourceApplication                      
        annotation:annotation         
        wxDelegate:self]; 
}
```

* 4、Native code mode

Add the codes in -(BOOL)application: didFinishLaunchingWithOptions: method

```
-	(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{        
      //...        
//Initialize QQ Platform  
//The parameter “100371282” is the AppID of QQ App   
[ShareSDK connectQQWithQZoneAppKey:@"100371282"                                              
                   qqApiInterfaceCls:[QQApiInterface class]                            
                     tencentOAuthCls:[TencentOAuth class] ];
      
      //... 
}
```

* 5、The Server hosting mode

There’s not need to initialize the application configuration by code in this mode. Since ShareSDK relies on QQ SDK to share, so you still need to add a line of code in- application: didFinishLaunchingWithOptions: method, to import the QQ SDK classes. Here is the example:

```
-	(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{        
      //...        
// Add the QQ SDK if your project or ShareSDK still don’s have one 
[ShareSDK importQQClass:[QQApiInterface class]                   
         tencentOAuthCls:[TencentOAuth class] ];          
      //... 
}
```

## Option 5：the specific way to integrate Google+ 

* 1、	Log in to Google+ Developer platform to become a developer
(https://code.google.com/apis/console/) and create a application to get the app’s ClientID、ClientSecret、redirectUri etc.

* 2、Back to your project , add “-ObjC” to Other linker flags. Here are steps:


![img](http://www.mob.com/html/images/github/sharesdk-integrate-10.png)

* 3、Back to your project , choose the -Info.plist (- represents your project name) file. Add a Google+ URL Scheme key and a URL identifier key, the value both are the BundleID (eg cn.appgo.sharebyone). Here are steps:

![img](http://www.mob.com/html/images/github/sharesdk-integrate-11.png)

* 4、Open  -AppDelegate.m ( -represents your project name), import Google+
SDK header file:

```
#import <GoogleOpenSource/GoogleOpenSource.h>
#import <GooglePlus/GooglePlus.h>
```
Check whether the handleOpenURL method had been added, if not add the following codes(in AppDelegate.m file):

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

* 5、Native code mode

Add the codes in -(BOOL)application: didFinishLaunchingWithOptions: method

```
-	(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{        
      //...        
//Initialize Google+ Platform  
//the Google+ app’s ClientID、ClientSecret、redirectUri 
      [ShareSDK connectGooglePlusWithClientId:
                 @"232554794995.apps.googleusercontent.com"                                                  
                 clientSecret:@"PEdFgtrMw97aCvf0joQj7EMk"                                                                                        
                 redirectUri:@"http://localhost"                                                                                                            
                 signInCls:[GPPSignIn class]                                               
                 shareCls:[GPPShare class] ];
      
      //... 
}
```

* 6、The Server hosting mode

There’s not need to initialize the application configuration by code in this mode. Since ShareSDK relies on Google+ SDK to share, so you still need to  add a line of code in - application: didFinishLaunchingWithOptions: method, to import the Google+ SDK classes. Here is the example:

```
-	(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{        
      //...        
// Add the Google+ SDK if your project or ShareSDK still don’s have one 
[ShareSDK importGooglePlusClass:[GPPSignIn class]                              
                       shareClass:[GPPShare class] ];
      //... 
}

```

## Option 6：the specific way to integrate Pinterest

* 1、Log in to Pinterest developer platform (http://developers.pinterest.com/) to become a developer and Create a application to get the app’s ClientID.

* 2、Back to your project,choose the -Info.plist (- represents your project name) file. Add a WeChat URL Scheme key, and the value is: pin + ClientID
 (eg: pin1432928). Here is a example:

![img](http://www.mob.com/html/images/github/sharesdk-integrate-12.png)

* 3、Open  -AppDelegate.m ( -represents your project’s name), import Pinterest
SDK header file:

```
#import <Pinterest/Pinterest.h>
```
Check whether the handleOpenURL method had been added, if not add the following codes(in AppDelegate.m file):
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

* 4、Native code mode

Add the codes in -(BOOL)application: didFinishLaunchingWithOptions: method

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

* 5、The Server hosting mode

There’s not need to initialize the application configuration by code in this mode. Since ShareSDK relies on Pinterest SDK to share, so you still need to add a line of code in - application: didFinishLaunchingWithOptions: method, to import the Pinterest SDK classes. Here is the example:

```
[ShareSDK importPinterestClass:[Pinterest class] ];
```

## Option 7：the specific way to integrate YiXin

* 1、Log in to YiXin open platform (http://open.yixin.im/) to become a YiXin developer and create a application to get the app’s AppID.

* 2、Back to your project,choose the -Info.plist (- represents your project name) file. Add a YiXin URL Scheme key, the value is YiXin AppID (eg: yx0d9a9f9088ea44d78680f3274da1765f). Here is a example:


![img](http://www.mob.com/html/images/github/sharesdk-integrate-13.png)

* 3、Open  -AppDelegate.m ( -represents your project name), import YiXin SDK header file:
```
#import "YXApi.h"
```
Check whether the handleOpenURL method  is added, if not then add the following codes(in AppDelegate.m file):
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

* 4、Native code mode

Add the codes in -(BOOL)application: didFinishLaunchingWithOptions: method

```
-	(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{        
      //...        
//Initialize YiXin Platform  
//The parameter “yx0d9a9f9088ea44d78680f3274da1765f” is the AppID 
[ShareSDK connectYiXinWithAppId:
                             @"yx0d9a9f9088ea44d78680f3274da1765f"                              
                         yixinCls:[YXApi class] ];
      
      //... 
}

```

* 5、The Server hosting mode

There’s not need to initialize the application configuration by code in this mode. Since ShareSDK relies on YiXin SDK to share, so you still need to  add a line of code in - application: didFinishLaunchingWithOptions: method, to import the YiXin SDK classes. Here is the example:

```
-	(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{        
      //...        
// Add the YiXin SDK if your project or ShareSDK still don’s have one 
      [ShareSDK importYiXinClass:[YXApi class] ];
       
      //... 
}
```
