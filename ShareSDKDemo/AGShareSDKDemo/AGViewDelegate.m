//
//  AGiPhoneViewDelegate.m
//  AGShareSDKDemo
//
//  Created by 冯 鸿杰 on 13-4-12.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import "AGViewDelegate.h"
#import <AGCommon/UIDevice+Common.h>
#import <AGCommon/UINavigationBar+Common.h>

@implementation AGViewDelegate

#pragma mark - ISSShareViewDelegate

- (void)viewOnWillDisplay:(UIViewController *)viewController shareType:(ShareType)shareType
{
    if ([UIDevice currentDevice].isPad)
    {
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.shadowColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:22];
        viewController.navigationItem.titleView = label;
        label.text = viewController.title;
        [label sizeToFit];
        [label release];
        
        if (UIInterfaceOrientationIsLandscape(viewController.interfaceOrientation))
        {
            [viewController.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPadLandscapeNavigationBarBG.png"]];
        }
        else
        {
            [viewController.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPadNavigationBarBG.png"]];
        }
    }
    else
    {
        if (UIInterfaceOrientationIsLandscape(viewController.interfaceOrientation))
        {
            if ([[UIDevice currentDevice] isPhone5])
            {
                [viewController.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneLandscapeNavigationBarBG-568h.png"]];
            }
            else
            {
                [viewController.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneLandscapeNavigationBarBG.png"]];
            }
        }
        else
        {
            [viewController.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneNavigationBarBG.png"]];
        }
    }
}

- (void)view:(UIViewController *)viewController autorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation shareType:(ShareType)shareType
{
    if ([UIDevice currentDevice].isPad)
    {
        if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation))
        {
            [viewController.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPadLandscapeNavigationBarBG.png"]];
        }
        else
        {
            [viewController.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPadNavigationBarBG.png"]];
        }
    }
    else
    {
        if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation))
        {
            if ([[UIDevice currentDevice] isPhone5])
            {
                [viewController.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneLandscapeNavigationBarBG-568h.png"]];
            }
            else
            {
                [viewController.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneLandscapeNavigationBarBG.png"]];
            }
        }
        else
        {
            [viewController.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneNavigationBarBG.png"]];
        }
    }
}

@end
