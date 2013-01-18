![image](http://www.sharesdk.cn/media/attached/sharesdk_1.png)
![image](http://www.sharesdk.cn/media/attached/sharesdk_2.png)
![image](http://www.sharesdk.cn/media/attached/sharesdk_3.png)

# Share集成指南

## 1．导入SDK
将ShareSDK文件夹到项目文件夹中夹并拖入项目中。


## 2. 添加依赖框架(Framework)
打开项目设置中的Build Phases页，在“Link Binary With Libraries”一栏中，点击左下角的“＋”号；在弹出窗口里面分别以下库加入到项目中：
SystemConfiguration.framework
QuartzCore.framework
MessageUI.framework
libicucore.dylib



## 3．引入社区应用配置信息。
打开main.m文件加入
    
    #import <ShareSDK/ShareConfig.h>

如图：
    
（P.S. 此头文件必须在此文件下导入，否则会导致编译不通过）

## 4. 配置所有社交平台的AppKey
打开ShareSDKConfig.h文件，根据需求设置各个平台的App相关信息（每个平台的App都需要到相应平台上进行应用登记后来取的相关信息）。如图：


## 5.  配置URL Scheme
打开*-Info.plist（*代表你的工程名字）。在配置文件中新增一项URL types（如果存在可以不创建），展开URL types – URL Schemes，在URL Schemes下新增一项用于新浪微博授权的Scheme（如果不添加则会导致新浪微博的SSO授权方式无法返回应用）。其填写格式为：sinaweibosso.2279784657，其中后面的数字段为你在新浪微博申请的AppKey。如下图所示：
另外，如果需要使用微信或者QQ平台接口也需要在此项下面添加相应的Scheme。

## 6．嵌入代码
打开*AppDelegate.m(*代表你的工程名字)。导入文件头ShareSDK.h：

    #import <ShareSDK/ShareSDK.h>

在- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 。方法内添加如下语句：
    
    [ShareSDK registerApp:@"520520test"];

然后，在处理请求URL的委托方法中加入ShareSDK的处理方法，如下：
    
    - (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
    {
        return [ShareSDK handleOpenURL:url wxDelegate:self];
    }

    - (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
    {
        return  [ShareSDK handleOpenURL:url wxDelegate:self];
    }

此处理方法已包括微信和QQ的回复处理，如果使用ShareSDK内置提示功能可以不需要再实现消息的微信和QQ的回复消息捕获。

## 7．分享内容
在分享内容部分ShareSDK提供了三种接口来满足不同需求的分享功能实现。

### 7.1 菜单方式分享：
使用此方式进行分享会首先弹出菜单供用户选择分享的目标平台，然后再显示内容编辑界面供用户进行分享内容编辑，最后进行分享。调用该方式的接口如下：

    id<ISSPublishContent> publishContent = [ShareSDK publishContent:@"content"
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:@"Icon.png"]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeNews
                                                              title:@"ShareSDK"
                                                                url:url
                                                       musicFileUrl:nil
                                                            extInfo:nil
                                                           fileData:nil];
    
    [ShareSDK showShareActionSheet:self
                         shareList:shareList
                           content:publishContent
                     statusBarTips:YES
                   oneKeyShareList:[NSArray defaultOneKeyShareList]
                    shareViewStyle:style
                    shareViewTitle:@"内容分享"
                            result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    NSLog(@"成功!");
                                }
                                else if(state == SSPublishContentStateFail)
                                {
                                    NSLog(@"失败!");
                                }
    }];

第一个参数用于指定菜单显示在哪个视图上。
第二个参数则用于指定菜单弹出的分享平台列表，传入nil则表示显示所有分享平台，如果开发者需要自己定制显示列表则通过此参数进行控制。ShareSDK提供了getShareListWithType方法来进行分享列表的构造。
第三个参数为实现了ISSPublishContent协议的对象，需要调用了ShareSDK的publishContent来构造对象。需要特别说明一下的是content参数对象除了基础的图片和文字字段外还包括了微信和QQ这两个平台的其他分享类型参数字段（包括News、Music、Video等，通过mediaType来指定分享出去的类型），如果不需要使用微信和QQ的分享功能，可以在构造分享内容对象时把参数值设置为nil或者默认值即可。
第四个参数为是否在状态栏上显示提示信息（包括成功和错误提示）。
第五个参数为一键分享的平台显示列表，用于控制允许一键分享的目标平台。如果不需要一键分享可以把参数设置为nil，或者是想使用默认列表可以调用[NSArray defaultOneKeyShareList]方法。此参数仅在shareViewStyle为ShareViewStyleDefault时生效。
第六个参数用于指定分享内容编辑视图的样式，ShareSDK提供了三种方式，具体显示样式可以参照下面提供的应用截图。
第七个参数为分享内容的编辑视图标题。
第八个参数用于处理分享返回后续的处理方法。
菜单分享方式的效果如下图所示：

### 7.2 分享内容视图方式
使用此方式直接弹出内容分享编辑框，用户编辑完内容后点击发布直接分享出去。其调用代码如下：

    [ShareSDK shareContentWithType:ShareTypeSinaWeibo
                           content:[ShareSDK publishContent: @"content"
                                             defaultContent:@""
                                                      image:[UIImage imageNamed: @"Icon.png"]
                                               imageQuality:0.8
                                                  mediaType:SSPublishContentMediaTypeText]
          	   containerController:self
            	      statusBarTips:YES
          	   oneKeyShareList:[NSArray defaultOneKeyShareList]
         	         shareViewStyle:ShareViewStyleDefault
  				     shareViewTitle:@"内容分享"
                             result:nil];




