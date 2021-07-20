//
//  MOBCustomeShareVC.m
//  ShareSDKDemo
//
//  Created by cl on 2021/5/24.
//  Copyright © 2021 mob. All rights reserved.
//

#import "MOBCustomeShareVC.h"
#import "MOBCustomeShareCell.h"
#import "MOBCustomShareModel.h"
#import "SSDKCategory.h"

@interface MOBCustomeShareVC ()<SSDKCommonTableViewProtocol,SSDKCommonNavigationProtocol,UITextFieldDelegate>
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UISwitch *sw;

@property (nonatomic, copy) NSString *textString;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *urlString;
@property (nonatomic, copy) NSString *titleString;
@property (nonatomic, copy) NSString *stickrString;
@property (nonatomic, copy) NSString *templateIdString;
@property (nonatomic, copy) NSString *facebookShareType;

@property (nonatomic, copy) void (^ shareHandler) (SSDKResponseState state, NSDictionary *userData, SSDKContentEntity* contentEntity,  NSError *error);

@end

@implementation MOBCustomeShareVC
@synthesize tableView = _tableView, navigationBar = _navigationBar;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customView];
}

- (void)customView{
    NSString *plistPath = [self getMapPlistPath];
    NSArray *mapping = [[NSArray alloc] initWithContentsOfFile:plistPath];
    self.dataSource = [NSArray yy_modelArrayWithClass:[MOBCustomShareModel class] json:mapping];
    self.shareHandler = ^(SSDKResponseState state, NSDictionary * _Nonnull userData, SSDKContentEntity * _Nonnull contentEntity, NSError * _Nonnull error) {
        NSLog(@"分享结果回调: %@", userData);
    };
    
    self.tableView.backgroundColor = UIColorHexString(@"F7F8F9");
    self.tableView.tableHeaderView = self.headerView;

    self.navigationBar.middleButton
    .makeChain
    .text(@"自定义参数分享", UIControlStateNormal)
    .textColor(UIColorHexString(@"464646"), UIControlStateNormal)
    .font(Font(PingFangSemibold, 17));
    
    self.navigationBar.leftButton.makeChain
    .image(UIImageNamed(@"nav_icon_back"), UIControlStateNormal)
    .textColor(UIColorHexString(@"464646"), UIControlStateNormal);
    
    self.navigationBar.rightButton.makeChain
    .text(@"分享", UIControlStateNormal)
    .font(Font(PingFangSemibold, 15))
    .textColor(UIColorHexString(@"464646"), UIControlStateNormal);

}

