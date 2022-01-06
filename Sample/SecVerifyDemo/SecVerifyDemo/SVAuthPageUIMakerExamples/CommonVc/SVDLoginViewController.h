//
//  SVDLoginViewController.h
//  SecVerifyDemo
//
//  Created by Sands_Lee on 2020/4/2.
//  Copyright © 2020 yoozoo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SVDLoginViewController : UIViewController

@property (nonatomic, copy) void(^loginButtonClickedBlock)(UIButton *button);


@end

NS_ASSUME_NONNULL_END
