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
#import <ShareSDK/SSDKAuthViewManager.h>

@interface MobAuthViewController ()
{
    IBOutlet UITableView *myTableView;
    NSArray *_platforemArray;
    NSArray *_overseasPlatforemArray;
    NSBundle *_uiBundle;
    NSArray *_titleArray;
    NSIndexPath *_selectIndexPath;
    NSMutableDictionary *_platforemUserInfos;
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
                        @(SSDKPlatformTypeDouyin),
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
                        @(SSDKPlatformTypeCMCC),
                        @(SSDKPlatformTypeESurfing),
                        @(SSDKPlatformTypeFacebookAccount),
                        @(SSDKPlatformTypeWework),
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
                                @(SSDKPlatformTypeTumblr),
                                @(SSDKPlatformTypeTelegram),
                                @(SSDKPlatformTypeReddit),
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
    switch (section)
    {
        case 0:
            return _platforemArray.count;
        case 1:
            return _overseasPlatforemArray.count;
        default:
            return 0;
    }
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
        NSString *title = obj;
        cell.textLabel.text = title;
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
        BOOL hasAuthed = [ShareSDK hasAuthorized:platformType];
        if(hasAuthed)
        {
             cell.accessoryView = [self getInfoView:platformType];
        }
        else
        {
            NSInteger tag = indexPath.section * 1000 + indexPath.row;
            cell.accessoryView = [self getAuthButton:tag];
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
    button.tapSpaceTime(5);
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
        NSLog(@"%@",user.dictionaryValue);
        textLabel.text = user.nickname;
        if (user.icon)
        {
            [[MOBFImageGetter sharedInstance] getImageWithURL:[NSURL URLWithString:user.icon]
                                                       result:^(UIImage *image, NSError *error) {
                                                           NSLog(@"result");
                                                           if(error == nil)
                                                           {
                                                               imageView.image = image;
                                                           }
                                                       }];
        }
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
    NSDictionary *setting = nil;
    
    // QQ 新增了二维码授权,QQAuthType授权类型 @0(优先客户端授权，未安装客户端进行web授权)、@1(优先客户端授权，未安装客户端进行二维码授权)
    // QQ 新增强制网页或二维码授权,QQForceWebLogin @1(强制根据QQAuthType进行 web授权或二维码授权)
    // 可不设置，默认为 @"QQAuthType":@(0),@"QQForceWebLogin"=@(0)
    if (platformType == SSDKPlatformTypeQQ || platformType == SSDKPlatformSubTypeQQFriend || platformType == SSDKPlatformSubTypeQZone) {
//        setting = @{@"QQAuthType":@(0),@"QQForceWebLogin":@(0)};
    }
    
    if (platformType == SSDKPlatformTypeFacebook)
    {
        // 新增一种模式 此模式v4.3.1开始为固定设置YES或NO都是一样一种模式
        setting = @{@"isBrowser":@(YES)};
    }
        
    [ShareSDK authorize:platformType
               settings:setting
         onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
             [button cancelRecordTime];
             switch (state) {
                 case SSDKResponseStateSuccess:
                 {
                     NSLog(@"授权 成功 user:%@",user.dictionaryValue);
                     
                     NSString *key = [NSString stringWithFormat:@"%@",@(platformType)];
                     [_platforemUserInfos setObject:user forKey:key];
                     [myTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
                     UIAlertControllerAlertCreate(@"授权成功", nil)
                     .addCancelAction(@"确认", 0)
                     .showFromViewController([MOBApplication sharedApplication].window.rootViewController);
                     
                     break;
                 }
                 case SSDKResponseStateFail:
                 {
                     NSLog(@"%@",error);
                     UIAlertControllerAlertCreate(@"授权失败", [NSString stringWithFormat:@"%@", error])
                     .addCancelAction(@"确认", 0)
                     .showFromViewController([MOBApplication sharedApplication].window.rootViewController);
                     break;
                 }
                     break;
                 case SSDKResponseStateCancel:
                 { 
                     UIAlertControllerAlertCreate(@"授权取消", nil)
                     .addCancelAction(@"确认", 0)
                     .showFromViewController([MOBApplication sharedApplication].window.rootViewController);
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
    if (indexPath.section == 0)//国内
    {
        platformType = [_platforemArray[indexPath.row] integerValue];
    }
    if(indexPath.section == 1)//国外
    {
        platformType = [_overseasPlatforemArray[indexPath.row] integerValue];
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
       
        
        UIAlertControllerAlertCreate(info, nil)
        .addCancelAction(@"暂不", 0)
        .addDefaultAction(@"确认取消", 1)
        .actionTap(^(NSInteger index, UIAlertAction * _Nonnull action) {
            if (index == 1) {
                if(_selectIndexPath != nil)
                {
                    SSDKPlatformType platformType = 0;
                    if(_selectIndexPath.section == 1)//国外
                    {
                        platformType = [_overseasPlatforemArray[_selectIndexPath.row] integerValue];
                    }
                    if(_selectIndexPath.section == 0)//国内
                    {
                        platformType = [_platforemArray[_selectIndexPath.row] integerValue];
                    }
                    //取消平台授权
                    [ShareSDK cancelAuthorize:platformType result:^(NSError *error) {
                        
                        NSString *key = [NSString stringWithFormat:@"%@",@(platformType)];
                        [_platforemUserInfos removeObjectForKey:key];
                        [myTableView reloadRowsAtIndexPaths:@[_selectIndexPath] withRowAnimation:UITableViewRowAnimationNone];
                    }];
                }
            }

        })
        .showFromViewController(self);
    }
    
}

@end
