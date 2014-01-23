//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "SSCViewController.h"
#import <Comment/Comment.h>

@implementation SSCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"评论、称赞";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *presentListButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [presentListButton setTitle:@"显示评论列表（Modal）" forState:UIControlStateNormal];
    presentListButton.frame = CGRectMake((self.view.frame.size.width - 200) / 2, 80, 200, 50);
    [presentListButton addTarget:self action:@selector(presentListButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentListButton];
    
    UIButton *pushListButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pushListButton setTitle:@"显示评论列表（Push）" forState:UIControlStateNormal];
    pushListButton.frame = CGRectMake((self.view.frame.size.width - 200) / 2, 140, 200, 50);
    [pushListButton addTarget:self action:@selector(pushListButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushListButton];
    
    UIButton *presentCmtButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [presentCmtButton setTitle:@"显示评论界面（Modal）" forState:UIControlStateNormal];
    presentCmtButton.frame = CGRectMake((self.view.frame.size.width - 200) / 2, 200, 200, 50);
    [presentCmtButton addTarget:self action:@selector(presentCmtButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentCmtButton];
    
    UIButton *pushCmtButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pushCmtButton setTitle:@"显示评论界面（Push）" forState:UIControlStateNormal];
    pushCmtButton.frame = CGRectMake((self.view.frame.size.width - 200) / 2, 260, 200, 50);
    [pushCmtButton addTarget:self action:@selector(pushCmtButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushCmtButton];
    
            //Show toolbar.
    [self showCommentToolbarWithContentId:@"123456" title:@"文章标题"];
}

#pragma mark - Private

- (void)presentListButtonClickHandler:(id)sender
{
            //Show comment list view.
    [self presentCommentListViewControllerWithContentId:@"123456" title:@"文章标题" animated:YES];
}

- (void)pushListButtonClickHandler:(id)sender
{
            //Show comment list view.
    [self pushCommentListViewControllerWithContentId:@"123456" title:@"文章标题" animated:YES];
}

- (void)presentCmtButtonClickHandler:(id)sender
{
            //Show comment view
    [self presentCommentViewControllerWithContentId:@"123456"
                                              title:@"文章标题"
                                            comment:nil
                                           animated:YES
                                             result:^(SSResponseState state, id<ISSCComment> comment, NSError *error) {
                                                 
                                                 if (state == SSResponseStateSuccess)
                                                 {
                                                     NSLog(@"评论成功!");
                                                 }
                                                 else if (state == SSResponseStateFail)
                                                 {
                                                     NSLog(@"评论失败! %@", error);
                                                 }
                                                 
                                             }];
}

- (void)pushCmtButtonClickHandler:(id)sender
{
            //Show comment view
    [self pushCommentViewControllerWithContentId:@"123456"
                                           title:@"文章标题"
                                         comment:nil
                                        animated:YES
                                          result:^(SSResponseState state, id<ISSCComment> comment, NSError *error) {
                                              
                                              if (state == SSResponseStateSuccess)
                                              {
                                                  NSLog(@"评论成功!");
                                              }
                                              else if (state == SSResponseStateFail)
                                              {
                                                  NSLog(@"评论失败! %@", error);
                                              }
                                              
                                          }];
}

@end
