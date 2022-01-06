//
//  SSDKImagePickerAlumViewController.m
//  ShareSDKDemo
//
//  Created by PP on 2020/2/19.
//  Copyright © 2020 mob. All rights reserved.
//

#import "SSDKImagePickerAlumViewController.h"
#import "SSDKImagePickerElementCell.h"
#import "SSDKImagePickerConfigure_custom.h"
#import "SSDKImagePickerConfigure_Private.h"
#import "SSDKImagePickerIconFactory.h"
#import "SSDKImagePickerProtocol.h"
@interface SSDKImagePickerAblumBlankView : UIView

@end

@implementation SSDKImagePickerAblumBlankView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    UILabelModelCreate()
    .addToSuperView(self)
    .text(@"此相册的数据被删除了哦~~~~~~~~\n快去其他相册看看吧")
    .textAlignment(NSTextAlignmentCenter)
    .font(Font(PingFangReguler, 17))
    .textColor(UIColor.darkGrayColor)
    .numberOfLines(0)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.center.equalTo(self);
        make.width.mas_equalTo(300);
    });
}

@end

@interface SSDKImagePickerAlumViewFooterView : UIView <SSDKImagePickerOperationProtocol>

@property (nonatomic, strong) UIButton *previewButton;

@property (nonatomic, strong) UIButton *orignButton;

@property (nonatomic, strong) UIButton *sendButton;

@property (nonatomic, strong) UIView *line;

@property (nonatomic, copy) void (^ selectedIndex)(NSInteger index);

@property (nonatomic, assign) NSUInteger configureId;

@property (nonatomic, strong) UILabel *videoCountLbael;

@property (nonatomic, strong) UILabel *imageCountLbael;

@property (nonatomic, strong) UILabel *totolCountLabel;

@end

@implementation SSDKImagePickerAlumViewFooterView

- (instancetype)initWithWithConfigure:(NSUInteger)configureId
{
    self = [super init];
    if (self) {
        _configureId = configureId;
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.backgroundColor = [UIColor whiteColor];
    UIViewModelCreate()
    .addToSuperView(self)
    .backgroundColor(UIColorHexString(@"dbdbdb"))
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    });
    
    UIButtonModelCreate()
    .multiple(3)
    .assignToObjects(^(NSArray * _Nonnull objs) {
        _previewButton = objs[0];
        _orignButton = objs[1];
        _sendButton = objs[2];
    })
    .addToSuperView(self)
    .font(Font(PingFangReguler, 16))
    .addTarget(self, @selector(buttonClick:), UIControlEventTouchUpInside)
    .textColor(UIColor.darkGrayColor, UIControlStateNormal)
    .part_first()
    .text(@"预览", UIControlStateNormal)
    .makeTag(100)
    .hidden(YES)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.mas_offset(20);
        make.centerY.equalTo(self);
    })
    .part_sencond()
    .makeTag(101)
    .text(@"原图", UIControlStateNormal)
    .hidden(YES)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(self.previewButton.mas_right).mas_offset(10);
        make.centerY.equalTo(self);
    })
    .part_third()
    .makeTag(102)
    .text(@"发送", UIControlStateNormal)
    .textColor(UIColorHexString(@"FF7800"), UIControlStateNormal)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.right.mas_offset(-40);
        make.centerY.equalTo(self);
    });
    
    SSDKImagePickerConfigure *configure = [SSDKImagePickerConfigure configureWithId:_configureId];
    BOOL both = configure.mediaType == SSDKImagePickerMediaTypeBoth;
    CGFloat height = both?20:30;
    UILabelModelCreate()
    .multiple(3)
    .numberOfLines(1)
    .backgroundColor([UIColor whiteColor])
    .font(Font(PingFangLight,both?10:11))
    .textColor(UIColor.darkTextColor)
    .addToSuperView(self)
    .assignToObjects(^(NSArray * _Nonnull objs) {
        _imageCountLbael = objs[0];
        _videoCountLbael = objs[1];
        _totolCountLabel = objs[2];
    })
    .part_first()
    .hidden(configure.mediaType==SSDKImagePickerMediaTypeVideo)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.top.mas_offset(1);
        make.left.mas_offset(20);
        make.height.mas_equalTo(height);
        make.right.mas_offset(-100);
    })
    .part_sencond()
    .hidden(configure.mediaType==SSDKImagePickerMediaTypeImage)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.top.mas_offset(both?20:0);
        make.left.mas_offset(20);
        make.height.mas_equalTo(height);
        make.right.mas_offset(-100);
    })
    .part_third()
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.top.mas_offset(both?40:30);
        make.left.mas_offset(20);
        make.height.mas_equalTo(height);
        make.right.mas_offset(-100);
    })
    .part_all()
    .hidden(YES);
    [self setText];
}


