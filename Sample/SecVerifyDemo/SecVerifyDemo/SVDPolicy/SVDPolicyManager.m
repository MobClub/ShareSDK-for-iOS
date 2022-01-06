//
//  SVDPolicyManager.m
//  SecVerifyDemo
//
//  Created by 李树志 on 2020/2/7.
//  Copyright © 2020 yoozoo. All rights reserved.
//

#import "SVDPolicyManager.h"
#import <MOBFoundation/MobSDK+Privacy.h>
#import "SVDPolicyViewController.h"

static NSString * kSVDPolicyManagerSaveKey =  @"kSVDPolicyManagerSaveKey";

@interface SVDPolicyManager ()

@property (nonatomic, assign) BOOL isAllowPolicy;

@end

@implementation SVDPolicyManager

static dispatch_once_t onceToken;
static SVDPolicyManager * _instance = nil;
+ (SVDPolicyManager *)defaultManager {
    dispatch_once(&onceToken, ^{
        _instance = [[SVDPolicyManager alloc] init];
    });
    return _instance;
}


- (void)show {
    id cachedValue = [[NSUserDefaults standardUserDefaults] objectForKey:kSVDPolicyManagerSaveKey];
    if (cachedValue) {
        self.isAllowPolicy = [cachedValue boolValue];
        return;
    }
    SVDPolicyViewController *policyVC = [[SVDPolicyViewController alloc] init];
    policyVC.modalPresentationStyle = UIModalPresentationFullScreen;
    policyVC.policyAcceptedStatus = ^(BOOL acceptedStatus) {
        self.isAllowPolicy = acceptedStatus;
        [MobSDK uploadPrivacyPermissionStatus:acceptedStatus onResult:nil];
        [[NSUserDefaults standardUserDefaults] setObject:@(acceptedStatus) forKey:kSVDPolicyManagerSaveKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self clear];
    };
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:policyVC animated:NO completion:^{
        
    }];
}

- (void)clear {
    onceToken = 0;
    _instance = nil;
}


- (void)clearCache {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kSVDPolicyManagerSaveKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}







@end
