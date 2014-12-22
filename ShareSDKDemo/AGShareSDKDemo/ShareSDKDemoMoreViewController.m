//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "ShareSDKDemoMoreViewController.h"
#import <AGCommon/UINavigationBar+Common.h>
#import "SVModalWebViewController.h"
#import <AGCommon/UIImage+Common.h>
#import <AGCommon/UIColor+Common.h>
#import <ShareSDK/ShareSDK.h>
#import "AGAppDelegate.h"

@interface ShareSDKDemoMoreViewController ()

@end

@implementation ShareSDKDemoMoreViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        
        _appDelegate = (AGAppDelegate *)[UIApplication sharedApplication].delegate;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png" bundleName:BUNDLE_NAME]
                          forState:UIControlStateNormal];
        [button setTitle:NSLocalizedString(@"TEXT_CANCEL", @"取消") forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.frame = CGRectMake(0.0, 0.0, 55.0, 32.0);
        [button addTarget:self action:@selector(cancelButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:button] autorelease];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneNavigationBarBG.png"]];
    
    UITableView *tableView = [[[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped] autorelease];
    tableView.rowHeight = 50.0;
    tableView.backgroundColor = [UIColor colorWithRGB:0xe1e0de];
    tableView.backgroundView = nil;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    listOfItems = [[NSMutableArray alloc] init];
        //联系方式
        NSArray *infoArray = [NSArray arrayWithObjects:
                              NSLocalizedString(@"TEXT_SDK_SINA_WEIBO", @"ShareSDK新浪微博"),
                              NSLocalizedString(@"TEXT_SDK_TENCENT_WEIBO", @"ShareSDK腾迅微博"),
                              NSLocalizedString(@"TEXT_SDK_WECHAT", @"ShareSDK微信号:ShareSDK"),
                              NSLocalizedString(@"TEXT_OFFICAL_WEBSITE", @"官方网站http://shareSDK.cn"),
                              NSLocalizedString(@"TEXT_SDK_QQ", @"商务合作QQ:1955211608"),
                             
                              nil];
    NSDictionary *infoDict = [NSDictionary dictionaryWithObject:infoArray forKey:@"Countries"];
    
        //版本信息
    	NSArray *aboutusArray = [NSArray arrayWithObjects:
                              NSLocalizedString(@"TEXT_SDK_VERSION", @"SDK版本 v1.1.2 (2013-01-25更新)"),
                              nil];
	NSDictionary *aboutusDict = [NSDictionary dictionaryWithObject:aboutusArray forKey:@"Countries"];
    [listOfItems addObject:infoDict];
    [listOfItems addObject:aboutusDict];

}

 

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
     return [listOfItems count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	NSDictionary *dictionary = [listOfItems objectAtIndex:section];
	NSArray *array = [dictionary objectForKey:@"Countries"];
	return [array count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {    
    switch (section) {
        case 0:
            return NSLocalizedString(@"TEXT_SDK_NEWS", @"通过以下方式获得SDK最新消息");
            break;
        case 1:
            return NSLocalizedString(@"TEXT_VERSION", @"版本信息");
            break;
		default:
			break;
    }
    return nil;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
     cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
     
//    if (cell != nil) {
//        [cell release];
//        
//    }
//    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
	
	NSDictionary *dictionary = [listOfItems objectAtIndex:indexPath.section];
	NSArray *array = [dictionary objectForKey:@"Countries"];
	NSString *cellValue = [array objectAtIndex:indexPath.row];
	cell.textLabel.text = cellValue;
    cell.textLabel.font = [UIFont fontWithName:@"Thonburi-Bold" size:17];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.section)
    {
        case 0:
        {
            id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                                 allowCallback:YES
                                                                 authViewStyle:SSAuthViewStyleFullScreenPopup
                                                                  viewDelegate:nil
                                                       authManagerViewDelegate:_appDelegate.viewDelegate];
            
                        //在授权页面中添加关注官方微博
                        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                            [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                            SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                            [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                            SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                            nil]];
            
            switch (indexPath.row)
            {
                case 0:
                {
                                        //关注用户
                                        [ShareSDK followUserWithType:ShareTypeSinaWeibo
                                           field:@"ShareSDK"
                                       fieldType:SSUserFieldTypeName
                                     authOptions:authOptions
                                    viewDelegate:_appDelegate.viewDelegate
                                          result:^(SSResponseState state, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
                                              
                                              NSString *msg = nil;
                                              if (state == SSResponseStateSuccess)
                                              {
                                                  msg = NSLocalizedString(@"TEXT_FOLLOW_SUC", @"关注成功");
                                              }
                                              else if (state == SSResponseStateFail)
                                              {
                                                  switch ([error errorCode])
                                                  {
                                                      case 20506:
                                                          msg = NSLocalizedString(@"TEXT_FOLLOWED", @"已关注");
                                                          break;
                                                          
                                                      default:
                                                          msg = [NSString stringWithFormat:NSLocalizedString(@"TEXT_FOLLOW_FAI", @"关注失败:%@"), error.errorDescription];
                                                          break;
                                                  }
                                              }
                                              
                                              if (msg)
                                              {
                                                  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                                      message:msg
                                                                                                     delegate:nil
                                                                                            cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                                            otherButtonTitles:nil];
                                                  [alertView show];
                                                  [alertView release];
                                              }
                    }];
                    break;
                }
                case 1:
                {
                    [ShareSDK followUserWithType:ShareTypeTencentWeibo
                                           field:@"ShareSDK"
                                       fieldType:SSUserFieldTypeName
                                     authOptions:authOptions
                                    viewDelegate:_appDelegate.viewDelegate
                                          result:^(SSResponseState state, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
                                              
                                              NSString *msg = nil;
                                              if (state == SSResponseStateSuccess)
                                              {
                                                  msg = NSLocalizedString(@"TEXT_FOLLOW_SUC", @"关注成功");
                                              }
                                              else if (state == SSResponseStateFail)
                                              {
                                                  switch ([error errorCode])
                                                  {
                                                      case 20506:
                                                          msg = NSLocalizedString(@"TEXT_FOLLOWED", @"已关注");
                                                          break;
                                                          
                                                      default:
                                                          msg = [NSString stringWithFormat:NSLocalizedString(@"TEXT_FOLLOW_FAI", @"关注失败:%@"), error.errorDescription];
                                                          break;
                                                  }
                                              }
                                              
                                              if (msg)
                                              {
                                                  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                                      message:msg
                                                                                                     delegate:nil
                                                                                            cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了") 
                                                                                            otherButtonTitles:nil];
                                                  [alertView show];
                                                  [alertView release];
                                              }
                                          }];
                    break;
                }
                case 2:
                {
                    [ShareSDK followUserWithType:ShareTypeWeixiSession
                                           field:@"http://weixin.qq.com/r/HHURHl7EjmDxh099nyA4"
                                       fieldType:SSUserFieldTypePath
                                     authOptions:Nil
                                    viewDelegate:nil
                                          result:^(SSResponseState state, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
                                              NSLog(@"state == %d", state);
                                          }];
                    break;
                }
                case 3:
                {
                    SVModalWebViewController *vc = [[SVModalWebViewController alloc] initWithAddress:@"http://shareSDK.cn"];
                    [self presentModalViewController:vc animated:YES];
                    [vc release];
                    break;
                }
                default:
                    break;
            }
            
            break;
        }
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private

- (void)cancelButtonClickHandler:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

@end
