//
//  MOBYouDaoNotesViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/6/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBYouDaoNotesViewController.h"

@implementation MOBYouDaoNotesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeYouDaoNote;
    self.title = @"有道云笔记";
    shareIconArray = @[@"textIcon",@"textAndImageIcon"];
    shareTypeArray = @[@"文字",@"图文"];
    selectorNameArray = @[@"shareText",@"shareImage"];
}

/**
 文字
 */
-(void)shareText
{
    //通用参数设置
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"Share SDK "
                                    images:nil
                                       url:nil
                                     title:@"Share SDK"
                                      type:SSDKContentTypeText];
    //平台定制
//    [parameters SSDKSetupYouDaoNoteParamsByText:@"Share SDK"
//                                         images:nil
//                                          title:@"Share SDK"
//                                         source:@"MOB"
//                                         author:@"mob"
//                                       notebook:nil];
    [self shareWithParameters:parameters];
}

/**
 文字图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
//    [parameters SSDKSetupShareParamsByText:@"Share SDK"
//                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                       url:nil
//                                     title:@"Share SDK"
//                                      type:SSDKContentTypeImage];
    //平台定制
    [parameters SSDKSetupYouDaoNoteParamsByText:@"Share SDK"
                                         images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                          title:@"Share SDK"
                                         source:@"MOB"
                                         author:@"mob"
                                       notebook:nil];
    [self shareWithParameters:parameters];
}

@end
