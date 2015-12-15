# APShareSDK
### 准备工作

`重要`

请到 http://open.alipay.com/index.htm 申请AppID

demo中以xxxxxxxxxx代替

### 接入步骤

* 导入lib库资源
	* libAPOpenSdk.a
	* APOpenAPI.h
	* APOpenAPIObject.h
* 工程配置
	* Other Linker Flags : -all_load
	* 添加URL Types
		* Identifier : alipayShare
		* URL Schemes : apxxxxxxxxxx
* 引入APOpenAPI.h

```
#import "APOpenAPI.h"
``` 
* 注册应用

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [APOpenAPI registerApp:@"xxxxxxxxxx"];
    return YES;
}
```
* 监听URL Scheme

```
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [APOpenAPI handleOpenURL:url delegate:self];
}
```
* 响应回调

```
- (void)onReq:(APBaseReq *)req
{}
- (void)onResp:(APBaseResp *)resp
{}
```
* 分享数据

```
请参考 APOpenAPI.h 内接口说明
```


