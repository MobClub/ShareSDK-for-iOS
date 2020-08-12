//
//  ViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/6.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "ViewController.h"
#import "MOBShareMainHeaderView.h"
#import "MOBMainShareNormalTableViewCell.h"
#import "MOBMainShareUniqueTableViewCell.h"
#import "MOBShareContentViewController.h"
#import "MOBSharePlatformViewController.h"
#import "MOBShareExample.h"
#import "MOBPolicyManager.h"
@interface MOBMainTableHeaderFooterView : UITableViewHeaderFooterView
@end

@implementation MOBMainTableHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

@end

@interface ViewController ()<SSDKCommonTableViewProtocol,SSDKCommonNavigationProtocol>{
    UIView *_tableViewBackgroundShadow;
}

@property (nonatomic, strong) MOBShareMainHeaderView *headerView;

@property (nonatomic, copy) NSArray *dataSource;

@end

@implementation ViewController

@synthesize tableView = _tableView, navigationBar = _navigationBar;


- (void)viewDidLoad{
    [super viewDidLoad];
    [self createData];
    [self setupUI];
}

//点击跳转
- (void)createData{
    SSDKWEAK
    self.dataSource = [MobSharePlatformStyleModel shareDisplayDataSourceHandle:^(MobSharePlatformStyleModel * _Nonnull model) {
        switch (model.platStyle) {
            //跳转到"按内容分享页面"
            case MobSharePlatformStyleContent:
            {
                MOBShareContentViewController *vc = [MOBShareContentViewController new];
                vc.title = model.name;
                
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }
                break;
            //跳转到"按平台分享页面"
            case MobSharePlatformStylePlatform:{
                
                MOBSharePlatformViewController *vc = [MOBSharePlatformViewController new];
                vc.title = model.name;
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }
                break;
            //弹出分享菜单
            case MobSharePlatformStylePopShare:{
                [[MOBShareExample defaultExample] popShareWithView: model.view];
            }
                break;
            //截图分享
            case MobSharePlatformStyleShotShare:{
                [[MOBShareExample defaultExample] shotShare];
            }
                break;
            //摇一摇分享
            case MobSharePlatformStyleShakeShare:{
                [[MOBShareExample defaultExample] shakeShare];
            }
                break;
            //新浪LinkCard分享
            case MobSharePlatformStyleLinkCardShare:{
                [[MOBShareExample defaultExample] sinaLinkCardShare];
            }
                break;
            //口令分享
            case MobSharePlatformStyleCommandShare:{
                [[MOBShareExample defaultExample] commandShareWithModelView:model.view];
            }
                break;
            default:
                break;
        }
    }];
}

- (void)setupUI{
    self.navigationBar.middleButton
    .makeChain
    .text(@"分享", UIControlStateNormal)
    .textColor(UIColorHexString(@"464646"), UIControlStateNormal)
    .font(Font(PingFangSemibold, 17));
    
    self.tableView.makeChain
    .registerCellClass([MOBMainShareNormalTableViewCell class], @"normalCell")
    .registerCellClass([MOBMainShareUniqueTableViewCell class], @"uniqueCell")
    .registerViewClass([MOBMainTableHeaderFooterView class], @"headerView")
    .backgroundColor(UIColorHexString(@"F7F8F9"))
    .tableHeaderView(self.headerView);
    self.navigationBar.line.hidden = YES;
    
    _tableViewBackgroundShadow = [UIView new];
    _tableViewBackgroundShadow.backgroundColor = [UIColor whiteColor];
    [self.tableView insertSubview:_tableViewBackgroundShadow atIndex:0];
    
    self.navigationBar.leftButton.makeChain
    .text(@"     ", UIControlStateNormal)
    .numberOfLines(2)
    .textColor(UIColor.whiteColor, UIControlStateNormal)
    .adjustsFontSizeToFitWidth(YES);
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    if (self.headerView.text.length == 0) {
        self.headerView.text = @"好消息：闭环分享重磅上线！一键实现闭环分享！错过它，就错过了全世界~  ";
    }
    _tableViewBackgroundShadow.frame = CGRectMake(0, 0, self.view.width, 0);
}

- (MOBShareMainHeaderView *)headerView{
    if (!_headerView) {
        _headerView  =[[MOBShareMainHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 36)];
        _headerView.rollClick = ^{
            [[MOBShareExample defaultExample] shareLink];
        };
    }
    return _headerView;
}

#pragma mark - tableView Delegate/dataSource -


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    id data = self.dataSource[indexPath.section];
    UITableViewCell *cell = nil;
    if ([data isKindOfClass:[MobSharePlatformStyleGroupModel class]]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"normalCell" forIndexPath:indexPath];
        [(MOBMainShareNormalTableViewCell *)cell setData:data];
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:@"uniqueCell" forIndexPath:indexPath];
         [(MOBMainShareUniqueTableViewCell *)cell setData:data];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MobSharePlatformStyleBaseModel *model = self.dataSource[indexPath.section];
    return model.height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerView"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y > 0) return;
    _tableViewBackgroundShadow.height = - scrollView.contentOffset.y;
    _tableViewBackgroundShadow.y = scrollView.contentOffset.y;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [super touchesBegan:touches withEvent:event];
}

- (void)leftButtonTap:(UIButton *)button{
    [[MOBPolicyManager defaultManager] clearCache];
}

@end

