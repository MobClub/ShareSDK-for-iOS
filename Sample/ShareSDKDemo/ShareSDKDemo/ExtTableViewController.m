//
//  ExtTableViewController.m
//  ShareSDKDemo
//
//  Created by Max on 2018/7/23.
//  Copyright © 2018年 Max. All rights reserved.
//

#import "ExtTableViewController.h"
#import <ShareSDKExtension/ShareSDK+Extension.h>
#import <MOBFoundation/MOBFoundation.h>

@interface ExtTableViewController ()

@end

@implementation ExtTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Extension Test";
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"1111"];

    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"CallApi";
            break;
        case 1:
            cell.textLabel.text = @"GetFriends";
            break;
        case 2:
            cell.textLabel.text = @"AddFriends";
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row)
    {
        case 0:
            [self _callApi];
            break;
        case 1:
            [self _getFriends];
            break;
        case 2:
            [self _addFriends];
            break;
        default:
            break;
    }
}

- (void)_callApi
{
//    NSDictionary *params = @{
//                             @"uid":@"2704265035",
//                             @"cursor":@"1111",
//                             @"count":@(10)
//                             };
    
/*
 var params = {
 "propertyKeys": $mob.utils.objectToJsonString(["nickname", "thumbnail_image", "profile_image"])
 };
 
 Kakao.callApi(platformInfo.userinfo.credential, "https://kapi.kakao.com/v1/user/me", "GET", params, null, function(state, data) {
 */
    
//        NSDictionary *params = @{
//                                 @"propertyKeys":[MOBFJson jsonStringFromObject:@[@"nickname", @"thumbnail_image", @"profile_image"]]
//                                 };
    
    /*
     var params = {
     "fields": "uid,name,gender,hometown,city,status,logo120,logo50,birthday,bodyform,blood,marriage,trainwith,interest,favbook,favmovie,favtv,idol,motto,wishlist,intro,education,schooltype,school,class,year,career,company,dept,beginyear,beginmonth,endyear,endmonth,isStar,pinyin,online"
     };
     
     KaiXin.callApi(credential, "https://api.kaixin001.com/users/me.json", "GET", params, null, function(state, data) {
     */
    
//        NSDictionary *params = @{
//                                 @"fields":@"uid,name,gender,hometown,city,status,logo120,logo50,birthday,bodyform,blood,marriage,trainwith,interest,favbook,favmovie,favtv,idol,motto,wishlist,intro,education,schooltype,school,class,year,career,company,dept,beginyear,beginmonth,endyear,endmonth,isStar,pinyin,online"
//                                 };
//
    
//    MingDao.callApi(credential, "https://api.mingdao.com/passport/detail", "GET", {"format" : "json"}, null, function (state, data) {

    [ShareSDK callApi:SSDKPlatformTypeMingDao url:@"https://api.mingdao.com/passport/detail" method:@"GET" parameters:@{@"format" : @"json"} headers:@{} onStateChanged:^(SSDKResponseState state, id data, NSError *error) {
        
        
    }];
}

- (void)_getFriends
{
    [ShareSDK getFriends:SSDKPlatformTypeMingDao cursor:100 size:10 onStateChanged:^(SSDKResponseState state, SSDKFriendsPaging *paging, NSError *error) {
        
        
    }];
}

- (void)_addFriends
{
    SSDKUser *user =  [[SSDKUser alloc] init];
    user.uid = @"2704265035";
    user.nickname = @"Evhbvber";
    [ShareSDK addFriend:SSDKPlatformTypeMingDao user:user onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        
        
    }];
}

@end
