//
//  MOBShareContentHeaderView.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/13.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBShareContentHeaderView.h"
#import "MOBBaseCollectionViewCell.h"


@interface MOBShareContentHeaderCell : MOBBaseCollectionViewCell{
    NSArray *_granColor;
    NSArray *_selectedGranColor;
}

@property (nonatomic, strong) MOBShareContentActionModel *model;


@property (nonatomic, strong) UIImageView *imageV;


@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation MOBShareContentHeaderCell

- (void)setup{
    self.backgroundColor = [UIColor whiteColor];
    @autoreleasepool {
       
        
        CAGradientLayerModelCreate()
        .colors(@[(__bridge id)SSDKRGBAlpha(251,144,34,1).CGColor, (__bridge id) SSDKRGB(255, 201, 123).CGColor])
        .locations(@[@0,@1])
        .bounds(CGRectMake(0, 0, 80, 100))
        .startPoint(CGPointMake(1, 1))
        .endPoint(CGPointMake(0, 0))
        .addToSuperLayer(self.contentView.layer)
        .cornerRadius(5)
        .shadow(CGSizeMake(0,4), 4, SSDKRGBAlpha(233, 233, 233, 0.5), 1)
        .assignTo(^(__kindof CALayer * _Nonnull layer) {
            _gradientLayer = layer;
        });
        
        self.contentView.makeChain
        .cornerRadius(5)
        .clipsToBounds(NO)
        .masksToBounds(NO)
        .shadow(CGSizeMake(0,4), 4,SSDKRGBAlpha(233, 233, 233, 0.5), 1);
        
        UIImageViewModelCreate()
        .addToSuperView(self.contentView)
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _imageV = view;
        })
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.centerX.equalTo(self.contentView);
            make.top.mas_offset(20);
            make.width.height.mas_equalTo(40);
        });
        
        UILabelModelCreate()
        .addToSuperView(self.contentView)
        .numberOfLines(1)
        .adjustsFontSizeToFitWidth(YES)
        .textAlignment(NSTextAlignmentCenter)
        .font(Font(PingFangMedium, 12))
        .textColor(UIColorHexString(@"000000"))
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _label = view;
        })
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(self.imageV.mas_bottom).mas_offset(5);
            make.width.lessThanOrEqualTo(self.contentView.mas_width);
        });
        _granColor = @[(__bridge id)[UIColor whiteColor].CGColor, (__bridge id)[UIColor whiteColor].CGColor];
        _selectedGranColor = @[(__bridge id)SSDKRGBAlpha(251,144,34,1).CGColor, (__bridge id)SSDKRGBAlpha(255,201,123,1).CGColor];
    }
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    if (!CGRectEqualToRect(self.bounds, self.gradientLayer.frame) && !CGRectEqualToRect(self.bounds, CGRectZero)) {
        SSDKTansactionDisableActions(
            self.gradientLayer.frame = self.bounds;
        )
    }
}

- (void)setModel:(MOBShareContentActionModel *)model{
    _model = model;
    self.label.text = model.name;
}


- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (selected) {
        self.imageV.image = self.model.selectedImage;
        self.label.textColor = UIColorHexString(@"ffffff");
        self.gradientLayer.colors = _selectedGranColor;
    }else{
        self.imageV.image = self.model.image;
        self.label.textColor = UIColorHexString(@"000000");
        self.gradientLayer.colors = _granColor;
    }
}


@end





@interface MOBShareContentHeaderView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, assign) NSInteger selectedIndex;

@end


@implementation MOBShareContentHeaderView

- (void)setup{
    
    _selectedIndex = -1;
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(80, 100);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 5;
    
    UICollectionViewCreateWithLayout(layout).makeChain
    .addToSuperView(self)
    .delegate(self)
    .dataSource(self)
    .showsHorizontalScrollIndicator(NO)
    .contentInset(UIEdgeInsetsMake(15, 15, 15, 15))
    .backgroundColor(UIColorHexString(@"F7F8F9"))
    .registerCellClass([MOBShareContentHeaderCell class], @"cell")
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _collectionView = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.edges.mas_equalTo(0);
    });
    
    
}

- (void)setDataSource:(NSArray<MOBShareContentActionModel *> *)dataSource{
    _dataSource = dataSource;
    [self.collectionView reloadData];
    [self collectionView:self.collectionView didSelectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
}

#pragma mark - DataSource/Delegate -

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MOBShareContentHeaderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.model = self.dataSource[indexPath.item];
    cell.selected = indexPath.item == _selectedIndex;
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataSource.count == 0) return;
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:self.selectedIndex inSection:0]];
    cell.selected = NO;
    
    UICollectionViewCell *selCell = [collectionView cellForItemAtIndexPath:indexPath];
    selCell.selected = YES;
    if (_selectedIndex == indexPath.item)return;
    _selectedIndex = indexPath.item;
    if (self.currentSelectedHandler) {
        self.currentSelectedHandler(self.dataSource[indexPath.item]);
    }
}



@end