- (void)setText{
    
    SSDKImagePickerResult *result = [SSDKImagePickerConfigure configureWithId:_configureId].pickerResult;
    self.videoCountLbael.text = [NSString stringWithFormat:@"视频最少可选:%ld, 最多可选:%@ 当前已选:%lu",(long)[result minimumNumberOfSelectionType:SSDKImagePickerMediaTypeVideo],[result maximumNumberOfSelectionType:SSDKImagePickerMediaTypeVideo]==NSUIntegerMax?@"无限制":@([result maximumNumberOfSelectionType:SSDKImagePickerMediaTypeVideo]), (unsigned long)[result selectedElementsWithMediaType:SSDKImagePickerMediaTypeVideo].count];
    self.imageCountLbael.text = [NSString stringWithFormat:@"图片最少可选:%ld, 最多可选:%@ 当前已选:%lu", (long)[result minimumNumberOfSelectionType:SSDKImagePickerMediaTypeImage],[result maximumNumberOfSelectionType:SSDKImagePickerMediaTypeImage]==NSUIntegerMax?@"无限制":@([result maximumNumberOfSelectionType:SSDKImagePickerMediaTypeImage]), (unsigned long)[result selectedElementsWithMediaType:SSDKImagePickerMediaTypeVideo].count];
    self.totolCountLabel.text = [NSString stringWithFormat:@"全部最少可选:%ld, 最多可选:%@ 当前已选:%lu",(long)[result minimumNumberOfSelectionType:SSDKImagePickerMediaTypeBoth],[result maximumNumberOfSelectionType:SSDKImagePickerMediaTypeBoth]==NSUIntegerMax?@"无限制":@([result maximumNumberOfSelectionType:SSDKImagePickerMediaTypeBoth]), (unsigned long)[result selectedElementsWithMediaType:SSDKImagePickerMediaTypeBoth].count];
    if (result.selectedElements.count == 0) {
        [self.sendButton setTitle:@"分享" forState:UIControlStateNormal];
    }else{
        [self.sendButton setTitle:[NSString stringWithFormat:@"分享(%lu)", (unsigned long)result.selectedElements.count] forState:UIControlStateNormal];
    }
}

- (void)buttonClick:(UIButton *)button{
    if (self.selectedIndex) {
        self.selectedIndex(button.tag - 100);
    }
}

- (void)chooseElement:(PHAsset *)element
                  add:(BOOL)isAdd
           changeInfo:(SSDKImagePickerChangeInfo *)changeInfo{
    [self setText];
}

- (void)albumChooseDidChange:(SSDKImagePickerChangeInfo *)changeInfo{
    [self setText];
}

- (void)albumChooseNumberOfStatus:(SSDKImagePickerOperationChooseResultStatus)status mediaType:(SSDKImagePickerMediaType)mediaType continue:(BOOL *)stop{
    SSDKImagePickerResult *result = [SSDKImagePickerConfigure configureWithId:self.configureId].pickerResult;
    if (status == SSDKImagePickerOperationChooseResultStatusLarge) {
        NSString * message = @"";
        switch (mediaType) {
            case SSDKImagePickerMediaTypeImage:
                message = @"图片";
                break;
            case SSDKImagePickerMediaTypeVideo:
                message = @"视频";
                break;
            case SSDKImagePickerMediaTypeBoth:
                message = @"内容";
                break;
            default:
                break;
        }
        UIAlertControllerAlertCreate(nil, [NSString stringWithFormat:@"所选%@超出了设定范围，你已选%ld个,最多可选%ld个哦~~~",message,(long)[result countWithSelectionType:mediaType],(long)[result maximumNumberOfSelectionType:mediaType]])
        .addDefaultAction(@"OK")
        .presentAnimated();
    }
    [self.sendButton setTitleColor:[result chooseStatusWithMediaType:SSDKImagePickerMediaTypeBoth] == SSDKImagePickerOperationChooseResultStatusNormal || * stop?UIColorHexString(@"FF7800"):UIColor.grayColor forState:UIControlStateNormal];
}

@end

