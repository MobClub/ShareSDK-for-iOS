//
//  MOBAuthViewController.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/15.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBAuthViewController.h"
#import "MOBAuthItemTableViewCell.h"
#import "MOBPlatformDataSource.h"
#import "MOBShareTableViewHeaderFooterView.h"

@interface MOBAuthViewController ()<SSDKCommonTableViewProtocol,SSDKCommonNavigationProtocol>
{
    UIView *_tableViewBackgroundShadow;
}

@property (nonatomic, strong) NSArray <NSArray *>*dataSource;

@end

@implementation MOBAuthViewController

@synthesize navigationBar = _navigationBar, tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.middleButton
    .makeChain
    .text(@"第三方授权", UIControlStateNormal)
    .textColor(UIColorHexString(@"464646"), UIControlStateNormal)
    .font(Font(PingFangSemibold, 17));
    
    self.navigationBar.line.hidden = YES;
    
    self.dataSource = [MOBPlatformDataSource dataSource].authPlatform;
    
    self.tableView.backgroundColor = [UIColor ssdk_percentR:247 g:248 b:249 alpha:1];
    
    _tableViewBackgroundShadow = [UIView new];
    _tableViewBackgroundShadow.backgroundColor = [UIColor whiteColor];
    [self.tableView insertSubview:_tableViewBackgroundShadow atIndex:0];
    // Do any additional setup after loading the view.
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _tableViewBackgroundShadow.frame = CGRectMake(0, 0, self.view.width, 0);
}


- (void)commonTableViewModel:(SSDKCommonTableViewModel *)model{
    model.style = UITableViewStyleGrouped;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MOBAuthItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MOBAuthItemTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
    }
    cell.model = self.dataSource[indexPath.section][indexPath.row];
    cell.line.hidden = indexPath.row + 1 == self.dataSource[indexPath.section].count;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    MOBShareTableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    if (!view) {
        view = [[MOBShareTableViewHeaderFooterView alloc] initWithReuseIdentifier:@"header"];
    }
    MOBAuthItemModel *model = [self.dataSource[section] firstObject];
    view.type = model.model.type;
    view.hidden = self.dataSource[section].count == 0;
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"footer"];
    if (!view) {
        view = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"footer"];
        view.contentView.backgroundColor = [UIColor ssdk_percentR:247 g:248 b:249 alpha:1];
    }
    view.hidden = self.dataSource[section].count == 0;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MOBAuthItemModel *model = self.dataSource[indexPath.section][indexPath.row];
    if(model.model.platformType == SSDKPlatformTypeAppleAccount)
    {
        return 93;
    }

    return 53;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.dataSource[section].count == 0?0.01:50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return self.dataSource[section].count == 0?0.01:10;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y > 0) return;
    _tableViewBackgroundShadow.height = - scrollView.contentOffset.y;
    _tableViewBackgroundShadow.y = scrollView.contentOffset.y;
}

@end
