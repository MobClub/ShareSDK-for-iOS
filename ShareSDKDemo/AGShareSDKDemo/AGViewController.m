//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:1955211608
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import "AGViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <AGCommon/UIImage+Common.h>
#import <AGCommon/UIView+Common.h>
#import "AGShareCell.h"
#import <AGCommon/UINavigationBar+Common.h>
#import "AGShareButton.h"

#define TYPE_CELL_ID @"TypeCell"
#define STYLE_CELL_ID @"StyleCell"
#define TARGET_CELL_ID @"TargetCell"

@interface AGViewController (Private)

/**
 *	@brief	分享点击
 *
 *	@param 	sender 	事件对象
 */
- (void)actionClickHandler:(id)sender;

/**
 *	@brief	分享按钮点击事件
 *
 *	@param 	sender 	事件对象
 */
- (void)shareButtonClickHandler:(UIButton *)sender;

@end

@implementation AGViewController

- (id)init
{
    if (self = [super init])
    {
        self.title = @"自定义";
        
        UIButton *btn = [[[UIButton alloc] init] autorelease];
        [btn setBackgroundImage:[UIImage imageNamed:@"AGShareSDK/PublishEx/NavigationButtonBG.png" bundleName:@"Appgo"]
                       forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"ShareButtonIcon.png"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"ShareButtonHighLightedIcon.png"] forState:UIControlStateHighlighted];
        btn.frame = CGRectMake(0.0, 0.0, 53.0, 30.0);
        [btn addTarget:self action:@selector(actionClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:btn]
                                                  autorelease];
        
        _curShareViewStyle = 0;
        _curContentType = 2;
        _noneUIShareTypeArray = [[NSMutableArray alloc] initWithObjects:
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"新浪微博",
                                  @"title",
                                  [NSNumber numberWithBool:YES],
                                  @"selected",
                                  [NSNumber numberWithInteger:ShareTypeSinaWeibo],
                                  @"type",
                                  nil],
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"腾讯微博",
                                  @"title",
                                  [NSNumber numberWithBool:YES],
                                  @"selected",
                                  [NSNumber numberWithInteger:ShareTypeTencentWeibo],
                                  @"type",
                                  nil],
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"QQ空间",
                                  @"title",
                                  [NSNumber numberWithBool:YES],
                                  @"selected",
                                  [NSNumber numberWithInteger:ShareTypeQQSpace],
                                  @"type",
                                  nil],
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"人人网",
                                  @"title",
                                  [NSNumber numberWithBool:YES],
                                  @"selected",
                                  [NSNumber numberWithInteger:ShareTypeRenren],
                                  @"type",
                                  nil],
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"开心网",
                                  @"title",
                                  [NSNumber numberWithBool:YES],
                                  @"selected",
                                  [NSNumber numberWithInteger:ShareTypeKaixin],
                                  @"type",
                                  nil],
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"搜狐微博",
                                  @"title",
                                  [NSNumber numberWithBool:YES],
                                  @"selected",
                                  [NSNumber numberWithInteger:ShareTypeSohuWeibo],
                                  @"type",
                                  nil],
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"网易微博",
                                  @"title",
                                  [NSNumber numberWithBool:YES],
                                  @"selected",
                                  [NSNumber numberWithInteger:ShareType163Weibo],
                                  @"type",
                                  nil],
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"豆瓣社区",
                                  @"title",
                                  [NSNumber numberWithBool:YES],
                                  @"selected",
                                  [NSNumber numberWithInteger:ShareTypeDouBan],
                                  @"type",
                                  nil],
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"Instapaper",
                                  @"title",
                                  [NSNumber numberWithBool:YES],
                                  @"selected",
                                  [NSNumber numberWithInteger:ShareTypeInstapaper],
                                  @"type",
                                  nil],
                                 nil];
        _shareTypeArray = [[NSMutableArray alloc] initWithObjects:
                           [NSMutableDictionary dictionaryWithObjectsAndKeys:
                            @"新浪微博",
                            @"title",
                            [NSNumber numberWithBool:YES],
                            @"selected",
                            [NSNumber numberWithInteger:ShareTypeSinaWeibo],
                            @"type",
                            nil],
                           [NSMutableDictionary dictionaryWithObjectsAndKeys:
                            @"腾讯微博",
                            @"title",
                            [NSNumber numberWithBool:YES],
                            @"selected",
                            [NSNumber numberWithInteger:ShareTypeTencentWeibo],
                            @"type",
                            nil],
                           [NSMutableDictionary dictionaryWithObjectsAndKeys:
                            @"短信分享",
                            @"title",
                            [NSNumber numberWithBool:YES],
                            @"selected",
                            [NSNumber numberWithInteger:ShareTypeSMS],
                            @"type",
                            nil],
                           [NSMutableDictionary dictionaryWithObjectsAndKeys:
                            @"QQ空间",
                            @"title",
                            [NSNumber numberWithBool:YES],
                            @"selected",
                            [NSNumber numberWithInteger:ShareTypeQQSpace],
                            @"type",
                            nil],
                           [NSMutableDictionary dictionaryWithObjectsAndKeys:
                            @"微信好友",
                            @"title",
                            [NSNumber numberWithBool:YES],
                            @"selected",
                            [NSNumber numberWithInteger:ShareTypeWeixiSession],
                            @"type",
                            nil],
                           [NSMutableDictionary dictionaryWithObjectsAndKeys:
                            @"微信朋友圈",
                            @"title",
                            [NSNumber numberWithBool:YES],
                            @"selected",
                            [NSNumber numberWithInteger:ShareTypeWeixiTimeline],
                            @"type",
                            nil],
                           [NSMutableDictionary dictionaryWithObjectsAndKeys:
                            @"QQ",
                            @"title",
                            [NSNumber numberWithBool:YES],
                            @"selected",
                            [NSNumber numberWithInteger:ShareTypeQQ],
                            @"type",
                            nil],
                           [NSMutableDictionary dictionaryWithObjectsAndKeys:
                            @"人人网",
                            @"title",
                            [NSNumber numberWithBool:YES],
                            @"selected",
                            [NSNumber numberWithInteger:ShareTypeRenren],
                            @"type",
                            nil],
                           [NSMutableDictionary dictionaryWithObjectsAndKeys:
                            @"开心网",
                            @"title",
                            [NSNumber numberWithBool:YES],
                            @"selected",
                            [NSNumber numberWithInteger:ShareTypeKaixin],
                            @"type",
                            nil],
                           [NSMutableDictionary dictionaryWithObjectsAndKeys:
                            @"邮件分享",
                            @"title",
                            [NSNumber numberWithBool:YES],
                            @"selected",
                            [NSNumber numberWithInteger:ShareTypeMail],
                            @"type",
                            nil],
                           [NSMutableDictionary dictionaryWithObjectsAndKeys:
                            @"打印",
                            @"title",
                            [NSNumber numberWithBool:YES],
                            @"selected",
                            [NSNumber numberWithInteger:ShareTypeAirPrint],
                            @"type",
                            nil],
                           [NSMutableDictionary dictionaryWithObjectsAndKeys:
                            @"拷贝",
                            @"title",
                            [NSNumber numberWithBool:YES],
                            @"selected",
                            [NSNumber numberWithInteger:ShareTypeCopy],
                            @"type",
                            nil],
                           [NSMutableDictionary dictionaryWithObjectsAndKeys:
                            @"搜狐微博",
                            @"title",
                            [NSNumber numberWithBool:YES],
                            @"selected",
                            [NSNumber numberWithInteger:ShareTypeSohuWeibo],
                            @"type",
                            nil],
                           [NSMutableDictionary dictionaryWithObjectsAndKeys:
                            @"网易微博",
                            @"title",
                            [NSNumber numberWithBool:YES],
                            @"selected",
                            [NSNumber numberWithInteger:ShareType163Weibo],
                            @"type",
                            nil],
                           [NSMutableDictionary dictionaryWithObjectsAndKeys:
                            @"豆瓣社区",
                            @"title",
                            [NSNumber numberWithBool:YES],
                            @"selected",
                            [NSNumber numberWithInteger:ShareTypeDouBan],
                            @"type",
                            nil],
                           [NSMutableDictionary dictionaryWithObjectsAndKeys:
                            @"Instapaper",
                            @"title",
                            [NSNumber numberWithBool:YES],
                            @"selected",
                            [NSNumber numberWithInteger:ShareTypeInstapaper],
                            @"type",
                            nil],
                           nil];
    }
    
    return self;
}

