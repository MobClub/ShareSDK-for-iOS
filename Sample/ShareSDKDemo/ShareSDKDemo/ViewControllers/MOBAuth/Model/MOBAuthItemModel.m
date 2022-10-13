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
#import <MOBFoundation/MOBFoundation.h>

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
    _user = nil;
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
            
            //通过token接口，获取revoketoken接口需要的参数,再展示页面
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
            if (self.handler) {
                self.handler(MOBAuthStatusUserInfoing);
            }
            self.model.getUserInfoHandler = ^(SSDKResponseState state, SSDKUser * _Nonnull user, NSError * _Nonnull error) {
                SSDKSTRONG
                if (state == SSDKResponseStateSuccess && self.handler) {
                    showUser(user);
                }else{
                    if (self.handler) {
                        self.handler(MOBAuthStatusAuthored);
                    }
                }
                lasAuthTime = 0;
            };
            [self.model getUserInfo];
        }
    }else{
        SSDKWEAK
        if (self.handler) {
            self.handler(MOBAuthStatusAuthoring);
        }
        
        self.model.authHandler = ^(SSDKResponseState state, SSDKUser * _Nonnull user, NSError * _Nonnull error) {
            SSDKSTRONG
            if (state == SSDKResponseStateSuccess && self.handler) {
                self.handler(MOBAuthStatusAuthored);
            }else{
                self.handler(MOBAuthStatusUnAuthor);
            }
            lasAuthTime = 0;
        };
        [self.model auth];
        
    }
}

- (void)changeView{
    if (self.handler) {
        self.handler([ShareSDK hasAuthorized:self.model.platformType]?MOBAuthStatusAuthored:MOBAuthStatusUnAuthor);
    }
}

//具体的revoke逻辑需要和自己的后台进行对接,我们也开源了服务端的部分demo代码

- (void)revokeUser
{
    if (![ShareSDK hasAuthorized:self.model.platformType]) return;
    
    SSDKWEAK
    self.model.revokeUserHandler = ^(SSDKResponseState state, NSError * _Nonnull error) {
        
        if (state == SSDKResponseStateSuccess && weakSelf.handler) {
            weakSelf.handler(MOBAuthStatusUnAuthor);
        }
        
    };
    
    [self.model revokeUser];
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
