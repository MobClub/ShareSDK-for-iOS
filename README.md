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
    
`#import <ShareSDK/ShareConfig.h>`

如图：
    
（P.S. 此头文件必须在此文件下导入，否则会导致编译不通过）

## 4. 配置所有社交平台的AppKey
    打开ShareSDKConfig.h文件，根据需求设置各个平台的App相关信息（每个平台的App都需要到相应平台上进行应用登记后来取的相关信息）。如图：


## 5.  配置URL Scheme
    打开*-Info.plist（*代表你的工程名字）。在配置文件中新增一项URL types（如果存在可以不创建），展开URL types – URL Schemes，在URL Schemes下新增一项用于新浪微博授权的Scheme（如果不添加则会导致新浪微博的SSO授权方式无法返回应用）。其填写格式为：sinaweibosso.2279784657，其中后面的数字段为你在新浪微博申请的AppKey。如下图所示：
    另外，如果需要使用微信或者QQ平台接口也需要在此项下面添加相应的Scheme。

## 6．嵌入代码
    打开*AppDelegate.m(*代表你的工程名字)。导入文件头ShareSDK.h：

<pre><code>#import &lt;ShareSDK/ShareSDK.h&gt;</code></pre>

    在- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 。方法内添加如下语句：
    
<pre><code>[ShareSDK registerApp:@"520520test"];</code></pre>

    然后，在处理请求URL的委托方法中加入ShareSDK的处理方法，如下：
    
<pre><code>- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url wxDelegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return  [ShareSDK handleOpenURL:url wxDelegate:self];
}</code></pre>

    此处理方法已包括微信和QQ的回复处理，如果使用ShareSDK内置提示功能可以不需要再实现消息的微信和QQ的回复消息捕获。