- (void)dealloc
{
    SAFE_RELEASE(_shareTypeArray);
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"AGShareSDK/PublishEx/NavigationBarBG.png" bundleName:@"Appgo"]];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.width, self.view.height) style:UITableViewStyleGrouped];
    _tableView.rowHeight = 50;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView release];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private

- (void)shareButtonClickHandler:(UIButton *)sender
{
    NSString *content = nil;
    NSString *url = nil;
    UIImage *image = nil;
    SSPublishContentMediaType mediaType = SSPublishContentMediaTypeText;
    switch (_curContentType)
    {
        case 0:
            content = CONTENT;
            break;
        case 1:
            content = @"图片分享";
            image = [UIImage imageNamed:IMAGE_NAME];
            mediaType = SSPublishContentMediaTypeImage;
            break;
        case 2:
            content = CONTENT;
            image = [UIImage imageNamed:IMAGE_NAME];
            url = @"http://www.sharesdk.cn";
            mediaType = SSPublishContentMediaTypeNews;
            break;
        default:
            break;
    }
    
    ShareViewStyle  style = ShareViewStyleDefault;
    switch (_curShareViewStyle)
    {
        case 1:
            style = ShareViewStyleSimple;
            break;
        case 2:
            style = ShareViewStyleAppRecommend;
            break;
    }
    
    NSInteger type = [[[_shareTypeArray objectAtIndex:sender.tag - 200] objectForKey:@"type"] integerValue];
    [ShareSDK shareContentWithType:type
                           content:[ShareSDK publishContent:content
                                             defaultContent:@""
                                                      image:image
                                               imageQuality:0.8
                                                  mediaType:mediaType
                                                      title:@"ShareSDK"
                                                        url:url
                                               musicFileUrl:nil
                                                    extInfo:nil
                                                   fileData:nil]
               containerController:self
                     statusBarTips:YES
                   oneKeyShareList:[NSArray defaultOneKeyShareList]
                    shareViewStyle:style
                    shareViewTitle:@"内容分享"
                            result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    NSString *msg = nil;
                                    switch (type)
                                    {
                                        case ShareTypeAirPrint:
                                            msg = @"打印成功";
                                            break;
                                        case ShareTypeCopy:
                                            msg = @"拷贝成功";
                                            break;
                                        default:
                                            break;
                                    }
                                    
                                    if (msg)
                                    {
                                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                                            message:msg
                                                                                           delegate:nil
                                                                                  cancelButtonTitle:@"知道了"
                                                                                  otherButtonTitles: nil];
                                        [alertView show];
                                        [alertView release];
                                    }
                                }
                            }];
}

