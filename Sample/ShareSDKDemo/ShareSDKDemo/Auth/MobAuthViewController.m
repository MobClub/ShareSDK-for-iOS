//
//  MobAuthViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/5/11.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MobAuthViewController.h"
#import "UIImage+KaImage.h"
#import <ShareSDK/ShareSDK+Base.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>
#import <MOBFoundation/MOBFoundation.h>

@interface MobAuthViewController ()
{
    IBOutlet UITableView *myTableView;
    NSArray *_platforemArray;
    NSArray *_overseasPlatforemArray;
    NSBundle *_uiBundle;
    NSArray *_titleArray;
    NSIndexPath *_selectIndexPath;
    NSMutableDictionary *_platforemUserInfos;
    BOOL _isAuth;
}

@end

@implementation MobAuthViewController


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _platforemArray = @[
                        @(SSDKPlatformTypeSMS),
                        @(SSDKPlatformSubTypeQQFriend),
                        @(SSDKPlatformSubTypeWechatSession),
                        @(SSDKPlatformTypeSinaWeibo),
                        @(SSDKPlatformTypeTencentWeibo),
                        @(SSDKPlatformTypeDouBan),
                        @(SSDKPlatformTypeYinXiang),
                        @(SSDKPlatformTypeYouDaoNote),
                        @(SSDKPlatformTypeMingDao),
                        @(SSDKPlatformTypeKaixin),
                        @(SSDKPlatformTypeRenren),
                        @(SSDKPlatformSubTypeYiXinSession),
                        ];
    _overseasPlatforemArray = @[
                                @(SSDKPlatformTypeFacebook),
                                @(SSDKPlatformTypeTwitter),
                                @(SSDKPlatformTypeGooglePlus),
                                @(SSDKPlatformTypeLine),
                                @(SSDKPlatformSubTypeKakaoTalk),
                                @(SSDKPlatformTypeInstagram),
                                @(SSDKPlatformTypeFlickr),
                                @(SSDKPlatformTypeDropbox),
                                @(SSDKPlatformTypeEvernote),
                                @(SSDKPlatformTypeLinkedIn),
                                @(SSDKPlatformTypeVKontakte),
                                @(SSDKPlatformTypeInstapaper),
                                @(SSDKPlatformTypePinterest),
                                @(SSDKPlatformTypePocket),
                                @(SSDKPlatformTypeTumblr)
                                ];
    _titleArray = @[@"  国内平台",@"  海外平台"];
    _platforemUserInfos = [[NSMutableDictionary alloc] init];
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"ShareSDKUI" ofType:@"bundle"];
    _uiBundle = [NSBundle bundleWithPath:bundlePath];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(infoUPload) name:@"AuthInfoUPData" object:nil];
}


- (void)reload
{
    [myTableView reloadData];
}


- (void)infoUPload
{
    [myTableView reloadData];
}


- (IBAction)buttonAct:(UIButton *)sender
{
    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
    {
        return _platforemArray.count;
    }
    else if(section == 1)
    {
        return _overseasPlatforemArray.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseCell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseCell"];
    }

    id obj = nil;
    switch (indexPath.section) {
        case 0:
            obj = _platforemArray[indexPath.row];
            break;
        case 1:
            obj = _overseasPlatforemArray[indexPath.row];
            break;
    }
    if([obj isKindOfClass:[NSString class]])
    {
        NSString *titel = obj;
        cell.textLabel.text = titel;
        cell.imageView.image = nil;
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
    }
    else if([obj isKindOfClass:[NSNumber class]])
    {
        //title
        NSInteger platformType = [obj integerValue];
        if(platformType == SSDKPlatformSubTypeWechatSession)
        {
            cell.textLabel.text = NSLocalizedStringWithDefaultValue(@"ShareType_997", @"ShareSDKUI_Localizable", _uiBundle, @"ShareType_997", nil);
        }
        else if(platformType == SSDKPlatformSubTypeYiXinSession)
        {
            cell.textLabel.text = NSLocalizedStringWithDefaultValue(@"ShareType_994", @"ShareSDKUI_Localizable", _uiBundle, @"ShareType_994", nil);
        }
        else if(platformType == SSDKPlatformSubTypeKakaoTalk)
        {
            cell.textLabel.text = @"Kakao";
        }
        else
        {
            NSString *platformTypeName = [NSString stringWithFormat:@"ShareType_%zi",platformType];
            cell.textLabel.text = NSLocalizedStringWithDefaultValue(platformTypeName, @"ShareSDKUI_Localizable", _uiBundle, platformTypeName, nil);
        }
        //icon
        NSString *iconImageName = [NSString stringWithFormat:@"Icon_simple/sns_icon_%ld.png",(long)platformType];
        UIImage *icon = [UIImage imageWithContentsOfFile:[_uiBundle pathForResource:(iconImageName) ofType:nil]];
        cell.imageView.image = icon;
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        //检测平台是否已授权
        if(![ShareSDK hasAuthorized:platformType])
        {
            NSInteger tag = indexPath.section * 1000 + indexPath.row;
            cell.accessoryView = [self getAuthButton:tag];
        }
        else
        {
            cell.accessoryView = [self getInfoView:platformType];
        }
    }
    return cell;
}

