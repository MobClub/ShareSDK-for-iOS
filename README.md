*Share集成指南*

*1．导入SDK*
    将ShareSDK文件夹到项目文件夹中夹并拖入项目中。
![image](http://www.sharesdk.cn/media/attached/sharesdk_1.png)

*2. 添加依赖框架(Framework)*
    打开项目设置中的Build Phases页，在“Link Binary With Libraries”一栏中，点击左下角的“＋”号；在弹出窗口里面分别以下库加入到项目中：
    SystemConfiguration.framework
    QuartzCore.framework
    MessageUI.framework
    libicucore.dylib

![image](http://www.sharesdk.cn/media/attached/sharesdk_2.png)

*3．引入社区应用配置信息。*
    打开main.m文件加入
<pre><code>#import <ShareSDK/ShareConfig.h></code></pre>
    如图：
![image](http://www.sharesdk.cn/media/attached/sharesdk_3.png)

    （P.S. 此头文件必须在此文件下导入，否则会导致编译不通过）

*4. 配置所有社交平台的AppKey*
    打开ShareSDKConfig.h文件，根据需求设置各个平台的App相关信息（每个平台的App都需要到相应平台上进行应用登记后来取的相关信息）。如图：


*5.  配置URL Scheme*
    打开*-Info.plist（*代表你的工程名字）。在配置文件中新增一项URL types（如果存在可以不创建），展开URL types – URL Schemes，在URL Schemes下新增一项用于新浪微博授权的Scheme（如果不添加则会导致新浪微博的SSO授权方式无法返回应用）。其填写格式为：sinaweibosso.2279784657，其中后面的数字段为你在新浪微博申请的AppKey。如下图所示：
    另外，如果需要使用微信或者QQ平台接口也需要在此项下面添加相应的Scheme。
