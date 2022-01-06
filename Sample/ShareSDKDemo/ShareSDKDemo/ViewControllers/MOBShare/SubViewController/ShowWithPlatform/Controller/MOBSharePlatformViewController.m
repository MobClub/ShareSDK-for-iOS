//
//  MOBSharePlatformViewController.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/13.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBSharePlatformViewController.h"
#import "MOBSharePlatformTableViewCell.h"
#import "MOBSharePlatformSubViewController.h"
#import "MOBPlatformDataSource.h"
#import "MOBShareTableViewHeaderFooterView.h"

@interface MOBSharePlatformViewController ()<SSDKCommonTableViewProtocol>

@property (nonatomic, strong) NSArray <NSArray<MOBPlatformBaseModel *> *>*dataSource;

@property (nonatomic, strong) MOBShareTableViewHeaderFooterView *headerView;

@end

@implementation MOBSharePlatformViewController

@synthesize  tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [MOBPlatformDataSource dataSource].shareWithPlatformsData;
    self.tableView.backgroundColor = UIColorHexString(@"F7F8F9");
    // Do any additional setup after loading the view.
}

- (void)commonTableViewModel:(SSDKCommonTableViewModel *)model{
    model.style = UITableViewStyleGrouped;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MOBSharePlatformTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MOBSharePlatformTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
    }
    NSArray *data = self.dataSource[indexPath.section];
    cell.model = data[indexPath.row];
    cell.line.hidden = data.count == indexPath.row + 1;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 53;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MOBSharePlatformSubViewController *vc = [MOBSharePlatformSubViewController new];
    
    MOBPlatformBaseModel *model = self.dataSource[indexPath.section][indexPath.row];
    vc.title = model.itemUI.name;
    vc.dataSource = model.platformTyps;
    [self.navigationController pushViewController:vc animated:YES];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    MOBShareTableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    if (!view) {
        view = [[MOBShareTableViewHeaderFooterView alloc] initWithReuseIdentifier:@"header"];
    }
    view.type = [self.dataSource[section] firstObject].type;
    view.hidden = self.dataSource[section].count == 0;
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"footer"];
    if (!view) {
        view = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"footer"];
        view.contentView.backgroundColor = UIColorHexString(@"F7F8F9");
    }
    view.hidden = self.dataSource[section].count == 0;
    return view;
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

@end
