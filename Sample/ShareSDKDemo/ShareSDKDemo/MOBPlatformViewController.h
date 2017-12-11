//
//  MOBPlatformViewController.h
//  ShareSDKDemo
//
//  Created by youzu on 17/3/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShareSDK/ShareSDK.h>

@interface MOBPlatformViewController : UIViewController <UIAlertViewDelegate>
{
    IBOutlet UITableView *mobTableView;
    NSArray *shareTypeArray;
    NSArray *shareIconArray;
    NSArray *selectorNameArray;
    NSArray *authTypeArray;
    NSArray *authSelectorNameArray;
    NSArray *otherTypeArray;
    NSArray *otherSelectorNameArray;
    SSDKPlatformType platformType;
}

@property(nonatomic) BOOL hasAuth;

/**
 传入定义分享参数进行分享

 @param parameters 分享参数
 */
- (void)shareWithParameters:(NSMutableDictionary *)parameters;

- (void)authAct;

- (void)isInstallAPP;

@end
