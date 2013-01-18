//
//  ViewController.m
//  QQApiDemo
//
//  Created by Tencent on 12-5-7.
//  Copyright (c) 2012年 Tencent. All rights reserved.
//

#import "QQDemoViewController.h"
#import "HeadView.h"
#import "QQTextViewController.h"
#import "QQApi/QQApi.h"
#import <AGCommon/UINavigationBar+Common.h>
#import <AGCommon/UIImage+Common.h>
#import "ShareSDKDemoMoreViewController.h"


@interface QQDemoViewController (TestMethods)
- (BOOL)checkQQ;
- (void)sendTextMessage;
- (void)sendImageMessage;
- (void)sendNewsMessage;
- (void)sendAudioMessage;
- (void)sendVideoMessage;
- (void)doEditText;
- (void)doSelImage;
- (void)showTestContent;
@end


@implementation QQDemoViewController



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        _featureNames = [[NSMutableArray alloc] initWithObjects:
                         @"发送文本消息",
                         @"发送图片消息",
                         @"发送新闻消息",
                         @"发送音频消息",
                         @"发送视频消息",
                         nil];
        
        _featureNames2 = [[NSMutableArray alloc] initWithObjects:
                          @"编辑发送文本", 
                          @"选择发送图片", 
                          nil];
        
        _featureNames3 = [[NSMutableArray alloc] initWithObjects:
                          @"显示测试内容",
                          nil];

        UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoLight];
        button.frame = CGRectMake(0.0, 0.0, 43, 33);
        [button addTarget:self action:@selector(moreButtonClickHanlder:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:button] autorelease];

    }
    
    return self;
}

- (void)dealloc
{
    [_featureNames release];
    [_featureNames2 release];
    [_featureNames3 release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"QQ";
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"AGShareSDK/PublishEx/NavigationBarBG.png" bundleName:@"Appgo"]];

    self.view.backgroundColor = [UIColor colorWithRed:0xe0/255.f green:0xe0/255.f blue:0xe0/255.f alpha:1.f];
    const int h = 110;
	
    // head
    HeadView* headView = [[[HeadView alloc] initWithFrame:CGRectMake(0, 0, 320, h)] autorelease];
    [self.view addSubview:headView];
    
    // table
    int tableH = self.view.height - h;
    _featureListView = [[UITableView alloc] initWithFrame:CGRectMake(0, h, 320, tableH) style:UITableViewStyleGrouped];
    _featureListView.scrollEnabled = YES;
    _featureListView.dataSource = self;
    _featureListView.delegate = self;
    _featureListView.backgroundColor = [UIColor colorWithRed:(214.f/255.f) green:(214.f/255.f) blue:(214.f/255.f) alpha:1];
    _featureListView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_featureListView];
    
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    [_featureListView release];
    _featureListView = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - 
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0) return [_featureNames count];
    else if(section == 1) return [_featureNames2 count];
    else if(section == 2) return [_featureNames3 count];
    
    return 0;
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
    else if(indexPath.section == 1)
    {
        cell.textLabel.text = [_featureNames2 objectAtIndex:indexPath.row];
        cell.textLabel.textAlignment = UITextAlignmentCenter;
    }
    else if(indexPath.section == 2)
    {
        cell.textLabel.text = [_featureNames3 objectAtIndex:indexPath.row];
        cell.textLabel.textAlignment = UITextAlignmentCenter;
    }
	
    return cell;
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
				[self sendTextMessage];
				break;
			case 1:
				[self sendImageMessage];
				break;                
			case 2:
				[self sendNewsMessage];
				break;
			case 3:
				[self sendAudioMessage];
				break;
			case 4:
				[self sendVideoMessage];
				break;
			default:
				NSLog(@"No event handling for row %d",row);
				break;
		}
	}
    else if(section == 1)
    {
        switch (row) 
        {
            case 0:
                [self doEditText];
                break;
            case 1:
                [self doSelImage];
                break;
            default:
                break;
        }
    }
    else if(section == 2)
    {
        switch (row) 
        {
            case 0:
                [self showTestContent];
                break;
                
            default:
                break;
        }
    }
	
	[_featureListView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -

- (void)onTextViewCancel
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)onTextViewDone:(NSString*)text
{
    [self dismissModalViewControllerAnimated:YES];
    
    if(![self checkQQ]) return;
    
    QQApiTextObject* txt = [QQApiTextObject objectWithText:text];
    QQApiMessage* msg = [QQApiMessage messageWithObject:txt];
    [QQApi sendMessage:msg];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if([self checkQQ])
    {
        UIImage * selImg = [info objectForKey:UIImagePickerControllerEditedImage];
        NSData* data = UIImageJPEGRepresentation(selImg, 1.0f);
        
        QQApiImageObject* img = [QQApiImageObject objectWithData:data previewImageData:data title:@"图片消息标题" description:@"这是用户自选的图片哦！！！"];
        QQApiMessage* msg = [QQApiMessage messageWithObject:img];
        
        [QQApi sendMessage:msg];
    }
    
    [picker dismissModalViewControllerAnimated:YES];
}