@interface SSDKImagePickerAlumViewController ()<SSDKCommonNavigationProtocol,SSDKCommonCollectionViewProtocol,SSDKImagePickerAssetsProtocol>

@property (nonatomic, strong) SSDKImagePickerConfigure *configure;
@property (nonatomic, copy) void (^ block) (void);
@property (nonatomic, strong) SSDKImagePickerAlumViewFooterView *footerView;
@property (nonatomic, strong) SSDKImagePickerAblumBlankView *blankView;
@property (nonatomic, strong) SSDKImagePickerAuthorStatusView * authorStatusView;

@end
@implementation SSDKImagePickerAlumViewController
@synthesize navigationBar = _navigationBar, collectionView = _collectionView;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.collectionView.makeChain
        .registerCellClass([SSDKImagePickerElementCell class], @"cell");
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.configure resetCachedAssets];
    self.navigationBar.leftButton.makeChain
    .image(UIImageNamed(@"s_nav_icon_back"), UIControlStateNormal)
    .text(@"照片", UIControlStateNormal)
    .font(Font(SystemFont, 16));
    
    self.navigationBar.rightButton.makeChain.text(@"完成", UIControlStateNormal);
    [self.navigationBar.leftButton imageDirection:SSDKButtonImageDirectionLeft space:8];
    [self scrollTopBottom];
}

- (void)scrollTopBottom{
    if (self.model.needMoveBottom) {
        if (self.collectionView.contentOffset.y <= 0) {
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.model.count - 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionBottom animated:NO];
        }
    }
}

- (void)viewSafeAreaInsetsChanged:(UIEdgeInsets)edges{
    
    [self.footerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(edges.left);
        make.right.mas_offset(-edges.right);
        make.bottom.mas_offset(-edges.bottom);
        make.height.mas_equalTo(60);
    }];
    [self.collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.navigationBar.mas_bottom);
        make.left.mas_offset(edges.left);
        make.right.mas_offset(-edges.right);
        make.bottom.equalTo(self.footerView.mas_top);
    }];
    [self.blankView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.navigationBar.mas_bottom);
        make.left.mas_offset(edges.left);
        make.right.mas_offset(-edges.right);
        make.bottom.equalTo(self.footerView.mas_top);
    }];
    
}

- (SSDKImagePickerAblumBlankView *)blankView{
    if (!_blankView) {
        _blankView = [SSDKImagePickerAblumBlankView new];
        _blankView.hidden = YES;
        [self.view addSubview:_blankView];
    }
    return _blankView;
}

- (void)viewSafeAreaInsetsDidChange{
    [super viewSafeAreaInsetsDidChange];
    [self scrollTopBottom];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.collectionView reloadData];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.configure updateCachedAssets];
}

- (UIViewController *)viewController{
    return self;
}

- (SSDKImagePickerModel *)sourceModel{
    return _model;
}


- (UICollectionView *)displayCollectionView {
    return self.collectionView;
}

- (CGSize)displayItemSize{
    return [self collectionView:_collectionView layout:_collectionView.collectionViewLayout sizeForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
}

- (void)setModel:(SSDKImagePickerModel *)model{
    __weak typeof(self)weakSelf = self;
    _model = model;
    self.configure = model.configure?:[SSDKImagePickerConfigure currentConfigure];
    self.authorStatusView.hidden = model != nil;
    self.footerView.hidden = model == nil;
    self.footerView.configureId = self.configure.configureId;
    [self.footerView setText];
    self.collectionView.allowsMultipleSelection = self.configure.operationConfigure.allowMultipleSelection;
    [self.configure setAssetsProtocolObject:self];
    self.navigationBar.middleButton.makeChain.text(self.model.title, UIControlStateNormal);
    [self.model addUpdateLoadBlock:^(SSDKImagePickerModel * _Nonnull model, SSDKImagePickerChangeInfo * _Nonnull details) {
        weakSelf.blankView.hidden = model.count != 0;
        [weakSelf.configure resetCachedAssets];
        if (details) {
            [weakSelf.collectionView performBatchUpdates:^{
                if ([details.removeIndexes count]) {
                    [weakSelf.collectionView deleteItemsAtIndexPaths:details.removeIndexes];
                }
                if ([details.insertIndexs count]) {
                    [weakSelf.collectionView insertItemsAtIndexPaths:details.insertIndexs];
                }
                if ([details.changeIndexes count]) {
                    [weakSelf.collectionView reloadItemsAtIndexPaths:details.changeIndexes];
                }
            } completion:nil];
        }else{
            [weakSelf.collectionView reloadData];
        }
    }];
    [self.configure setAssetsOperationObject:self.footerView];
    [self.configure resetCachedAssets];
    [self.collectionView reloadData];
    [self scrollTopBottom];
}



- (void)leftButtonTap:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.configure updateCachedAssets];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.model.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SSDKImagePickerElementCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.model = self.model[indexPath.item];
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger numberOfColumns;
    if (UIInterfaceOrientationIsPortrait([[UIApplication sharedApplication] statusBarOrientation])) {
        numberOfColumns = self.configure.interfaceConfigure.numberOfColumnsInPortrait;
    } else {
        numberOfColumns = self.configure.interfaceConfigure.numberOfColumnsInLandscape;
    }
    
    CGFloat width = (CGRectGetWidth(self.view.frame) - 2.0 * (numberOfColumns - 1)) / numberOfColumns;
    return CGSizeMake(width, width);
}


