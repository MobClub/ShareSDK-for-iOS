//
//  MOBLoadingViewController.h
//  ShareSDKDemo
//
//  Created by youzu on 17/3/22.
//  Copyright © 2017年 mob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShareSDK/SSDKHttpServiceModel.h>

@interface MOBLoadingViewController : UIViewController

- (IBAction)closeAct:(UIButton *)sender;

@property (nonatomic,weak) IBOutlet UIProgressView *progressView;
@property (nonatomic,weak) SSDKHttpServiceModel *httpServiceModel;
@end