@end


@implementation QQDemoViewController (TestMethods)

- (BOOL)checkQQ
{
    if(![QQApi isQQInstalled])
    {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"warning" message:@"QQ is not installed" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
        [alertView release];
        return NO;
    }
    
    if(![QQApi isQQSupportApi])
    {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"warning" message:@"Open API is not supported by current QQ" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
        [alertView release];
        return NO;
    }
    
    return YES;
}

- (void) sendTextMessage
{
    if(![self checkQQ]) return;
    
    QQApiTextObject* txt = [QQApiTextObject objectWithText:@"过去两年移动互联网有很多开放平台非常成功。事实上到现在来看，发展到现在一年多，最关键的开放平台是能不能真正从用户和经济回报中打造生态链。"];
    
    QQApiMessage* msg = [QQApiMessage messageWithObject:txt];
    
    [QQApi sendMessage:msg];
}

- (void) sendImageMessage
{
    if(![self checkQQ]) return;
    
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"img.jpg"];
    NSData* data = [NSData dataWithContentsOfFile:path];
	
    QQApiImageObject* img = [QQApiImageObject objectWithData:data previewImageData:data title:@"test title" description:@"desc"];
    QQApiMessage* msg = [QQApiMessage messageWithObject:img];
    
    [QQApi sendMessage:msg];
}

- (void) sendNewsMessage
{
    if(![self checkQQ]) return;
    
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"demo.jpg"];
    NSData* data = [NSData dataWithContentsOfFile:path];
    
	NSURL* url = [NSURL URLWithString:@"http://info.3g.qq.com/g/s?aid=auto_ss&id=auto_20120727000031&pos=F3G_09hwxc#"];
	
    QQApiNewsObject* img = [QQApiNewsObject objectWithURL:url title:@"新一代马自达6发布" description:@"目前国内在售的马自达6为第一代车型，其第二代车型在国内被称作睿翼。日前官方又再次发布了全新第三代马自达6的几张外观图片，新车的神秘面纱总算揭开。据悉，全新马自达6将在今年8月底的莫斯科车展上正式全球首发，随后还会在9月下旬的巴黎车展上亮相，并于明年初正式上市。" previewImageData:data];
    
    QQApiMessage* msg = [QQApiMessage messageWithObject:img];
    
    [QQApi sendMessage:msg];
}

- (void) sendAudioMessage
{
    if(![self checkQQ]) return;
    
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"audio.jpg"];
    NSData* data = [NSData dataWithContentsOfFile:path];
    
//    NSString* urlStr = @"http://y.qq.com/i/song.html#p=7B22736F6E675F4E616D65223A22E4BDA0E4B88DE698AFE79C9FE6ADA3E79A84E5BFABE4B990222C22736F6E675F5761704C69766555524C223A22687474703A2F2F74736D7573696332342E74632E71712E636F6D2F586B303051563558484A645574315070536F4B7458796931667443755A68646C2F316F5A4465637734356375386355672B474B304964794E6A3770633447524A574C48795333383D2F3634363232332E6D34613F7569643D32333230303738313038266469723D423226663D312663743D3026636869643D222C22736F6E675F5769666955524C223A22687474703A2F2F73747265616D31382E71716D757369632E71712E636F6D2F33303634363232332E6D7033222C226E657454797065223A2277696669222C22736F6E675F416C62756D223A22E5889BE980A0EFBC9AE5B08FE5B7A8E89B8B444E414C495645EFBC81E6BC94E594B1E4BC9AE5889BE7BAAAE5BD95E99FB3222C22736F6E675F4944223A3634363232332C22736F6E675F54797065223A312C22736F6E675F53696E676572223A22E4BA94E69C88E5A4A9222C22736F6E675F576170446F776E4C6F616455524C223A22687474703A2F2F74736D757369633132382E74632E71712E636F6D2F586C464E4D31354C5569396961495674593739786D436534456B5275696879366A702F674B65356E4D6E684178494C73484D6C6A307849634A454B394568572F4E3978464B316368316F37636848323568413D3D2F33303634363232332E6D70333F7569643D32333230303738313038266469723D423226663D302663743D3026636869643D2673747265616D5F706F733D38227D";
    NSString* urlStr = @"http://wfmusic.3g.qq.com/s?g_f=0&fr=&aid=mu_detail&id=2511915";
    
    int urllen = 776;
    if(urlStr.length < urllen){
        urllen = urlStr.length;
    }
    NSLog(@"url length is:%d",urllen);
    urlStr = [urlStr substringToIndex:urllen];
	NSURL* url = [NSURL URLWithString:urlStr];
                       
    
    QQApiAudioObject* img = [QQApiAudioObject objectWithURL:url title:@"Wish You Were Here" description:@"Avril Lavigne" previewImageData:data];
    
    QQApiMessage* msg = [QQApiMessage messageWithObject:img];
    
    [QQApi sendMessage:msg];
}

