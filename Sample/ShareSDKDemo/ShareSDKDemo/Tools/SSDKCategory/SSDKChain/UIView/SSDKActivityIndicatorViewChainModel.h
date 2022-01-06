//
//  SSDKActivityIndicatorViewModel.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/11.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKActivityIndicatorViewModel;
@interface SSDKActivityIndicatorViewModel : SSDKBaseViewChainModel<SSDKActivityIndicatorViewModel *>
SSDKCATEGORY_CHAIN_PROPERTY SSDKActivityIndicatorViewModel * (^ activityIndicatorViewStyle) (UIActivityIndicatorViewStyle activityIndicatorViewStyle);
SSDKCATEGORY_CHAIN_PROPERTY SSDKActivityIndicatorViewModel * (^ hidesWhenStopped) (BOOL hidesWhenStopped);
SSDKCATEGORY_CHAIN_PROPERTY SSDKActivityIndicatorViewModel * (^ color) (UIColor * color);
SSDKCATEGORY_CHAIN_PROPERTY SSDKActivityIndicatorViewModel * (^ startAnimating) (void);
SSDKCATEGORY_CHAIN_PROPERTY SSDKActivityIndicatorViewModel * (^ stopAnimating) (void);
@end

SSDKCATEGORY_EXINTERFACE(UIActivityIndicatorView, SSDKActivityIndicatorViewModel)
NS_ASSUME_NONNULL_END
