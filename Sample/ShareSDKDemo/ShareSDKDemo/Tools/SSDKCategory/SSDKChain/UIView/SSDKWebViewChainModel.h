//
//  SSDKWebViewChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/28.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKBaseScrollViewChainModel.h"
#if __has_include(<WebKit/WebKit.h>)
#import <WebKit/WebKit.h>
#else
@import WebKit;
#endif

NS_ASSUME_NONNULL_BEGIN


@class SSDKWebViewChainModel;
@interface SSDKWebViewChainModel : SSDKBaseScrollViewChainModel<SSDKWebViewChainModel *>

@end

SSDKCATEGORY_EXINTERFACE(WKWebView, SSDKWebViewChainModel)
NS_ASSUME_NONNULL_END
