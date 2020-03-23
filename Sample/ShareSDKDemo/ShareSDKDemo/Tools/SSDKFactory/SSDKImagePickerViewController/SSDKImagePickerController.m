//
//  SSDKImagePickerController.m
//  ShareSDKDemo
//
//  Created by PP on 2020/2/18.
//  Copyright © 2020 mob. All rights reserved.
//

#import "SSDKImagePickerController.h"
#import "SSDKImagePickerTableViewCell.h"
#import "SSDKImagePickerAlumViewController.h"
#import "SSDKImagePickerConfigure_custom.h"
#import "SSDKImagePickerIconFactory.h"
#import "SSDKImagePickerProtocol.h"
@interface SSDKImagePickerController ()<SSDKCommonNavigationProtocol,SSDKCommonTableViewProtocol,SSDKImagePickerAlbumProtocol>

@property (nonatomic, copy) NSArray <SSDKImagePickerModel *> *dataSource;

@property (nonatomic, copy) SSDKImagePickerComplete result;

@property (nonatomic, strong) SSDKImagePickerConfigure *configure;

@property (nonatomic, strong) SSDKImagePickerAuthorStatusView * authorStatusView;

@end

@implementation SSDKImagePickerController

@synthesize navigationBar = _navigationBar, tableView = _tableView;

- (instancetype)initWithConfigure:(SSDKImagePickerConfigure *)configure{
    if (self = [super init]) {
        _configure = configure;
        [self.configure setAlbumProtocolObject:self];
        [self.configure load];
        self.tableView.makeChain.registerCellClass([SSDKImagePickerTableViewCell class], @"cell");
    }
    return self;
}

- (instancetype)initWithConfigureBlock:(void (^)(SSDKImagePickerConfigure * _Nonnull))block{
    SSDKImagePickerConfigure *configure = [SSDKImagePickerConfigure defaultConfigure];
    if (block) {
        block(_configure);
    }
    
    return [self initWithConfigure:configure];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.middleButton.makeChain.text(self.title?:@"照片", UIControlStateNormal);
    self.navigationBar.leftButton.makeChain.text(@"取消", UIControlStateNormal);
    
    // Do any additional setup after loading the view.
}

- (SSDKImagePickerConfigure *)configure{
    if (!_configure) {
        _configure = [SSDKImagePickerConfigure defaultConfigure];
    }
    return _configure;
}

- (void)updateDataSource:(NSArray<SSDKImagePickerModel *> *)dataSource detail:(SSDKImagePickerChangeInfo *)details{
    SSDKImagePickerAlumViewController* vc = [self.navigationController.viewControllers lastObject];
    
    if ([vc isKindOfClass:[SSDKImagePickerAlumViewController class]]) {
        if (self.configure.preferPickerModel) {
            vc.model = self.configure.preferPickerModel;
        }
        if (dataSource == nil) {
            vc.model = nil;
        }
        
    }
    self.authorStatusView.hidden = dataSource != nil;
    if (dataSource == nil) return;
    self.dataSource = dataSource;
    if (details) {
        if ([details.removeIndexes count]) {
            [self.tableView deleteRowsAtIndexPaths:details.removeIndexes withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        if ([details.insertIndexs count]) {
            [self.tableView insertRowsAtIndexPaths:details.insertIndexs withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        
        if ([details.changeIndexes count]) {
            [self.tableView reloadRowsAtIndexPaths:details.changeIndexes withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }else{
        [self.tableView reloadData];
    }
}

- (SSDKImagePickerAuthorStatusView *)authorStatusView{
    if (!_authorStatusView) {
        _authorStatusView = [SSDKImagePickerAuthorStatusView new];
        _authorStatusView.hidden = YES;
        [self.view addSubview:_authorStatusView];
        [_authorStatusView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(self.tableView);
        }];
    }
    return _authorStatusView;
}

- (void)leftButtonTap:(UIButton *)button{
    if (_result) {
        _result(SSDKImagePickerCompleteStatusCancel,nil);
        _result = nil;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)completeWithResult:(SSDKImagePickerComplete)result{
    _result = result;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SSDKImagePickerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.model = self.dataSource[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.dataSource[indexPath.row].count == 0 ?0.01:120;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SSDKImagePickerAlumViewController *vc = [SSDKImagePickerAlumViewController new];
    vc.model = self.dataSource[indexPath.row];
    vc.complete = _result;
    [self.navigationController pushViewController:vc animated:YES];
}

+ (UINavigationController *)initWithNavgationControllerConfigureBlock:(void (^)(SSDKImagePickerConfigure * _Nonnull))block result:(SSDKImagePickerComplete)result{
    SSDKImagePickerConfigure *configure = [SSDKImagePickerConfigure defaultConfigure];
    if (block) {
        block(configure);
    }
    return [self initWithConfigure:configure result:result];
}

+ (UINavigationController *)initWithConfigure:(SSDKImagePickerConfigure *)configure result:(SSDKImagePickerComplete)result{
    SSDKImagePickerController * picker = [[SSDKImagePickerController alloc] initWithConfigure:configure];
    [picker completeWithResult:result];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:picker];
    nav.navigationBarHidden = YES;
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    if (configure.openSmartAlbumUserLibrary) {
        SSDKImagePickerAlumViewController *vc = [SSDKImagePickerAlumViewController new];
        vc.complete = result;
        [nav setViewControllers:@[picker,vc]];
    }
    nav.interactivePopGestureRecognizer.delegate = (id <UIGestureRecognizerDelegate>) nav;
    return nav;
}

@end