- (UIButton *)getAuthButton:(NSInteger)tag
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitle:@"授权" forState:UIControlStateNormal];
    [button setTitleColor:[MOBFColor colorWithRGB:0xff7800] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage getImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:15]; //设置矩形四个圆角半径
    [button.layer setBorderWidth:1.0];
    button.layer.borderColor = [MOBFColor colorWithRGB:0xff7800].CGColor;
    button.tag = tag;
    [button addTarget:self action:@selector(authAct:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

//获取平台授权的当前用户信息
- (UIView *)getInfoView:(SSDKPlatformType)platformType
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [view addSubview:imageView];
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(45, 0, 55, 40)];
    textLabel.textColor = [MOBFColor colorWithRGB:0xa7abb2];
    textLabel.font = [UIFont systemFontOfSize:14];
    [view addSubview:textLabel];
    NSString *key = [NSString stringWithFormat:@"%@",@(platformType)];
    if([_platforemUserInfos valueForKey:key])
    {
        SSDKUser *user = [_platforemUserInfos valueForKey:key];
        //uid 可用于和自身用户系统进行用户绑定 使用
        NSLog(@"user uid %@",user.uid);
        NSLog(@"user nickname %@",user.nickname);
        NSLog(@"user icon %@",user.icon);
        NSLog(@"user rawData %@",user.rawData);
        textLabel.text = user.nickname;
        [[MOBFImageGetter sharedInstance] getImageWithURL:[NSURL URLWithString:user.icon]
                                                   result:^(UIImage *image, NSError *error) {
                                                       NSLog(@"result");
                                                       if(error == nil)
                                                       {
                                                           imageView.image = image;
                                                       }
                                                   }];
    }
    else
    {
        #pragma mark - 获取平台授权用户信息
        //获取平台授权用户信息
        [ShareSDK getUserInfo:platformType
               onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                   if(state == SSDKResponseStateSuccess)
                   {
                       [_platforemUserInfos setObject:user forKey:key];
                       //uid 可用于和自身用户系统进行用户绑定 使用
                       NSLog(@"user uid %@",user.uid);
                       NSLog(@"user nickname %@",user.nickname);
                       NSLog(@"user icon %@",user.icon);
                       textLabel.text = user.nickname;
                       [[MOBFImageGetter sharedInstance] getImageWithURL:[NSURL URLWithString:user.icon]
                                                                  result:^(UIImage *image, NSError *error) {
                                                                      NSLog(@"result");
                                                                      if(error == nil)
                                                                      {
                                                                          imageView.image = image;
                                                                      }
                                                                  }];
                   }
               }];
    }
    return view;
}

