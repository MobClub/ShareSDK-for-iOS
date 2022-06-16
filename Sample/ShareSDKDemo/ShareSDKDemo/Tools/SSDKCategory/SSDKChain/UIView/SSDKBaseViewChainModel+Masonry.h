//
//  SSDKBaseViewChainModel+Masonry.h
//  SSDKCategory
//
//  Created by maxl on 2019/6/5.
//  Copyright © 2019 maxl. All rights reserved.
//

#import "SSDKBaseViewChainModel.h"
#if __has_include(<Masonry.h>)
#import <Masonry.h>
#elif __has_include("Masonry.h")
#import "Masonry.h"
#endif
NS_ASSUME_NONNULL_BEGIN
@class MASConstraintMaker;
typedef void(^SSDKMasonryLoad)(MASConstraintMaker *make);
@interface SSDKBaseViewChainModel <ObjectType> (Masonry)
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ makeMasonry)(SSDKMasonryLoad constraints);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ updateMasonry)(SSDKMasonryLoad constraints);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ remakeMasonry)(SSDKMasonryLoad constraints);
@end

NS_ASSUME_NONNULL_END
