//
//  UILabel+SSDKCategory.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/18.
//  Copyright © 2018 mob. All rights reserved.
//

#import "UILabel+SSDKCategory.h"
#import "NSString+SSDKCategory.h"
#import "NSAttributedString+SSDKCategory.h"
@implementation UILabel (SSDKCategory)

- (CGSize)sizeWithoutLimitSize{
    return [self sizeWithLimitSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
}

- (CGSize)sizeWithLimitSize:(CGSize)size{
    return [self.text sizeWithAttributes:@{NSFontAttributeName:self.font} limitSize:size];
}

@end
