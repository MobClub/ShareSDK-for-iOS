//
//  MOBAboutMobLinkViewController.m
//  ShareSDKDemo
//
//  Created by wkx on 2019/5/13.
//  Copyright © 2019年 mob. All rights reserved.
//

#import "MOBAboutMobLinkViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDKUI.h>
#import <ShareSDKExtension/ShareSDK+Extension.h>
#import <MOBFoundation/MOBFoundation.h>

@interface MOBAboutMobLinkViewController ()

@end

@implementation MOBAboutMobLinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupView];
}

- (void)setupView
{
    CGFloat SCREEN_WIDTH = [UIScreen mainScreen].bounds.size.width;
    CGFloat SCREEN_HEIGHT = [UIScreen mainScreen].bounds.size.height;
    
    BOOL  MOBLINK_iPhoneX = ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? ([[UIScreen mainScreen] currentMode].size.height == 1792 ||[[UIScreen mainScreen] currentMode].size.height >=2436) : NO);
    
    CGFloat MOBLINK_TabbarSafeBottomMargin = (MOBLINK_iPhoneX ? 34.f : 0.f);
    
    CGFloat MOBLINK_StatusBarSafeBottomMargin = (MOBLINK_iPhoneX ? 44.f : 20.f);
    
    CALayer *topLayer = [CALayer layer];
    
    topLayer.frame = CGRectMake(0, MOBLINK_StatusBarSafeBottomMargin + 44, SCREEN_WIDTH, SCREEN_WIDTH * 1.37);
    topLayer.contents = (__bridge id)[UIImage imageNamed:@"moblink_bg"].CGImage;
    topLayer.contentsGravity = kCAGravityResizeAspect;
    topLayer.contentsScale = [UIScreen mainScreen].scale;
    
    CGFloat centerW = SCREEN_WIDTH / 2.0;
    
    UIView *centerView = [[UIView alloc] init];
    
    centerView.bounds = CGRectMake(0, 0, centerW, centerW);
    centerView.center = CGPointMake(centerW, (SCREEN_HEIGHT - MOBLINK_StatusBarSafeBottomMargin - 44) / 2);
    
    CALayer *centerLayer = [CALayer layer];
    centerLayer.frame = CGRectMake(0, 0, centerW, SCREEN_WIDTH * 0.3);
    centerLayer.contents = (__bridge id)[UIImage imageNamed:@"moblink_icon"].CGImage;
    centerLayer.contentsGravity = kCAGravityResizeAspect;
    centerLayer.contentsScale = [UIScreen mainScreen].scale;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(0, SCREEN_WIDTH * 0.3 + 10, centerW, 40);
    titleLabel.text = @"MobLink";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:30];
    titleLabel.textColor = [UIColor colorWithRed:23/255.0 green:25/255.0 blue:34/255.0 alpha:1/1.0];
    
    UILabel *subTitleLabel = [[UILabel alloc] init];
    subTitleLabel.frame = CGRectMake(0, SCREEN_WIDTH * 0.3 + 60, centerW, 40);
    subTitleLabel.text = @"移动端场景还原解决方案";
    subTitleLabel.textAlignment = NSTextAlignmentCenter;
    subTitleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
    subTitleLabel.textColor = [UIColor colorWithRed:23/255.0 green:25/255.0 blue:34/255.0 alpha:1/1.0];
    
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    shareBtn.frame = CGRectMake(SCREEN_WIDTH / 6, (SCREEN_HEIGHT - MOBLINK_StatusBarSafeBottomMargin - 44) / 2 + SCREEN_WIDTH * 0.3 / 2 + 100, SCREEN_WIDTH / 3 * 2, 50);
    
    shareBtn.backgroundColor = [UIColor colorWithRed:50/255.0 green:102/255.0 blue:255/255.0 alpha:1/1.0];
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName : [UIFont fontWithName:@"PingFangSC-Semibold" size:17],
                                 NSForegroundColorAttributeName : [UIColor whiteColor]
                                 };
    NSAttributedString *attrTitle = [[NSAttributedString alloc] initWithString:@"立即使用" attributes:attributes];
    [shareBtn setAttributedTitle:attrTitle forState:UIControlStateNormal];
    
    shareBtn.clipsToBounds = NO;
    shareBtn.layer.cornerRadius = 25;
    shareBtn.layer.borderWidth = 1.0;
    shareBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [shareBtn addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
    
    [centerView.layer addSublayer:centerLayer];
    [centerView addSubview:titleLabel];
    [centerView addSubview:subTitleLabel];
    
    [self.view.layer addSublayer:topLayer];
    [self.view addSubview:centerView];
    [self.view addSubview:shareBtn];
}

#pragma mark - Event

- (void)share:(UIButton *)shareBtn
{
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];

    NSString *title = @"MobLink 一键唤醒";
    NSString *text = @"移动端场景还原解决方案";
    NSString *imageName = @"moblink_icon@2x";
    NSURL *shareUrl = [NSURL URLWithString:@"http://10.18.97.58:2122/scene/news/?id=1&mobid=m6Fz6n"];
    
    [shareParams SSDKSetupShareParamsByText:text
                                     images:[[NSBundle mainBundle] pathForResource:imageName ofType:@"png"]
                                        url:shareUrl
                                      title:title
                                       type:SSDKContentTypeWebPage];
    if (![ShareSDK isClientInstalled:SSDKPlatformTypeSinaWeibo])
    {
        [shareParams SSDKSetupSinaWeiboShareParamsByText:[NSString stringWithFormat:@"%@%@",text,shareUrl.absoluteString]
                                                   title:title
                                                  images:[[NSBundle mainBundle] pathForResource:imageName ofType:@"png"]
                                                   video:nil
                                                     url:nil
                                                latitude:0
                                               longitude:0
                                                objectID:0
                                          isShareToStory:NO
                                                    type:SSDKContentTypeImage];
    }
    
    NSMutableArray *platformItems = [NSMutableArray arrayWithObject:@(SSDKPlatformTypeSinaWeibo)];
    if ([ShareSDK isClientInstalled:SSDKPlatformTypeWechat])
    {
        [platformItems addObjectsFromArray:@[@(SSDKPlatformSubTypeWechatSession), @(SSDKPlatformSubTypeWechatTimeline)]];
    }
    if ([ShareSDK isClientInstalled:SSDKPlatformTypeQQ])
    {
        [platformItems addObject:@(SSDKPlatformTypeQQ)];
    }
    SSUIShareSheetConfiguration *config = [[SSUIShareSheetConfiguration alloc] init];
    config.style = SSUIActionSheetStyleSimple;
    [ShareSDK showShareActionSheet:[MOBFDevice isPad]?nil:nil
                       customItems:platformItems
                       shareParams:shareParams
                sheetConfiguration:config
                    onStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                        switch (state)
                        {
                            case SSDKResponseStateSuccess:
                                NSLog(@"分享成功");
                                break;
                            case SSDKResponseStateFail:
                                NSLog(@"分享失败");
                                break;
                                
                            default:
                                break;
                        }
                    }];
    
    
}

@end
