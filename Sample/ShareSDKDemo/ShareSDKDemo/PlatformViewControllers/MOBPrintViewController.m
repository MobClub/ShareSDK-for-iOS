//
//  MOBPrintViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/5/25.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBPrintViewController.h"

@interface MOBPrintViewController ()

@end

@implementation MOBPrintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    platformType = SSDKPlatformTypePrint;
    self.title = @"打印";
    shareIconArray = @[@"textIcon",@"imageIcon"];
    shareTypeArray = @[@"文字",@"图片"];
    selectorNameArray = @[@"shareText",@"shareImage"];
}

/**
 打印文字
 */
- (void)shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

/**
 打印图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
