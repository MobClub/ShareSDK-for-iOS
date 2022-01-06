//
//  UIGestureRecognizer+SSDKCategory.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/28.
//  Copyright © 2018 mob. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^GestureTargetAction)(id gesture);
@interface UIGestureRecognizer (SSDKCategory)

- (instancetype)initWithActionBlock:(void (^)(id sender))block;

- (void)addTargetBlock:(GestureTargetAction)block;

- (void)addTargetBlock:(GestureTargetAction)block tag:(NSString *)tag;

- (void)removeTargetBlockByTag:(NSString *)tag;

- (void)removeAllTargetBlock;

@end

NS_ASSUME_NONNULL_END
