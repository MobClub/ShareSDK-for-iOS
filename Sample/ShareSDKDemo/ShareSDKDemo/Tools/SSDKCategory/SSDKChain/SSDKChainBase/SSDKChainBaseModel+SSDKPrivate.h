//
//  SSDKChainBaseModel+SSDKPrivate.h
//  ShareSDKDemo
//
//  Created by maxl on 2020/1/16.
//  Copyright © 2020 mob. All rights reserved.
//

#import "SSDKChainBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SSDKChainBaseModel (Provite)

- (instancetype)initWithModelObject:(id)object modelClass:(Class)modelClass;

- (instancetype)initWithModelObjects:(NSArray *)objects modelClass:(Class)modelClass;

@end

NS_ASSUME_NONNULL_END