#pragma mark - 处理操作 -

- (SSDKImagePickerAuthorStatusView *)authorStatusView{
    if (!_authorStatusView) {
        _authorStatusView = [SSDKImagePickerAuthorStatusView new];
        _authorStatusView.hidden = YES;
        [self.view addSubview:_authorStatusView];
        [_authorStatusView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self.collectionView);
            make.bottom.equalTo(self.footerView);
        }];
    }
    return _authorStatusView;
}

- (SSDKImagePickerAlumViewFooterView *)footerView{
    if (!_footerView) {
        _footerView = [[SSDKImagePickerAlumViewFooterView alloc] initWithWithConfigure:self.configure.configureId];
        SSDKWEAK
        [_footerView setSelectedIndex:^(NSInteger index) {
            [weakSelf seletedIndex:index];
        }];
        _footerView.hidden = YES;
        [self.view addSubview:_footerView];
    }
    if (!_footerView.superview) {
        [self.view addSubview:_footerView];
    }
    
    return _footerView;
}

- (void)seletedIndex:(NSInteger)index{
    switch (index) {
        case 0:{
            
        }
            break;
        case 1:{
            
        }
            break;
        case 2:{
            if ([self.configure.pickerResult chooseStatusWithMediaType:SSDKImagePickerMediaTypeBoth] != SSDKImagePickerOperationChooseResultStatusNormal) {
                NSMutableString *stirng = [NSMutableString string];
                switch (self.configure.mediaType) {
                    case SSDKImagePickerMediaTypeImage:
                    {
                        [stirng appendFormat:@"图片最少选择：%ld张",(long)[self.configure.pickerResult minimumNumberOfSelectionType:SSDKImagePickerMediaTypeImage]];
                    }
                        break;
                    case SSDKImagePickerMediaTypeVideo:{
                        [stirng appendFormat:@"视频最少选择：%ld条",(long)[self.configure.pickerResult minimumNumberOfSelectionType:SSDKImagePickerMediaTypeVideo]];
                    }
                        break;
                    case SSDKImagePickerMediaTypeBoth:{
                        [stirng appendFormat:@"图片最少选择：%ld张",(long)[self.configure.pickerResult minimumNumberOfSelectionType:SSDKImagePickerMediaTypeImage]];
                        [stirng appendString:@","];
                        [stirng appendFormat:@"视频最少选择：%ld条",(long)[self.configure.pickerResult minimumNumberOfSelectionType:SSDKImagePickerMediaTypeVideo]];
                    }
                        break;
                    default:
                        break;
                }
                
                UIAlertControllerAlertCreate(nil, [NSString stringWithFormat:@"所选图片不符合要求,%@",stirng])
                .addDefaultAction(@"OK")
                .presentAnimated();
                return;
            }
            if (_complete) {
                _complete(SSDKImagePickerCompleteStatusSuccess,self.configure.pickerResult);
            }
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case 3:{
            SSDKImagePickerOperationChooseResultStatus status = [self.configure.pickerResult chooseStatusWithMediaType:SSDKImagePickerMediaTypeBoth];
            if (status != SSDKImagePickerOperationChooseResultStatusNormal) {
                _complete(SSDKImagePickerCompleteStatusCancel,self.configure.pickerResult);
                [self dismissViewControllerAnimated:YES completion:nil];
            }else{
                [self seletedIndex:2];
            }
        }
            break;
        default:
            break;
    }
}

- (void)rightButtonTap:(UIButton *)button{
    [self seletedIndex:3];
}

@end
