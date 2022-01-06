//
//  EAccountHYJSEventHandler.h
//  EAccountHYSDK
//
//  Created by Reticence Lee on 2020/6/18.
//  Copyright © 2020 21cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <webkit/webkit.h>

static NSString * const EAccountHYJSEventName = @"EAccountJsBridge";

NS_ASSUME_NONNULL_BEGIN

@protocol EAccountHYJSEventDelegate <NSObject>

@required
/**
 sdk js回调
 若合作方以delegate方式接入，必须实现本代理方法
 @param jScript 需要webview执行的js
 */
- (void)EAccountHYJSCallBackWithScript:(NSString *)jScript;

@end

@interface EAccountHYJSEventHandler : NSObject<WKScriptMessageHandler>

//若合作方不以delegate方式接入，需传入wkWebView实例
@property (nonatomic, strong) WKWebView *wkWebView;
@property (nonatomic, weak) id <EAccountHYJSEventDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
