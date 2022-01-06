//
//  MOBShareMainHeaderView.h
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/9.
//  Copyright © 2019 mob. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MOBShareMainHeaderView : UIView

@property (nonatomic, copy) void (^ rollClick) (void);

@property (nonatomic, copy) NSString * text;

@end

NS_ASSUME_NONNULL_END
