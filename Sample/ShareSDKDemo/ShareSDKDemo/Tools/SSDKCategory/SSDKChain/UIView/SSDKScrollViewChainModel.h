//
//  SSDKScrollViewChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/27.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKBaseScrollViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN

@class SSDKScrollViewChainModel;

@interface SSDKScrollViewChainModel : SSDKBaseScrollViewChainModel<SSDKScrollViewChainModel*>

@end

SSDKCATEGORY_EXINTERFACE(UIScrollView, SSDKScrollViewChainModel)
NS_ASSUME_NONNULL_END
