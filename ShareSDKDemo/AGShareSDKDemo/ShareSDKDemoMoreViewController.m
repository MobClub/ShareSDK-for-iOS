//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:1955211608
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import "ShareSDKDemoMoreViewController.h"
#import <AGCommon/UINavigationBar+Common.h>
#import "SVModalWebViewController.h"
#import <AGCommon/UIImage+Common.h>

@interface ShareSDKDemoMoreViewController ()

@end

@implementation ShareSDKDemoMoreViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"AGShareSDK/PublishEx/CancelButtonBG.png" bundleName:@"Appgo"] forState:UIControlStateNormal];
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
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"AGShareSDK/PublishEx/NavigationBarBG.png" bundleName:@"Appgo"]];
    
    UITableView *tableView = [[[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped] autorelease];
    tableView.rowHeight = 50.0;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    listOfItems = [[NSMutableArray alloc] init];
    //联系方式
    NSArray *infoArray = [NSArray arrayWithObjects:
                              NSLocalizedString(@"ShareSDK新浪微博",nil),
                              NSLocalizedString(@"ShareSDK腾迅微博",nil),
                              NSLocalizedString(@"ShareSDK微信号:ShareSDK",nil),
                              NSLocalizedString(@"官方网站http://shareSDK.cn",nil),
                              NSLocalizedString(@"商务合作QQ:1955211608",nil),
                             
                              nil];
    NSDictionary *infoDict = [NSDictionary dictionaryWithObject:infoArray forKey:@"Countries"];
    
    
    //版本信息
	NSArray *aboutusArray = [NSArray arrayWithObjects:
                              NSLocalizedString(@"SDK版本 v1.0.1 (2013-01-17更新)",nil),
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
            return NSLocalizedString(@"通过以下方式获得SDK最新消息",nil);
            break;
        case 1:
            return NSLocalizedString(@"版本信息",nil);
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
    /*
     if (cell == nil) {
     cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
     }
     */
    if (cell != nil) {
        [cell release];
        
    }
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
	// Configure the cell...
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

    switch (indexPath.section)
    {
        case 0:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    SVModalWebViewController *vc = [[SVModalWebViewController alloc] initWithAddress:@"http://weibo.com/sharesdk"];
                    [self presentModalViewController:vc animated:YES];
                    [vc release];
                    break;
                }
                case 1:
                {
                    SVModalWebViewController *vc = [[SVModalWebViewController alloc] initWithAddress:@"http://t.qq.com/ShareSDK"];
                    [self presentModalViewController:vc animated:YES];
                    [vc release];
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
