//
//  AuthViewContriller.m
//  ShareSDKWatchAppDemo
//
//  Created by 刘 靖煌 on 15/5/29.
//  Copyright (c) 2015年 游族网络MOB事业部. All rights reserved.
//

#import "AuthViewContriller.h"
#import "PlatformListCell.h"

#import <AGCommon/UIImage+Common.h>
#import <ShareSDK/ShareSDK.h>

#define BUNDLE_NAME @"Resource"
#define BASE_TAG 100

@interface AuthViewContriller ()

/**
 *	@brief	用户信息更新
 *
 *	@param 	notif 	通知
 */
- (void)userInfoUpdateHandler:(NSNotification *)notif;

@end

@implementation AuthViewContriller

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        //监听用户信息变更
        [ShareSDK addNotificationWithName:SSN_USER_INFO_UPDATE
                                   target:self
                                   action:@selector(userInfoUpdateHandler:)];
        
        _shareTypeArray = [[NSMutableArray alloc] init];
        
        NSArray *shareTypes = [ShareSDK connectedPlatformTypes];
        for (int i = 0; i < [shareTypes count]; i++)
        {
            NSNumber *typeNum = [shareTypes objectAtIndex:i];
            ShareType type = (ShareType)[typeNum integerValue];
            id<ISSPlatformApp> app = [ShareSDK getClientWithType:type];
            
            if ([app isSupportOneKeyShare]
//                ||
//                type == ShareTypeInstagram ||
//                type == ShareTypeGooglePlus ||
//                type == ShareTypeQQSpace ||
//                type == ShareTypeWeixiSession
                )
            {
                [_shareTypeArray addObject:[NSMutableDictionary dictionaryWithObject:[shareTypes objectAtIndex:i]
                                                                              forKey:@"type"]];
            }
        }
        
        NSArray *authList = [NSArray arrayWithContentsOfFile:[NSString stringWithFormat:@"%@/authListCache.plist",NSTemporaryDirectory()]];
        
        if (authList == nil)
        {
            [_shareTypeArray writeToFile:[NSString stringWithFormat:@"%@/authListCache.plist",NSTemporaryDirectory()] atomically:YES];
        }
        else
        {
            for (int i = 0; i < [authList count]; i++)
            {
                NSDictionary *item = [authList objectAtIndex:i];
                for (int j = 0; j < [_shareTypeArray count]; j++)
                {
                    if ([[[_shareTypeArray objectAtIndex:j] objectForKey:@"type"] integerValue] == [[item objectForKey:@"type"] integerValue])
                    {
                        [_shareTypeArray replaceObjectAtIndex:j withObject:[NSMutableDictionary dictionaryWithDictionary:item]];
                        break;
                    }
                }
            }
        }
    }
    return self;
}

- (void)userInfoUpdateHandler:(NSNotification *)notif
{
    NSInteger plat = [[[notif userInfo] objectForKey:SSK_PLAT] integerValue];
    id<ISSPlatformUser> userInfo = [[notif userInfo] objectForKey:SSK_USER_INFO];
    
    for (int i = 0; i < [_shareTypeArray count]; i++)
    {
        NSMutableDictionary *item = [_shareTypeArray objectAtIndex:i];
        ShareType type = (ShareType)[[item objectForKey:@"type"] integerValue];
        if (type == plat)
        {
            [item setObject:[userInfo nickname] forKey:@"username"];
            [_tableView reloadData];
        }
    }
}

-(void)loadView
{
    [super loadView];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.rowHeight = 50.0;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _tableView.backgroundView = nil;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_shareTypeArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"platformListCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[PlatformListCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellAccessoryNone;

        UISwitch *switchCtrl = [[UISwitch alloc] initWithFrame:CGRectZero];
        [switchCtrl sizeToFit];
        [switchCtrl addTarget:self action:@selector(authSwitchChangeHandler:) forControlEvents:UIControlEventValueChanged];
        cell.accessoryView = switchCtrl;
    }
    
    if (indexPath.row < [_shareTypeArray count])
    {
        NSDictionary *item = [_shareTypeArray objectAtIndex:indexPath.row];
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:
                                            @"Icon/sns_icon_%ld.png",
                                            (long)[[item objectForKey:@"type"] integerValue]]
                                bundleName:BUNDLE_NAME];
        cell.imageView.image = img;
        ((UISwitch *)cell.accessoryView).on = [ShareSDK hasAuthorizedWithType:(ShareType)[[item objectForKey:@"type"] integerValue]];
        ((UISwitch *)cell.accessoryView).tag = BASE_TAG + indexPath.row;
        
        if (((UISwitch *)cell.accessoryView).on)
        {
            cell.textLabel.text = [item objectForKey:@"username"];
        }
        else
        {
            cell.textLabel.text = @"尚未授权";
        }
    }
    
    return cell;
}

- (void)authSwitchChangeHandler:(UISwitch *)sender
{
    NSInteger index = sender.tag - BASE_TAG;
    
    if (index < [_shareTypeArray count])
    {
        NSMutableDictionary *item = [_shareTypeArray objectAtIndex:index];
        if (sender.on)
        {
            //用户信息
            ShareType type = (ShareType)[[item objectForKey:@"type"] integerValue];
            id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                                 allowCallback:YES
                                                                 authViewStyle:SSAuthViewStyleFullScreenPopup
                                                                  viewDelegate:nil
                                                       authManagerViewDelegate:nil];
            //在授权页面中添加关注微博
            [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                            [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"刘靖煌"],
                                            SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                            [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"刘靖煌"],
                                            SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                            nil]];
            
            [ShareSDK getUserInfoWithType:type
                              authOptions:authOptions
                                   result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
                                       if (result)
                                       {
                                           [item setObject:[userInfo nickname] forKey:@"username"];
                                           [_shareTypeArray writeToFile:[NSString stringWithFormat:@"%@/authListCache.plist",NSTemporaryDirectory()] atomically:YES];
                                       }
                                       [_tableView reloadData];
                                   }];
        }
        else
        {
            //取消授权
            [ShareSDK cancelAuthWithType:(ShareType)[[item objectForKey:@"type"] integerValue]];
            [_tableView reloadData];
        }
    }
}


@end
