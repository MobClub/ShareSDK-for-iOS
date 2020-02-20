//
//  MOBAuthItemModel.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/15.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBAuthItemModel.h"
#import "MobUserInfoShowViewController.h"
#import <time.h>

static time_t lasAuthTime;
@interface MOBAuthItemModel ()

@property (nonatomic, assign) BOOL isAuthored;

@property (nonatomic, strong) SSDKUser *user;

@property (nonatomic, weak) MobUserInfoShowViewController *vc;


@end


@implementation MOBAuthItemModel

- (void)setModel:(MOBPlatformBaseModel *)model{
    _model = model;
    
    MOBShareItemUI *ui = [MOBShareItemUI new];
    
    NSString *platformTypeName = [NSString stringWithFormat:@"ShareType_%lu",(unsigned long)model.converntPlatformType];
    NSString *title = NSLocalizedStringWithDefaultValue(platformTypeName, @"ShareSDKUI_Localizable", MOBPlatformBundle(), platformTypeName, nil);
    
    ui.name = title;
    NSString *iconName = [NSString stringWithFormat:@"sns_icon_%ld",(long)model.converntImagePlatformType];
    ui.image = UIImageNamed(iconName);
    _itemUI = ui;
    [model setAssociateWeakValue:self forKey:kMOBPlatformAuthItemModelKey];
}

- (void)author{
    
    if (time(NULL) - lasAuthTime <= 4.5 && lasAuthTime > 0) return;
    lasAuthTime = time(NULL);
    if ([ShareSDK hasAuthorized:self.model.platformType]) {
        if (!_user) {
            _user = [ShareSDK currentUser:self.model.platformType];
        }
        SSDKWEAK

        void(^showUser)(SSDKUser *) = ^(SSDKUser *user) {
            SSDKSTRONG
            if (!self.user) {
                self.user = user;
            }
            MobUserInfoShowViewController *  userInfoShowViewController = [[MobUserInfoShowViewController alloc] init];
            userInfoShowViewController.isCancelAuth = ^{
                self.handler(NO);
            };
            userInfoShowViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
            
            userInfoShowViewController.hidesBottomBarWhenPushed = YES;
            
            userInfoShowViewController.present();
            
            [userInfoShowViewController setUserInfo:user];
            self.vc = userInfoShowViewController;
            lasAuthTime = 0;
        };
        if (_user) {
            showUser(_user);
        }else{
            self.model.getUserInfoHandler = ^(SSDKResponseState state, SSDKUser * _Nonnull user, NSError * _Nonnull error) {
                SSDKSTRONG
                if (state == SSDKResponseStateSuccess && self.handler) {
                    showUser(user);
                }
                lasAuthTime = 0;
            };
            [self.model getUserInfo];
        }
    }else{
        SSDKWEAK
        self.model.authHandler = ^(SSDKResponseState state, SSDKUser * _Nonnull user, NSError * _Nonnull error) {
            SSDKSTRONG
            if (state == SSDKResponseStateSuccess && self.handler) {
                self.handler(YES);
            }
            lasAuthTime = 0;
        };
        [self.model auth];
        
    }
}

- (void)changeView{
    if (self.handler) {
        self.handler([ShareSDK hasAuthorized:self.model.platformType]);
    }
}

- (void)cancelAuth{
    if (![ShareSDK hasAuthorized:self.model.platformType]) return;
    if (self.vc) {
       [UIView animateWithDuration:0.15 animations:^{
            self.vc.view.alpha = 0;
        }completion:^(BOOL finished) {
            SSDKWEAK
            [self.vc dismissViewControllerAnimated:NO completion:^{
                SSDKSTRONG
                [self changeView];
            }];
        }];
    }else{
        [self changeView];
    }
}

@end
