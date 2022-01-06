//
//  MOBShareContentViewController.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/13.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBShareContentViewController.h"
#import "MOBShareContentHeaderView.h"
#import "MOBShareContentCollectionHeaderReusableView.h"
#import "MOBPlatformDataSource.h"
#import "MOBShareTableViewHeaderFooterView.h"
#import "MOBShareContentCollectionViewCell.h"
#import "MOBShareContentCollectionFooterReusableView.h"

@interface MOBShareContentViewController ()<SSDKCommonCollectionViewProtocol>{
    CGFloat _itemWidth;
    CGFloat _itemSpace;
    CGFloat _originSpace;
}

@property (nonatomic, strong) MOBShareContentActionModel *model;

@property (nonatomic, strong) MOBShareContentHeaderView *headerView;

@end

@implementation MOBShareContentViewController

@synthesize collectionView = _collectionView;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    BOOL isIpad = [[UIDevice currentDevice] isPad];
    _itemWidth = 55 * (isIpad?1:(([UIScreen screenWidth] -30)/(375 - 30)));
    _originSpace = ([UIScreen screenWidth] - 30) / (isIpad?12:6.0) - _itemWidth;
    self.collectionView.makeChain
    .contentInset(UIEdgeInsetsMake(130, 0, 0, 0))
    .registerCellClass([MOBShareContentCollectionViewCell class], @"cell")
    .addSubView(self.headerView)
    .registerViewClass([MOBShareContentCollectionHeaderReusableView class], @"header", UICollectionElementKindSectionHeader)
    .registerViewClass([MOBShareContentCollectionFooterReusableView class], @"footer", UICollectionElementKindSectionFooter);
    
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.collectionView);
        make.top.mas_offset(-130);
        make.width.equalTo(self.collectionView);
        make.height.mas_equalTo(130);
    }];
    dispatch_async(dispatch_get_main_queue(), ^{
        _headerView.dataSource = [MOBPlatformDataSource dataSource].shareWithContentData;
    });
    // Do any additional setup after loading the view.
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self reloadUI];
    
    
}


- (void)commonCollectionModel:(SSDKCommonCollectionViewModel *)model{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);
    model.layout = layout;
}

- (void)reloadUI{
    CGFloat oldSpace = _itemSpace;
    NSInteger lineCount = (([UIScreen width] - 30) + _originSpace) / (_itemWidth + _originSpace);
    _itemSpace = (([UIScreen width] - 30) - lineCount * _itemWidth) / (lineCount - 1);
    _itemSpace  = _itemSpace > 0?_itemSpace : 0;
    if (oldSpace != _itemSpace) {
        SSDKTansactionDisableActions(
          [self.collectionView reloadData];
        )
    }
}
- (MOBShareContentHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[MOBShareContentHeaderView alloc] initWithFrame:CGRectMake(0, -130, 0, 130)];
        SSDKWEAK
        _headerView.currentSelectedHandler = ^(MOBShareContentActionModel * _Nonnull model) {
            weakSelf.model = model;
            [weakSelf.collectionView reloadData];
        };

    }
    return _headerView;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.model.platforms.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.model.platforms[section].dataSource.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MOBShareContentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(MOBShareContentCollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    cell.model = self.model.platforms[indexPath.section].dataSource[indexPath.row];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return _itemSpace;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(_itemWidth, _itemWidth + 30);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *view;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        [(MOBShareContentCollectionHeaderReusableView *)view setType:self.model.platforms[indexPath.section].type];
    }else{
        view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footer" forIndexPath:indexPath];
    }
    return view;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake([UIScreen width], 50);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake([UIScreen width], 10);
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