- (void)authAct:(UIButton *)button
{
    if(_isAuth)
    {
        return;
    }
    _isAuth = YES;
    NSIndexPath *indexPath = nil;
    SSDKPlatformType platformType = 0;
    if(button.tag >= 1000)//国外
    {
        platformType = [_overseasPlatforemArray[button.tag-1000] integerValue];
        indexPath = [NSIndexPath indexPathForRow:button.tag-1000 inSection:1];
    }
    else//国内
    {
        platformType = [_platforemArray[button.tag] integerValue];
        indexPath = [NSIndexPath indexPathForRow:button.tag inSection:0];
    }
    #pragma mark - 调用授权
    [ShareSDK authorize:platformType
               settings:nil
         onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
             switch (state) {
                 case SSDKResponseStateSuccess:
                 {
                     NSLog(@"授权 成功");
                     _isAuth = NO;
                     NSString *key = [NSString stringWithFormat:@"%@",@(platformType)];
                     [_platforemUserInfos setObject:user forKey:key];
                     [myTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
                     break;
                 }
                 case SSDKResponseStateFail:
                 {
                     NSLog(@"%@",error);
                     _isAuth = NO;
                     UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"授权失败"
                                                                         message:[NSString stringWithFormat:@"%@",error]
                                                                        delegate:nil
                                                               cancelButtonTitle:@"确认"
                                                               otherButtonTitles: nil];
                     [alertView show];
                     break;
                 }
                     break;
                 case SSDKResponseStateCancel:
                 {
                     _isAuth = NO;
                     UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"授权取消"
                                                                         message:nil
                                                                        delegate:nil
                                                               cancelButtonTitle:@"确认"
                                                               otherButtonTitles: nil];
                     [alertView show];
                     break;
                 }
                 default:
                     break;
             }
         }];
}



#pragma mark - Table view delegate


- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section < _titleArray.count)
    {
        return _titleArray[section];
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SSDKPlatformType platformType = 0;
    _selectIndexPath = indexPath;
    if(indexPath.section == 1)//国外
    {
        platformType = [_overseasPlatforemArray[indexPath.row] integerValue];
    }
    else//国内
    {
        platformType = [_platforemArray[indexPath.row] integerValue];
    }
    //检测平台是否已授权
    if([ShareSDK hasAuthorized:platformType])
    {
        NSString *name;
        if(platformType == SSDKPlatformSubTypeWechatSession)
        {
            name = NSLocalizedStringWithDefaultValue(@"ShareType_997", @"ShareSDKUI_Localizable", _uiBundle, @"ShareType_997", nil);
        }
        else if(platformType == SSDKPlatformSubTypeYiXinSession)
        {
            name = NSLocalizedStringWithDefaultValue(@"ShareType_994", @"ShareSDKUI_Localizable", _uiBundle, @"ShareType_994", nil);
        }
        else if(platformType == SSDKPlatformSubTypeKakaoTalk)
        {
           name = @"Kakao";
        }
        else
        {
            NSString *platformTypeName = [NSString stringWithFormat:@"ShareType_%zi",platformType];
            name = NSLocalizedStringWithDefaultValue(platformTypeName, @"ShareSDKUI_Localizable", _uiBundle, platformTypeName, nil);
        }
        NSString *info = [NSString stringWithFormat:@"是否取消 '%@' 的授权",name];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:info
                                                            message:nil
                                                           delegate:self
                                                  cancelButtonTitle:@"暂不"
                                                  otherButtonTitles:@"确认取消",nil];
        alertView.tag = 10002;
        [alertView show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alertView.tag == 10002)
    {
        if(buttonIndex == 1)
        {
            if(_selectIndexPath != nil)
            {
                SSDKPlatformType platformType = 0;
                if(_selectIndexPath.section == 1)//国外
                {
                    platformType = [_overseasPlatforemArray[_selectIndexPath.row] integerValue];
                }
                else//国内
                {
                    platformType = [_platforemArray[_selectIndexPath.row] integerValue];
                }
                //取消平台授权
                [ShareSDK cancelAuthorize:platformType];
                NSString *key = [NSString stringWithFormat:@"%@",@(platformType)];
                [_platforemUserInfos removeObjectForKey:key];
                [myTableView reloadRowsAtIndexPaths:@[_selectIndexPath] withRowAnimation:UITableViewRowAnimationNone];
            }
        }
    }
}


@end
