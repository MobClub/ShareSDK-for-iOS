//
//  UILabel+SSDKCategory.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/18.
//  Copyright © 2018 mob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+SSDKCategory.h"
NS_ASSUME_NONNULL_BEGIN

@interface UILabel (SSDKCategory)

- (CGSize)sizeWithLimitSize:(CGSize)size;

- (CGSize)sizeWithoutLimitSize;

@end

NS_ASSUME_NONNULL_END
