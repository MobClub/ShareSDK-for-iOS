//
//  NSAttributedString+SSDKCategory.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/3.
//  Copyright © 2019 mob. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (SSDKCategory)

- (CGSize)sizeWithLimitSize:(CGSize)size;

- (CGSize)sizeWithoutLimitSize;
@end

NS_ASSUME_NONNULL_END
