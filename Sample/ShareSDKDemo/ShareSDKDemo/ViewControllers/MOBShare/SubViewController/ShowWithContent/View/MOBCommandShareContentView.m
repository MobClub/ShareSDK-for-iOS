//
//  MOBCommandShareContentView.m
//  ShareSDKDemo
//
//  Created by cl on 2020/7/31.
//  Copyright © 2020 mob. All rights reserved.
//

#import "MOBCommandShareContentView.h"
#import "MOBShareContentCollectionViewCell.h"
#import "MOBPlatformDataSource.h"
#import "MOBShareContentActionModel.h"
#import "MOBShareContentActionPlatformModel.h"
@interface MOBCommandShareContentView ()<UICollectionViewDelegate,UICollectionViewDataSource>{
    CGFloat _itemWidth;
    CGFloat _itemSpace;
    CGFloat _originSpace;
}
@property (strong, nonatomic) UIView *view;

@property (weak, nonatomic) MOBShareCommandAlertView *alert;

@property (strong, nonatomic) UITapGestureRecognizer *tap;

@property (strong, nonatomic) UICollectionView *collecView;

@property (copy, nonatomic) NSArray *platforms;

@end

@implementation MOBCommandShareContentView

+ (MOBCommandShareContentView *)sharedView{
    static MOBCommandShareContentView *app = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        app = [[MOBCommandShareContentView alloc]initWithFrame:CGRectZero];
    });
    return app;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.backgroundColor = [UIColor whiteColor];
    
    BOOL isIpad = [[UIDevice currentDevice] isPad];
    _itemWidth = 55 * (isIpad?1:(([UIScreen screenWidth] -30)/(375 - 30)));
    _originSpace = ([UIScreen screenWidth] - 30) / (isIpad?12:6.0) - _itemWidth;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collecView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300) collectionViewLayout:layout];
    self.collecView.backgroundColor = [UIColor clearColor];
    
    self.collecView.makeChain
    .addToSuperView(self)
    .contentInset(UIEdgeInsetsMake(20, 0, 0, 0))
    .registerCellClass([MOBShareContentCollectionViewCell class], @"cell")
    .delegate(self)
    .dataSource(self);
    [self reloadUI];
}

- (void)shadowTouchAction{
    CGPoint point = [self.tap locationInView:self];
    point = [self.layer convertPoint:point fromLayer:self.layer];
    if (![self.layer containsPoint:point]) {
        [self.alert removeFromSuperview];
        [self removeFromSuperview];
        [self.view removeFromSuperview];
    }
}


- (void)reloadUI{
    CGFloat oldSpace = _itemSpace;
    NSInteger lineCount = (([UIScreen width] - 30) + _originSpace) / (_itemWidth + _originSpace);
    _itemSpace = (([UIScreen width] - 30) - lineCount * _itemWidth) / (lineCount - 1);
    _itemSpace  = _itemSpace > 0?_itemSpace : 0;
    if (oldSpace != _itemSpace) {
        SSDKTansactionDisableActions(
          [self.collecView reloadData];
        )
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.platforms.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MOBShareContentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(MOBShareContentCollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    cell.model = self.platforms[indexPath.row];
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



- (NSArray *)platforms {
    MOBShareContentActionModel *actionModel = [MOBPlatformDataSource dataSource].shareWithContentData[0];
    MOBShareContentActionPlatformModel *platformModel = actionModel.platforms[0];
    
    return platformModel.dataSource;
}

- (void)showWithAlertView:(MOBShareCommandAlertView *)alert{
    self.alert = alert;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.view = view;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(shadowTouchAction)];
    self.tap = tap;
    [view addGestureRecognizer:tap];
    view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
    [[UIApplication sharedApplication].keyWindow addSubview:view];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_offset(0);
        make.height.mas_offset(0);
    }];
    [UIView animateWithDuration:2.0 animations:^{
        [[UIApplication sharedApplication].keyWindow layoutSubviews];
    } completion:^(BOOL finished) {
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.mas_offset(0);
            make.height.mas_offset(300);
        }];
    }];

}
@end
