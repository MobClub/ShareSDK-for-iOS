//
//  MOBPinterestViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/6/8.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBPinterestViewController.h"

@implementation MOBPinterestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypePinterest;
    self.title = @"Pinterest";
    shareIconArray = @[@"imageIcon"];
    shareTypeArray = @[@"图片"];
    selectorNameArray = @[@"shareImage"];
}

/**
 分享图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];

    [parameters SSDKSetupPinterestParamsByImage:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536040147840&di=709d546e722a413947722e4da58c229b&imgtype=0&src=http%3A%2F%2Fpic2.zhimg.com%2Fv2-2fd5bfcfebe22ffffe8f5a222c3d6c65_b.jpg"
                                           desc:@"test"
                                            url:[NSURL URLWithString:@"http://www.mob.com"]
                                      boardName:@"ShareSDK"];
    [self shareWithParameters:parameters];
}
@end
