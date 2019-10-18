//
//  MOBPlatformViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBPlatformViewController.h"
#import <ShareSDKExtension/ShareSDK+Extension.h>
#import "AppDelegate.h"

@interface MOBPlatformViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSIndexPath *selectIndexPath;
    BOOL _isShare;
}

@end

@implementation MOBPlatformViewController

- (instancetype)init
{
    self = [self initWithNibName:@"MOBPlatformViewController" bundle:nil];
    if (self) {
        authTypeArray = @[];
        shareTypeArray = @[];
        selectorNameArray = @[];
        authSelectorNameArray = @[];
        otherTypeArray = @[];
        otherSelectorNameArray = @[];
    }
    return self;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        {
            return authTypeArray.count;
        }
        case 1:
        {
            return shareTypeArray.count;
        }
        case 2:
        {
            return otherTypeArray.count;
        }
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuseCell"];
    }
    switch (indexPath.section)
    {
        case 0:
        {
            if([ShareSDK hasAuthorized:platformType])
            {
                cell.detailTextLabel.text = @"已授权";
                cell.detailTextLabel.textColor = [UIColor blueColor];
            }
            else
            {
                cell.detailTextLabel.text = @"未授权";
                cell.detailTextLabel.textColor = [UIColor grayColor];
            }
            cell.textLabel.text = authTypeArray[indexPath.row];
            break;
        }
        case 1:
        {
            cell.textLabel.text = shareTypeArray[indexPath.row];
            cell.detailTextLabel.text = @"";
            NSString *imageName = shareIconArray[indexPath.row];
            cell.imageView.image = [UIImage imageNamed:imageName];
            if(!isTest)
            {
                cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shareIcon"]];
            }
            break;
        }
        case 2:
            cell.textLabel.text = otherTypeArray[indexPath.row];
            cell.detailTextLabel.text = @"";
            break;
        default:
            cell.textLabel.text = @"";
            cell.detailTextLabel.text = @"";
            break;
    }
    return cell;
}

- (void)shareWithParameters:(NSMutableDictionary *)parameters
{
//    if(_isShare)
//    {
//        return;
//    }
//    _isShare = YES;
    if(parameters.count == 0){
        UIAlertControllerAlertCreate(@"", @"请先设置分享参数")
        .addCancelAction(@"取消", 0)
        .showFromViewController(self);
        return;
    }
    [ShareSDK share:platformType
         parameters:parameters
     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
         if(state == SSDKResponseStateUpload){
             return ;
         }
         NSString *title = @"";
         NSString *typeStr = @"";
         UIColor *typeColor = [UIColor grayColor];
         switch (state) {
             case SSDKResponseStateSuccess:
             {
                 NSLog(@"分享成功");
                 _isShare = NO;
                 title = @"分享成功";
                 typeStr = @"成功";
                 typeColor = [UIColor blueColor];
                 break;
             }
             case SSDKResponseStateFail:
             {
                 _isShare = NO;
                 NSLog(@"---------------->share error :%@",error);
                 title = @"分享失败";
                 typeStr = [NSString stringWithFormat:@"%@",error];
                 if (platformType == SSDKPlatformTypeGooglePlus)
                 {
                     typeStr = [NSString stringWithFormat:@"%@\n详情见google官方公告：%@",typeStr,@"https://support.google.com/plus/answer/9195133?hl=zh-Hans&authuser=0"];
                     
                 }
                 typeColor = [UIColor redColor];
                 break;
             }
             case SSDKResponseStateCancel:
             {
                 _isShare = NO;
                 title = @"分享已取消";
                 typeStr = @"取消";
                 break;
             }
             default:
                 break;
         }
         if(isTest)
         {
             [mobTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
             if(selectIndexPath != nil)
             {
                 UITableViewCell *cell = [mobTableView cellForRowAtIndexPath:selectIndexPath];
                 cell.detailTextLabel.text = title;
                 cell.detailTextLabel.textColor = typeColor;
                 selectIndexPath = nil;
             }
         }
         
         dispatch_async(dispatch_get_main_queue(), ^{
             UIAlertControllerAlertCreate(title, typeStr)
             .addCancelAction(@"确定", 0)
             .showFromViewController(self);
         });
         
     }];
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.section)
    {
        case 0:
        {
            if(indexPath.row < authSelectorNameArray.count)
            {
                if([ShareSDK hasAuthorized:platformType])
                {
                    UIAlertControllerAlertCreate(@"是否取消授权", nil)
                    .addCancelAction(@"暂不", 0)
                    .addDefaultAction(@"确认", 1)
                    .actionTap(^(NSInteger index, UIAlertAction * _Nonnull action) {
                        if (index == 1) {
                            [ShareSDK cancelAuthorize:platformType result:nil];
                            if(isTest)
                            {
                                [mobTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
                            }
                        }
                    })
                    .showFromViewController(self);
                }
                else
                {
                    NSString *selectorName = authSelectorNameArray[indexPath.row];
                    [self funcWithSelectorName:selectorName];
                }
            }
            break;
        }
        case 1:
        {
            if(indexPath.row < selectorNameArray.count)
            {
                selectIndexPath = indexPath;
                NSString *selectorName = selectorNameArray[indexPath.row];
                [self funcWithSelectorName:selectorName];
            }
            break;
        }
        case 2:
        {
            if(indexPath.row < otherSelectorNameArray.count)
            {
                NSString *selectorName = otherSelectorNameArray[indexPath.row];
                [self funcWithSelectorName:selectorName];
            }
            break;
        }
        default:
            break;
    }
}



- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            if(authTypeArray.count > 0)
            {
                return @" ";
            }
            return nil;
        }
        case 1:
        {
            if(shareTypeArray.count > 0)
            {
                return @" ";
            }
            return nil;
        }
        case 2:
        {
            if(otherTypeArray.count > 0)
            {
                return @" ";
            }
            return nil;
        }
        default:
            return nil;
    }
}

- (void)funcWithSelectorName:(NSString *)selectorName
{
    SEL sel = NSSelectorFromString(selectorName);
    if([self respondsToSelector:sel])
    {
        IMP imp = [self methodForSelector:sel];
        void (*func)(id, SEL) = (void *)imp;
        func(self, sel);
    }
}

- (void)authAct
{
    [ShareSDK authorize:platformType
               settings:nil
         onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
             NSString *title = @"";
             switch (state)
             {
                 case SSDKResponseStateSuccess:
                 {
                     
                     title = @"授权成功";
                     NSLog(@"%@",user.rawData);
                     if(isTest)
                     {
                         [mobTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
                     }
                     
                     UIAlertControllerAlertCreate(title, nil)
                     .addCancelAction(@"确定", 0)
                     .showFromViewController(self);
                     break;
                 }
                 case SSDKResponseStateFail:
                 {
                     title = @"授权失败";
                     NSLog(@"error :%@",error);
                    
                     UIAlertControllerAlertCreate(title, [NSString stringWithFormat:@"%@", error])
                     .addCancelAction(@"确定", 0)
                     .showFromViewController(self);
                     break;
                 }
                 case SSDKResponseStateCancel:
                 {
                     title = @"取消授权";
                     
                     UIAlertControllerAlertCreate(title, nil)
                     .addCancelAction(@"确定", 0)
                     .showFromViewController(self);
                      break;
                 }
                 default:
                     break;
             }
         }];
}

- (void)isInstallAPP
{
    NSString *title = @"";
    if([ShareSDK isClientInstalled:platformType])
    {
        title = @"已安装";
    }
    else
    {
        title = @"未安装";
    }
    
    UIAlertControllerAlertCreate(title, nil)
    .addCancelAction(@"确定", 0)
    .showFromViewController(self);
}

@end
