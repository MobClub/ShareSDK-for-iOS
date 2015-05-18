//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
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
    
    UIButton *setOtherUserButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [setOtherUserButton setTitle:@"设置第三方用户信息" forState:UIControlStateNormal];
    setOtherUserButton.frame = CGRectMake((self.view.frame.size.width - 200) / 2, 320, 200, 50);
    [setOtherUserButton addTarget:self action:@selector(setOtherUserButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:setOtherUserButton];
    
    //显示工具栏
    [self showCommentToolbarWithContentId:@"123456" title:@"文章标题"];
}

#pragma mark - Private

- (void)presentListButtonClickHandler:(id)sender
{
        //显示评论列表
        [self presentCommentListViewControllerWithContentId:@"123456" title:@"文章标题" animated:YES];
}

- (void)pushListButtonClickHandler:(id)sender
{
        //显示评论列表
        [self pushCommentListViewControllerWithContentId:@"123456" title:@"文章标题" animated:YES];
}

- (void)presentCmtButtonClickHandler:(id)sender
{
        //显示评论界面
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
        //显示评论界面
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

- (void)setOtherUserButtonClickHandler:(id)sender
{
    [Comment setUserInfoWithId:@"1234"
                      nickname:@"第三方用户"
                  profileImage:@"http://imgstatic.baidu.com/img/image/d833c895d143ad4bf450b6dd80025aafa40f06b4_%E5%89%AF%E6%9C%AC.jpg"];
}

@end
