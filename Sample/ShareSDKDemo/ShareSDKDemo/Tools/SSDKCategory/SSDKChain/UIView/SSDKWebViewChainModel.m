//
//  SSDKWebViewChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/28.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKWebViewChainModel.h"
#define SSDKCATEGORY_CHAIN_WEBVIEW_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKWebViewChainModel *,WKWebView)
@implementation SSDKWebViewChainModel

@end
SSDKCATEGORY_VIEW_IMPLEMENTATION(WKWebView, SSDKWebViewChainModel)
#undef SSDKCATEGORY_CHAIN_WEBVIEW_IMPLEMENTATION
