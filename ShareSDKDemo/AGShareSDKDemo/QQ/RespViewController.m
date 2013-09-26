//
//  RespViewController.m
//  QQApiDemo
//
//  Created by Tencent on 12-5-7.
//  Copyright 2012年 Tencent. All rights reserved.
//

#import "RespViewController.h"
#import "HeadView.h"
#import <AGCommon/NSString+Common.h>
#import <TencentOpenAPI/QQApi.h>
#import <ShareSDK/ShareSDK.h>


@implementation RespViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        _featureNames = [[NSMutableArray alloc] initWithObjects:
                         @"响应文本消息",
                         @"响应图片消息",
                         @"响应新闻消息",
                         @"响应音频消息",
                         @"响应视频消息",
                         nil];
    }
    
    return self;
}

- (void)dealloc
{
    [_featureNames release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([[UIDevice currentDevice].systemVersion versionStringCompare:@"7.0"] != NSOrderedAscending)
    {
        [self setExtendedLayoutIncludesOpaqueBars:NO];
        [self setEdgesForExtendedLayout:SSRectEdgeBottom | SSRectEdgeLeft | SSRectEdgeRight];
    }
    
    self.view.backgroundColor = [UIColor colorWithRed:0xe0/255.f green:0xe0/255.f blue:0xe0/255.f alpha:1.f];
    const int h = 137;
	
    // head
    HeadView* headView = [[[HeadView alloc] initWithFrame:CGRectMake(0, 0, 320, h)] autorelease];
    [self.view addSubview:headView];
    
    // table
    int tableH = 480 - 20 - h;
    _featureListView = [[UITableView alloc] initWithFrame:CGRectMake(0, h, 320, tableH) style:UITableViewStyleGrouped];
    _featureListView.dataSource = self;
    _featureListView.delegate = self;
    [self.view addSubview:_featureListView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    [_featureListView release];
    _featureListView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - 
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_featureNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc]
				 initWithStyle:UITableViewCellStyleDefault
				 reuseIdentifier:cellIdentifier] autorelease];
    }
    
    if(indexPath.section == 0)
    {
		cell.textLabel.text = [_featureNames objectAtIndex:indexPath.row];
		cell.textLabel.textAlignment = UITextAlignmentCenter;
	}
	
    return cell;
}

#pragma mark - 

- (void)sendTextMsg
{
    QQApiTextObject* txt = [QQApiTextObject objectWithText:@"过去两年移动互联网有很多开放平台非常成功。事实上到现在来看，发展到现在一年多，最关键的开放平台是能不能真正从用户和经济回报中打造生态链。"];
    
    QQApiMessage* msg = [QQApiMessage messageWithObject:txt andType:QQApiMessageTypeGetMessageFromQQResponse];
    
    [QQApi sendMessage:msg];
}

- (void)sendImageMsg
{
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"img.jpg"];
    NSData* data = [NSData dataWithContentsOfFile:path];
	
    QQApiImageObject* img = [QQApiImageObject objectWithData:data previewImageData:data title:@"test title" description:@"desc"];
    QQApiMessage* msg = [QQApiMessage messageWithObject:img andType:QQApiMessageTypeGetMessageFromQQResponse];
    
    [QQApi sendMessage:msg];
}

- (void)sendNewsMsg
{
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"news.jpg"];
    NSData* data = [NSData dataWithContentsOfFile:path];
    
	NSURL* url = [NSURL URLWithString:@"http://2012.qq.com/a/20120510/000064.htm"];
	
    QQApiNewsObject* img = [QQApiNewsObject objectWithURL:url title:@"天公作美伦敦奥运圣火点燃成功 火炬传递开启" description:@"腾讯体育讯 当地时间5月10日中午，阳光和全世界的目光聚焦于希腊最高女祭司手中的火炬上，5秒钟内世界屏住呼吸。火焰骤然升腾的瞬间，古老的号角声随之从赫拉神庙传出——第30届伦敦夏季奥运会圣火在古奥林匹亚遗址点燃。取火仪式前，国际奥委会主席罗格、希腊奥委会主席卡普拉洛斯和伦敦奥组委主席塞巴斯蒂安-科互赠礼物，男祭司继北京奥运会后，再度出现在采火仪式中。" previewImageData:data];
    
    QQApiMessage* msg = [QQApiMessage messageWithObject:img andType:QQApiMessageTypeGetMessageFromQQResponse];
    
    [QQApi sendMessage:msg];

}

- (void)sendAudioMsg
{
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"audio.jpg"];
    NSData* data = [NSData dataWithContentsOfFile:path];
    
	NSURL* url = [NSURL URLWithString:@"http://y.qq.com/#type=album&id=117803"];
    
    QQApiAudioObject* img = [QQApiAudioObject objectWithURL:url title:@"那些年	胡夏" description:@"又回到最初的起点\
							 记忆中你青涩的脸\
							 我们终於来到了这一天\
							 桌垫下的老照片\
							 无数回忆连结\
							 今天男孩要赴女孩最后的约\
							 又回到最初的起点\
							 呆呆地站在镜子前\
							 笨拙系上红色领带的结\
							 将头发梳成大人模样\
							 穿上一身帅气西装\
							 等会儿见你一定比想像美" previewImageData:data];
    
    QQApiMessage* msg = [QQApiMessage messageWithObject:img andType:QQApiMessageTypeGetMessageFromQQResponse];
    
    [QQApi sendMessage:msg];

}

- (void)sendVideoMsg
{
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"video.jpg"];
    NSData* data = [NSData dataWithContentsOfFile:path];
    
	NSURL* url = [NSURL URLWithString:@"http://www.tudou.com/programs/view/_cVM3aAp270/"];
	
    QQApiVideoObject* img = [QQApiVideoObject objectWithURL:url title:@"腾讯暗黑风动作新游《天刹》国服视频曝光" description:@"你觉得正在玩的动作游戏的打击感不够好？战斗不够真实缺乏技巧？PVP索然无味完全是比谁装备好？那么现在有款新游戏或许能满足你的胃口！ 《天刹》是由韩国nse公司开发，腾讯全球代理中国首发的3D锁视角动作游戏，是一款有着暗黑写实风格、东方奇幻题材的游戏，具备打击感十足的动作体验、策略多变的战斗方式，游戏操作不难但有足够的深度，在动作游戏领域首次引入了手动格挡格斗机制，构建快速攻防转换体系。 官方网站：tian.qq.com 官方微博：http://t.qq.com/tiancha001" previewImageData:data];
    
    QQApiMessage* msg = [QQApiMessage messageWithObject:img andType:QQApiMessageTypeGetMessageFromQQResponse];
    
    [QQApi sendMessage:msg];

}

#pragma mark -
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int section = indexPath.section;
	int row = indexPath.row;
	if(section == 0)
    {
		switch (row)
        {
			case 0:
                [self sendTextMsg];
				break;
			case 1:
                [self sendImageMsg];
				break;                
			case 2:
                [self sendNewsMsg];
				break;
			case 3:
                [self sendAudioMsg];
				break;
			case 4:
                [self sendVideoMsg];
				break;
			default:
				NSLog(@"No event handling for row %d",row);
				break;
		}
	}
	
	[_featureListView deselectRowAtIndexPath:indexPath animated:YES];
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark -



@end