- (void)leftButtonTap:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightButtonTap:(UIButton *)button{
    NSLog(@"--%@--%@--%@",self.textString,self.imageUrl,self.urlString);
    if(self.textString.length == 0 && self.imageUrl.length == 0 && self.urlString.length == 0 && self.title.length == 0 && self.stickrString.length == 0 && self.templateIdString.length == 0){
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:@"请至少输入一个参数" preferredStyle:UIAlertControllerStyleAlert];
        [ac addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:ac animated:YES completion:nil];
        return;
    }
    SSDKContentType type = SSDKContentTypeText;
    if(self.imageUrl.length){
        type = SSDKContentTypeImage;
    }else if(self.urlString.length){
        if([self.urlString containsString:@".mp4"]){
            type = SSDKContentTypeVideo;
        }else{
            type = SSDKContentTypeWebPage;
        }
    }
    //sina不管分享什么都需要image,特殊处理
    if(self.platformType == SSDKPlatformTypeSinaWeibo && self.imageUrl.length && self.urlString.length){
        if([self.urlString containsString:@".mp4"]){
            type = SSDKContentTypeVideo;
        }else{
            type = SSDKContentTypeWebPage;
        }
    }
    
    NSArray *imgsArray = [self.imageUrl componentsSeparatedByString:@","];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:self.textString.length ? self.textString : nil
                                    images:imgsArray.count ? imgsArray : nil
                                       url:self.urlString.length ? [NSURL URLWithString:self.urlString] : nil
                                     title:self.titleString.length ? self.titleString : nil
                                      type:type];
    if(self.stickrString.length){
        [parameters SSDKSetupSnapChatParamsByCaption:self.titleString.length ? self.titleString : nil
                                      attachmentUrl:nil
                                              image:imgsArray.count ? imgsArray : nil
                                              video:nil
                                           sticker:self.stickrString
                                   stickerAnimated:NO
                                   stickerRotation:0
                                    cameraViewState:0
                                               type:SSDKContentTypeImage];
    }
    if(self.templateIdString.length){
        [parameters SSDKSetupKaKaoTalkParamsByUrl:self.urlString.length ? [NSURL URLWithString:self.urlString] : nil templateId:self.templateIdString.length ? self.templateIdString : nil templateArgs:nil];
    }
    
    //facebook特殊处理
    if(self.platformType == SSDKPlatformTypeFacebook){
        SSDKFacebookShareType fbType = SSDKFacebookShareTypeNative;
        if(self.facebookShareType.length){
            fbType = [self.facebookShareType intValue];
        }
        [parameters SSDKSetupFacebookParamsByText:self.textString image:imgsArray.count ? imgsArray : nil url:self.urlString.length ? [NSURL URLWithString:self.urlString] : nil urlTitle: nil urlName:nil attachementUrl:nil hashtag:self.textString.length ? self.textString : nil quote:self.titleString.length ? self.titleString : nil shareType:fbType  type:type];
    }

    
    [parameters SSDKSetupKakaoStoryParamsByContent:self.textString.length ? self.textString : nil
                                             title:self.titleString.length ? self.titleString : nil
                                            images:imgsArray.count ? imgsArray : nil
                                               url:self.urlString.length ? [NSURL URLWithString:self.urlString] : nil
                                        permission:1
                                          sharable:YES
                                  androidExecParam:nil
                                      iosExecParam:nil
                                              type:type];
     
    [self shareWithParameters:parameters];
}

- (void)shareWithParameters:(NSMutableDictionary *)parameters{
    [parameters SSDKSetShareFlags:@[NSStringFromClass([self class])]];
    [self sharePlatform:parameters];
}

- (void)sharePlatform:(NSMutableDictionary *)parameters{
    //常规分享调用这个方法
    if(self.sw.on){
        [ShareSDK shareByActivityViewController:self.platformType parameters:parameters.mutableCopy onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            [[MOBShareExample defaultExample] sharePlatType:self.platformType userData:userData state:state error:error];
            if (self.shareHandler) {
                self.shareHandler(state, userData, contentEntity, error);
            }
        }];
    }else{
        [ShareSDK share:self.platformType
             parameters:parameters.mutableCopy
         onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            [[MOBShareExample defaultExample] sharePlatType:self.platformType userData:userData state:state error:error];
            if (self.shareHandler) {
                self.shareHandler(state, userData, contentEntity, error);
            }
        }];
    }
}

#pragma mark - tableview datasource/delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MOBCustomeShareCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MOBCustomeShareCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
    }
    cell.model = self.dataSource[indexPath.row];
    [cell.textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    for(MOBCustomeShareCell *cell in _tableView.visibleCells){
        [cell.textField resignFirstResponder];
    }
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidChange:(UITextField *)textField {
    switch (textField.tag) {
        case 0:
            self.textString = textField.text;
            break;
        case 1:
            self.imageUrl = textField.text;
            break;
        case 2:
            self.urlString = textField.text;
            break;
        case 3:
            self.titleString = textField.text;
            break;
        case 4:
            self.stickrString = textField.text;
            break;
        case 5:
            self.templateIdString = textField.text;
            break;
        case 6:
            self.facebookShareType = textField.text;
            break;
        default:
            break;
    }
}


- (NSString *)getMapPlistPath{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"customShare" ofType:@"plist"];
    return filePath;
}

- (UIView *)headerView{
    if(!_headerView){
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
        UILabel *label = [[UILabel alloc]init];
        label.text = @"是否是系统分享";
        label.font = [UIFont boldSystemFontOfSize:16];
        label.textColor = UIColorHexString(@"0B0B0B");
        [_headerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(10);
            make.left.mas_offset(15);
        }];
        
        UISwitch *sw = [[UISwitch alloc]init];
        _sw = sw;
        [_headerView addSubview:sw];
        [sw mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(5);
            make.left.equalTo(label.mas_right).mas_offset(20);
        }];
    }
    return _headerView;
}

@end
