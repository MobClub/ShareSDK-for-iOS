//
//  SSDKViewChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/27.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKBaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN

@class SSDKViewChainModel,UIView;
@interface SSDKViewChainModel : SSDKBaseViewChainModel<SSDKViewChainModel *>

@end
SSDKCATEGORY_EXINTERFACE(UIView, SSDKViewChainModel)
NS_ASSUME_NONNULL_END