- (void) sendVideoMessage
{
    if(![self checkQQ]) return;
    
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"video.jpg"];
    NSData* data = [NSData dataWithContentsOfFile:path];
    
	NSURL* url = [NSURL URLWithString:@"http://v.youku.com/v_show/id_XNDI0NjA1MTA4.html"];
	
    QQApiVideoObject* img = [QQApiVideoObject objectWithURL:url title:@"王者之剑" description:@"在地球蛮荒时期，一切以武力来解决争斗。远古大陆上，两支兵强马壮的部落军队正在进行厮杀，而其中有一位勇敢的战士率领自己的部落获得了战争的胜利，他就是蛮王柯南（杰森·莫玛饰）。得胜归来的柯南受到了部落的爱戴，他诛杀可怕的怪物，为部落开拓疆土，但一场阴谋正在谋划当中……超自然的邪恶势力正意图侵蚀柯南的部落，它控制部落里的心腹，整个部落惨遭屠杀，连柯南的父亲科灵（朗·普尔曼饰）也未能幸免。意外活下来的柯南，将穿越西伯利亚冰原寻找盟友的帮助，他身负血海深仇，将用最原始、最野蛮的方式，为自己的父亲和同族报仇……" previewImageData:data];
    
    QQApiMessage* msg = [QQApiMessage messageWithObject:img];
    
    [QQApi sendMessage:msg];
}

- (void)doEditText
{
    QQTextViewController* vc = [[[QQTextViewController alloc] init] autorelease];
    vc.delegate = self;
    UINavigationController *nc = [[[UINavigationController alloc] initWithRootViewController:vc] autorelease];
    [self presentModalViewController:nc animated:YES];
}

- (void)doSelImage
{
    UIImagePickerController* picker = [[[UIImagePickerController alloc] init] autorelease];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
    }
    picker.delegate = self;
    picker.allowsEditing = YES;
    [self presentModalViewController:picker animated:YES];
}

- (void)showTestContent
{
    NSMutableString* str = [NSMutableString stringWithString:@""];
    
    NSArray* array = [QQApi getAdItemArray];
    if(array)
    {
        [str appendFormat:@"count:%d ---\n", (int)[array count]];
        for(int i = 0; i < (int)[array count]; i++)
        {
            QQApiAdItem* item = [array objectAtIndex:i];
            if(item)
            {
                [str appendFormat:@"item: %d\n{\n", i];
                
                [str appendFormat:@"title: %@\n", item.title];
                [str appendFormat:@"description: %@\n", item.description];
                [str appendFormat:@"imageData size: %d\n", item.imageData ? (int)[item.imageData length] : 0];
                [str appendFormat:@"target: %@\n", item.target];
                
                [str appendFormat:@"}\n"];
            }
        }
    }
    
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"content" message:str delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alertView show];
    [alertView release];
}

- (void)moreButtonClickHanlder:(id)sender
{
    UIViewController *moreVC = [[[ShareSDKDemoMoreViewController alloc] init] autorelease];
    moreVC.title = @"更多";
    UINavigationController *navMoreVC = [[[UINavigationController alloc] initWithRootViewController:moreVC] autorelease];
    [self presentModalViewController:navMoreVC animated:YES];
}

@end


