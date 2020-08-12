//
//  MOBPolicyManager.m
//  ShareSDKDemo
//
//  Created by maxl on 2020/1/14.
//  Copyright © 2020 mob. All rights reserved.
//

#import "MOBPolicyManager.h"
#import "MOBPolicyViewController.h"
#import <MOBFoundation/MOBFoundation.h>
#import <MOBFoundation/MobSDK+Privacy.h>
static NSString * kMOBPolicyManagerSaveKey =  @"kMOBPolicyManagerSaveKey";
static NSString * kMOBPolicyManagerAllowNofitication =  @"kMOBPolicyManagerAllowNofitication";

@interface MOBPolicyManager ()

@property (nonatomic, assign) BOOL isAllowPolicy;

@end

@implementation MOBPolicyManager

static dispatch_once_t onceToken;
static MOBPolicyManager * manager = nil;
+ (MOBPolicyManager *)defaultManager{
    dispatch_once(&onceToken, ^{
        manager = [MOBPolicyManager new];
    });
    return manager;
}

- (void)show{
   id cacheKey = [[NSUserDefaults standardUserDefaults] objectForKey:kMOBPolicyManagerSaveKey];
    self.isAllowPolicy = [cacheKey boolValue];
    if (self.isAllowPolicy) {
        return;
    }
    MOBPolicyViewController *vc = [MOBPolicyViewController new];
    vc.policyStaus = ^(BOOL status) {
        self.isAllowPolicy = status;
        [MobSDK uploadPrivacyPermissionStatus:status onResult:nil];
        [[NSUserDefaults standardUserDefaults] setObject:@(status) forKey:kMOBPolicyManagerSaveKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self clear];
        [[NSNotificationCenter defaultCenter] postNotificationName:kMOBPolicyManagerAllowNofitication object:nil userInfo:@{@"isAllowPolicy":@(status)}];
    };
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    vc.present();
    
}

- (void)clear{
    onceToken = 0;
    manager = nil;
}

- (void)clearCache{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kMOBPolicyManagerSaveKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
