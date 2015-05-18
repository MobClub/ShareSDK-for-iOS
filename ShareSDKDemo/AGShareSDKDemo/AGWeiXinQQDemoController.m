//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGWeiXinQQDemoController.h"
#import <AGCommon/UINavigationBar+Common.h>
#import <AGCommon/UIImage+Common.h>
#import "AGAppDelegate.h"

@interface AGWeiXinQQDemoController ()

@end

@implementation AGWeiXinQQDemoController

- (id)init
{
    self = [super init];
    if (self)
    {
        _segmentedController = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:NSLocalizedString(@"TEXT_WECHAT", @"微信"), @"QQ", nil]];
        _segmentedController.frame = CGRectMake(0.0, 0.0, 200, 35);
        _segmentedController.segmentedControlStyle = UISegmentedControlStyleBordered;
        _segmentedController.selectedSegmentIndex = 0;
        [_segmentedController addTarget:self action:@selector(segmentedControlChangeHandler:) forControlEvents:UIControlEventValueChanged];
        self.navigationItem.titleView = _segmentedController;
        [_segmentedController release];
        
        _qqViewController = [[QQDemoViewController alloc] initWithNibName:@"QQDemoViewController" bundle:nil];
        _weixinViewController = [[WeChatViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil];
//        _weixinViewController.delegate = (AGAppDelegate *)[UIApplication sharedApplication].delegate;
        _weixinViewController.parentController = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneNavigationBarBG.png"]];
    
    switch (_segmentedController.selectedSegmentIndex)
    {
        case 0:
            [_qqViewController.view removeFromSuperview];
            _weixinViewController.view.frame = CGRectMake(0.0, 0.0, self.view.width, self.view.height);
            _weixinViewController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
            [self.view addSubview:_weixinViewController.view];
            break;
        case 1:
            [_weixinViewController.view removeFromSuperview];
            _qqViewController.view.frame = CGRectMake(0.0, 0.0, self.view.width, self.view.height);
            _qqViewController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
            [self.view addSubview:_qqViewController.view];
            break;
        default:
            break;
    }

}

- (void)segmentedControlChangeHandler:(id)sender
{
    switch (_segmentedController.selectedSegmentIndex)
    {
        case 0:
            [_qqViewController.view removeFromSuperview];
            _weixinViewController.view.frame = CGRectMake(0.0, 0.0, self.view.width, self.view.height);
            _weixinViewController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
            [self.view addSubview:_weixinViewController.view];
            break;
        case 1:
            [_weixinViewController.view removeFromSuperview];
            _qqViewController.view.frame = CGRectMake(0.0, 0.0, self.view.width, self.view.height);
            _qqViewController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
            [self.view addSubview:_qqViewController.view];
            break;
        default:
            break;
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [_qqViewController viewDidUnload];
    [_weixinViewController viewDidUnload];
}

- (void)dealloc
{
    _segmentedController = nil;
    
    [_qqViewController release];
    [_weixinViewController release];
    [super dealloc];
}

@end
