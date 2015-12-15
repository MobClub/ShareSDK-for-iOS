//
//  AuthViewController.m
//  ShareSDKDemo
//
//  Created by 刘靖煌 on 15/10/24.
//  Copyright © 2015年 mob.com. All rights reserved.
//

#import "AuthViewController.h"

//ShareSDK头文件
#import <ShareSDK/ShareSDK.h>

@implementation AuthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //添加测试按钮
    [self addButtonWithName:NSLocalizedString(@"AuthWithType", nil) action:@selector(authWithType:) index:0];
    [self addButtonWithName:NSLocalizedString(@"GetUserInfo", nil) action:@selector(getUserInfo:) index:1];
    [self addButtonWithName:NSLocalizedString(@"GetCredentialWithType", nil) action:@selector(getCredentialWithType:) index:2];
    [self addButtonWithName:NSLocalizedString(@"CancelAuthWithType", nil) action:@selector(cancelAuthWithType:) index:3];
    [self addButtonWithName:NSLocalizedString(@"AuthWithAuthOptions", nil) action:@selector(authWithAuthOptions:) index:4];
}

- (void)addButtonWithName:(NSString *)buttonName action:(SEL)action index:(NSInteger)index
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:buttonName forState:UIControlStateNormal];
    [btn sizeToFit];
    btn.frame = CGRectMake(self.view.frame.size.width/2 - 150 , 50 + index * 50, 300, 40);
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)authWithType:(id)sender
{
    [ShareSDK authWithType:ShareTypeMingDao
                   options:nil
                    result:^(SSAuthState state, id<ICMErrorInfo> error) {
                        
                        switch (state)
                        {
                            case SSAuthStateBegan:
                                NSLog(@"begin to auth");
                                break;
                            case SSAuthStateSuccess:
                            {
                                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                                message:nil
                                                                               delegate:self
                                                                      cancelButtonTitle:@"OK"
                                                                      otherButtonTitles:nil, nil];
                                [alert show];
                            }
                                break;
                            case SSAuthStateCancel:
                            {
                                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cancel"
                                                                                message:nil
                                                                               delegate:self
                                                                      cancelButtonTitle:@"OK"
                                                                      otherButtonTitles:nil, nil];
                                [alert show];
                            }
                                break;
                            case SSAuthStateFail:
                            {
                                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                                                message:[NSString stringWithFormat:@"error code: %zi,error description: %@",[error errorCode],[error errorDescription]]
                                                                               delegate:self
                                                                      cancelButtonTitle:@"OK"
                                                                      otherButtonTitles:nil, nil];
                                [alert show];
                            }
                                break;
                            default:
                                break;
                        }
                    }];
}

- (void)getUserInfo:(id)sender
{
    [ShareSDK getUserInfoWithType:ShareTypeWeixiSession
                      authOptions:nil
                           result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
                               
                               if (result)
                               {
                                   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                                   message:[NSString stringWithFormat:@"userInfo:%@",[userInfo sourceData]]
                                                                                  delegate:self
                                                                         cancelButtonTitle:@"OK"
                                                                         otherButtonTitles:nil, nil];
                                   [alert show];
                               }
                               else
                               {
                                   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                                                   message:[NSString stringWithFormat:@"error code: %zi,error description: %@",[error errorCode],[error errorDescription]]
                                                                                  delegate:self
                                                                         cancelButtonTitle:@"OK"
                                                                         otherButtonTitles:nil, nil];
                                   [alert show];
                               }
                           }];
}

- (void)getCredentialWithType:(id)sender
{
    //判断是否授权
    if ([ShareSDK hasAuthorizedWithType:ShareTypeSinaWeibo])
    {
        id<ISSPlatformCredential> credential = [ShareSDK getCredentialWithType:ShareTypeSinaWeibo];
        
        NSLog(@"uid : %@ , token : %@",credential.uid,credential.token);
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                        message:[NSString stringWithFormat:@"uid : %@ , token : %@",credential.uid,credential.token]
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                        message:@"unAuthorized"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
}

-(void)hasAuthorizedWithType:(id)sender
{
    BOOL isAuth = [ShareSDK hasAuthorizedWithType:ShareTypeSinaWeibo];
    NSLog(@"is Auth : %zi",isAuth);
    
    if (isAuth)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                        message:@"has authorized"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                        message:@"unAuthorized"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
    
}

-(void)cancelAuthWithType:(id)sender
{
    [ShareSDK cancelAuthWithType:ShareTypeSinaWeibo];
}

-(void)authWithAuthOptions:(id)sender
{
    //关注新浪微博目前只有在安装了客户端下有效
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:NO
                                                                scopes:@{@(ShareTypeSinaWeibo): @[@"follow_app_official_microblog"]}
                                                         powerByHidden:YES
                                                        followAccounts:nil
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:nil];
    
    [ShareSDK authWithType:ShareTypeSinaWeibo
                   options:authOptions
                    result:^(SSAuthState state, id<ICMErrorInfo> error) {
                        switch (state)
                        {
                            case SSAuthStateBegan:
                                NSLog(@"begin to auth");
                                break;
                            case SSAuthStateSuccess:
                            {
                                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                                message:nil
                                                                               delegate:self
                                                                      cancelButtonTitle:@"OK"
                                                                      otherButtonTitles:nil, nil];
                                [alert show];
                            }
                                break;
                            case SSAuthStateCancel:
                            {
                                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cancel"
                                                                                message:nil
                                                                               delegate:self
                                                                      cancelButtonTitle:@"OK"
                                                                      otherButtonTitles:nil, nil];
                                [alert show];
                            }
                                break;
                            case SSAuthStateFail:
                            {
                                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                                                message:[NSString stringWithFormat:@"error code: %zi,error description: %@",[error errorCode],[error errorDescription]]
                                                                               delegate:self
                                                                      cancelButtonTitle:@"OK"
                                                                      otherButtonTitles:nil, nil];
                                [alert show];
                            }
                                break;
                            default:
                                break;
                        }
                    }];
}

@end
