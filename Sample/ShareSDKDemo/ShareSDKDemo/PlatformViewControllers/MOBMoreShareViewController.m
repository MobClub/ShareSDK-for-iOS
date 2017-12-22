//
//  MOBMessengerViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBMoreShareViewController.h"

//iOS11 不支持此方法

@interface MOBMoreShareViewController ()

@end

@implementation MOBMoreShareViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"更多分享方式";
    shareIconArray = @[@"imageIcon",@"webURLIcon",@"videoIcon",@"imageIcon",@"webURLIcon",@"videoIcon"];
    shareTypeArray = @[@"图片 微信Extension",@"链接 微信Extension",@"文件 微信Extension",@"图片 QQ Extension",@"链接 QQ Extension",@"文件 QQ Extension"];
    selectorNameArray = @[@"shareImage",@"shareLink",@"shareFile",@"shareQQImage",@"shareQQLink",@"shareQQFile"];
}

/**
 分享图片
 */
- (void)shareImage
{
    //1-9张图片
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    platformType = SSDKPlatformTypeWechat;
    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"];
    NSString *path3 = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
    NSString *path4 = [[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:@[path1,path2,path3,path4,@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //使用微信app的插件进行分享
    [parameters SSDKEnableExtensionShare];
    [self shareWithParameters:parameters];
}

- (void)shareLink
{
    //简单链接 text title 无效
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    platformType = SSDKPlatformTypeWechat;
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:nil
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                     title:nil
                                      type:SSDKContentTypeWebPage];
    [parameters SSDKEnableExtensionShare];
    [self shareWithParameters:parameters];
}

- (void)shareFile
{
    //可以传视频 音频等文件(仅本地文件)
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    platformType = SSDKPlatformTypeWechat;
    //平台定制
    [parameters SSDKSetupShareParamsByText:nil
                                    images:nil
                                       url:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                     title:nil
                                      type:SSDKContentTypeFile];
    [parameters SSDKEnableExtensionShare];
    [self shareWithParameters:parameters];
}

/**
 分享图片
 */
- (void)shareQQImage
{
    //1-9张图片
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    platformType = SSDKPlatformTypeQQ;
    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"];
    NSString *path3 = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
    NSString *path4 = [[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:@[path1,path2,path3,path4,@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //使用微信app的插件进行分享
    [parameters SSDKEnableExtensionShare];
    [self shareWithParameters:parameters];
}

- (void)shareQQLink
{
    //简单链接 text title 无效
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    platformType = SSDKPlatformTypeQQ;
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:nil
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                     title:nil
                                      type:SSDKContentTypeWebPage];
    [parameters SSDKEnableExtensionShare];
    [self shareWithParameters:parameters];
}

- (void)shareQQFile
{
    //可以传视频 音频等文件(仅本地文件)
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    platformType = SSDKPlatformTypeQQ;
    //平台定制
    [parameters SSDKSetupShareParamsByText:nil
                                    images:nil
                                       url:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                     title:nil
                                      type:SSDKContentTypeFile];
    [parameters SSDKEnableExtensionShare];
    [self shareWithParameters:parameters];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
