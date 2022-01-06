//
//  SVDSuccessViewController.h
//  SecVerifyDemo
//
//  Created by lujh on 2019/5/31.
//  Copyright © 2019 lujh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ConfirmResultType) {
    WithoutPWDLoginType,
    MobileNumAuthType,
    Others,
};

@interface SVDSuccessViewController : UIViewController

@property (nonatomic, copy) NSString *phone;

@property (nonatomic, strong) NSError *error;

@property (nonatomic, assign) ConfirmResultType resultType;

@property (nonatomic, assign) BOOL isShowRealError;

@end

NS_ASSUME_NONNULL_END