- (void)actionClickHandler:(id)sender
{
    NSString *content = nil;
    NSString *url = nil;
    UIImage *image = nil;
    SSPublishContentMediaType mediaType = SSPublishContentMediaTypeText;
    switch (_curContentType)
    {
        case 0:
            content = CONTENT;
            break;
        case 1:
            content = @"图片分享";
            image = [UIImage imageNamed:IMAGE_NAME];
            mediaType = SSPublishContentMediaTypeImage;
            break;
        case 2:
            content = CONTENT;
            image = [UIImage imageNamed:IMAGE_NAME];
            url = @"http://www.sharesdk.cn";
            mediaType = SSPublishContentMediaTypeNews;
            break;
        default:
            break;
    }
    
    NSMutableArray *shareList = [NSMutableArray array];
    if (_curShareViewStyle == 3)
    {
        for (int i = 0; i < [_noneUIShareTypeArray count]; i++)
        {
            NSDictionary *item = [_noneUIShareTypeArray objectAtIndex:i];
            if([[item objectForKey:@"selected"] boolValue])
            {
                [shareList addObject:[NSNumber numberWithInteger:[[item objectForKey:@"type"] integerValue]]];
            }
        }
        
        [ShareSDK shareContentWithShareList:shareList
                                    content:[ShareSDK publishContent:content
                                                      defaultContent:@""
                                                               image:image
                                                        imageQuality:0.8
                                                           mediaType:SSPublishContentMediaTypeNews
                                                               title:@"ShareSDK"
                                                                 url:url
                                                        musicFileUrl:nil
                                                             extInfo:nil
                                                            fileData:nil]
                              statusBarTips:YES
                                     result:nil];
    }
    else
    {
        ShareViewStyle  style = ShareViewStyleDefault;
        switch (_curShareViewStyle)
        {
            case 1:
                style = ShareViewStyleSimple;
                break;
            case 2:
                style = ShareViewStyleAppRecommend;
                break;
        }
        
        
        for (int i = 0; i < [_shareTypeArray count]; i++)
        {
            NSDictionary *item = [_shareTypeArray objectAtIndex:i];
            if([[item objectForKey:@"selected"] boolValue])
            {
                [shareList addObject:[NSNumber numberWithInteger:[[item objectForKey:@"type"] integerValue]]];
            }
        }
        
        //显示分享选择菜单
        //其中第三个参数为分享内容，其为一个实现了ISSPublishContent协议的对象，可以通过调用ShareSDK的publishContent方法进行对象初始化
        [ShareSDK showShareActionSheet:self
                             shareList:shareList
                               content:[ShareSDK publishContent:content
                                                 defaultContent:@""
                                                          image:image
                                                   imageQuality:0.8
                                                      mediaType:SSPublishContentMediaTypeNews
                                                          title:@"ShareSDK"
                                                            url:url
                                                   musicFileUrl:nil
                                                        extInfo:nil
                                                       fileData:nil]
                         statusBarTips:YES
                       oneKeyShareList:[NSArray defaultOneKeyShareList]
                        shareViewStyle:style
                        shareViewTitle:@"内容分享"
                                result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                    if (state == SSPublishContentStateSuccess)
                                    {
                                        NSString *msg = nil;
                                        switch (type)
                                        {
                                            case ShareTypeAirPrint:
                                                msg = @"打印成功";
                                                break;
                                            case ShareTypeCopy:
                                                msg = @"拷贝成功";
                                                break;
                                            default:
                                                break;
                                        }
                                        
                                        if (msg)
                                        {
                                            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                                                message:msg
                                                                                               delegate:nil
                                                                                      cancelButtonTitle:@"知道了"
                                                                                      otherButtonTitles: nil];
                                            [alertView show];
                                            [alertView release];
                                        }
                                    }
                                }];
    }
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return @"类型";
        case 1:
            return @"分享视图样式";
        case 2:
            return @"菜单内出现的分享项（可多选）";
        default:
            return nil;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return 3;
        case 1:
            return 4;
        case 2:
            if (_curShareViewStyle == 3)
            {
                return [_noneUIShareTypeArray count];
            }
            return [_shareTypeArray count];
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    switch (indexPath.section)
    {
        case 0:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:TYPE_CELL_ID];
            if (cell == nil)
            {
                cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TYPE_CELL_ID] autorelease];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            switch (indexPath.row)
            {
                case 0:
                    cell.textLabel.text = @"文字";
                    break;
                case 1:
                    cell.textLabel.text = @"图片";
                    break;
                case 2:
                    cell.textLabel.text = @"图文";
                    break;
                default:
                    break;
            }
            if (indexPath.row == _curContentType)
            {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            else
            {
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
            break;
        }
        case 1:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:STYLE_CELL_ID];
            if (cell == nil)
            {
                cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:STYLE_CELL_ID] autorelease];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            switch (indexPath.row)
            {
                case 0:
                    cell.textLabel.text = @"默认";
                    break;
                case 1:
                    cell.textLabel.text = @"简单";
                    break;
                case 2:
                    cell.textLabel.text = @"应用推荐";
                    break;
                case 3:
                    cell.textLabel.text = @"无界面";
                    break;
                default:
                    break;
            }
            if (indexPath.row == _curShareViewStyle)
            {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            else
            {
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
            break;
        }
        case 2:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:TARGET_CELL_ID];
            if (cell == nil)
            {
                cell = [[[AGShareCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TARGET_CELL_ID] autorelease];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            if (_curShareViewStyle == 3)
            {
                if (indexPath.row < [_noneUIShareTypeArray count])
                {
                    ((UIButton *)cell.accessoryView).tag = 200 + indexPath.row;
                    NSDictionary *item = [_noneUIShareTypeArray objectAtIndex:indexPath.row];
                    cell.textLabel.text = [item objectForKey:@"title"];
                    UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:
                                                        @"AGShareSDK/Icon/sns_icon_%d.png",
                                                        [[item objectForKey:@"type"] integerValue]]
                                            bundleName:@"Appgo"];
                    if (![[item objectForKey:@"selected"] boolValue])
                    {
                        //灰度化图片
                        img = img.grayImage;
                        cell.accessoryType = UITableViewCellAccessoryNone;
                    }
                    else
                    {
                        cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    }
                    cell.imageView.image = img;
                }
            }
            else
            {
                if (indexPath.row < [_shareTypeArray count])
                {
                    ((UIButton *)cell.accessoryView).tag = 200 + indexPath.row;
                    NSDictionary *item = [_shareTypeArray objectAtIndex:indexPath.row];
                    cell.textLabel.text = [item objectForKey:@"title"];
                    UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:
                                                        @"AGShareSDK/Icon/sns_icon_%d.png",
                                                        [[item objectForKey:@"type"] integerValue]]
                                            bundleName:@"Appgo"];
                    if (![[item objectForKey:@"selected"] boolValue])
                    {
                        //灰度化图片
                        img = img.grayImage;
                        cell.accessoryType = UITableViewCellAccessoryNone;
                    }
                    else
                    {
                        cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    }
                    cell.imageView.image = img;
                }
            }
            break;
        }
        default:
            break;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
            _curContentType = indexPath.row;
            [tableView reloadData];
            break;
        case 1:
            _curShareViewStyle = indexPath.row;
            [tableView reloadData];
            break;
        case 2:
            if (_curShareViewStyle == 3)
            {
                if (indexPath.row < [_noneUIShareTypeArray count])
                {
                    NSMutableDictionary *item = [_noneUIShareTypeArray objectAtIndex:indexPath.row];
                    BOOL selected = ![[item objectForKey:@"selected"] boolValue];
                    [item setObject:[NSNumber numberWithBool:selected] forKey:@"selected"];
                    [tableView reloadData];
                }
            }
            else
            {
                if (indexPath.row < [_shareTypeArray count])
                {
                    NSMutableDictionary *item = [_shareTypeArray objectAtIndex:indexPath.row];
                    BOOL selected = ![[item objectForKey:@"selected"] boolValue];
                    [item setObject:[NSNumber numberWithBool:selected] forKey:@"selected"];
                    [tableView reloadData];
                }
            }
            break;
        default:
            break;
    }
}

@end
