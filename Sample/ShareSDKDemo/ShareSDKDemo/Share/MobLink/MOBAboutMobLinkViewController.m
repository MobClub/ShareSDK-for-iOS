//
//  MOBAboutMobLinkViewController.m
//  ShareSDKDemo
//
//  Created by wkx on 2019/6/20.
//  Copyright © 2019年 mob. All rights reserved.
//

#import "MOBAboutMobLinkViewController.h"
#import <MobLinkPro/UIViewController+MLSDKRestore.h>

@interface MOBAboutMobLinkViewController ()

@property(nonatomic, strong) MLSDKScene *scene;

@end

@implementation MOBAboutMobLinkViewController

- (instancetype) initWithMobLinkScene:(MLSDKScene *)scene
{
    if (self = [super init])
    {
        self.scene = scene;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Share+Link";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
