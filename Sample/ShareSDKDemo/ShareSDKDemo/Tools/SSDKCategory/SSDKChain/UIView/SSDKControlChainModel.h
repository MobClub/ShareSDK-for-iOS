//
//  SSDKControlChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/27.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKBaseControlChainModel.h"

NS_ASSUME_NONNULL_BEGIN



@class SSDKControlChainModel;
@interface SSDKControlChainModel : SSDKBaseControlChainModel<SSDKControlChainModel*>



@end

SSDKCATEGORY_EXINTERFACE(UIControl, SSDKControlChainModel)
NS_ASSUME_NONNULL_END
