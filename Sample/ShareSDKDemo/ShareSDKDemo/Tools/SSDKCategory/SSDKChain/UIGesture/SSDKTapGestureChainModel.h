//
//  SSDKTapGestureChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/31.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKBaseGestureChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKTapGestureChainModel;
@interface SSDKTapGestureChainModel : SSDKBaseGestureChainModel<SSDKTapGestureChainModel *>
SSDKCATEGORY_CHAIN_PROPERTY SSDKTapGestureChainModel * (^ numberOfTapsRequired) (NSUInteger numberOfTapsRequired);
@end

SSDKCATEGORY_EXINTERFACE(UITapGestureRecognizer, SSDKTapGestureChainModel)

static inline UITapGestureRecognizer *_Nonnull UITapGestureRecognizerCreateWithTarget(void (^ targetBlock) (id ges)){
    return UITapGestureRecognizerCreate().makeChain.addTargetBlock(targetBlock).gesture;
}

NS_ASSUME_NONNULL_END
