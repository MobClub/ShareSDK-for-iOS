//
//  MOBShareVideoAlertView.m
//  ShareSDKDemo
//
//  Created by yoozoo on 2020/9/7.
//  Copyright © 2020 mob. All rights reserved.
//

#import "MOBShareVideoAlertView.h"
#import <ShareSDKUI/ShareSDKUI.h>
#import "MOBPlatformDataSource.h"
#import "MOBShareContentActionModel.h"

@interface MOBShareVideoAlertView ()

@property (nonatomic, strong) UIImageView *videoCoverImg;

@property (nonatomic, strong) UIView *videoCoverView;

@property (nonatomic, strong) UIImageView *videoPlayImg;

@property (nonatomic, strong) UILabel *guideLabel;

@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) UIImageView *appIconImg;

@property (nonatomic, strong) UILabel *appNameLabel;

@property (nonatomic, strong) UILabel *appDescLabel;

@property (nonatomic, strong) UIImageView *qrcodeImg;

@property (nonatomic, strong) UIImageView *smallAppIconImg;

@property (nonatomic, strong) NSURL *videoUrl;

@end
@implementation MOBShareVideoAlertView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 12;
    self.layer.masksToBounds = YES;
    [self videoCoverImg];
    [self videoCoverView];
    [self videoPlayImg];
    [self guideLabel];
    [self bottomView];
    [self appIconImg];
    [self appNameLabel];
    [self appDescLabel];
    [self qrcodeImg];
    [self smallAppIconImg];
}

- (void)showWithModel:(SSDKShareVideoModel *)model modelView:(UIView *)modelView{
    // 获取最新的一个相册视频
    PHFetchResult *assetsFetchResults = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeVideo options:nil];
    if(assetsFetchResults.count == 0){
        return;
    }
    
    self.guideLabel.text = [NSString stringWithFormat:@"打开【%@】，观看完整视频",model.appName];
    self.appIconImg.image = [UIImage imageNamed:model.appIcon];
    self.appNameLabel.text = model.appName;
    self.appDescLabel.text = model.appDesc;
    self.qrcodeImg.image = [UIImage imageNamed:model.appQRcode];
    self.smallAppIconImg.image = [UIImage imageNamed:model.appIcon];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSUInteger count = [UIApplication sharedApplication].windows.count;
        [[UIApplication sharedApplication].windows[count-1] addSubview:self];
    });

    PHAsset *asset = assetsFetchResults[assetsFetchResults.count-1];

    PHVideoRequestOptions *videoOptions = [[PHVideoRequestOptions alloc] init];
    videoOptions.version = PHImageRequestOptionsVersionCurrent;
    videoOptions.deliveryMode = PHVideoRequestOptionsDeliveryModeAutomatic;

    __weak typeof(self) weakself = self;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{

        [[PHImageManager defaultManager]requestAVAssetForVideo:asset options:videoOptions resultHandler:^(AVAsset * _Nullable asset, AVAudioMix * _Nullable audioMix, NSDictionary * _Nullable info) {
            __strong typeof(weakself) strongself = weakself;
            if(asset && [asset isKindOfClass:[AVURLAsset class]]) {
                AVURLAsset *urlAsset = (AVURLAsset *)asset;
                NSURL *url = urlAsset.URL;
                strongself.videoUrl = url;
                dispatch_async(dispatch_get_main_queue(), ^{
                        
                    //设置封面
                    strongself.videoCoverImg.image = [strongself getVideoFirstViewImage:url];
                });
            }
        }];
    });
    //显示分享菜单
    [ShareSDK showShareActionSheet:modelView customItems:[self platforms] sheetConfiguration:nil onStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
        
        [[MOBShareExample defaultExample] sharePlatType:platformType userData:userData state:state error:error];
        [self removeFromSuperview];
    }];
}

- (NSArray *)platforms {
    MOBShareContentActionModel *actionModel = [MOBPlatformDataSource dataSource].shareWithContentData[7];
    MOBShareContentActionPlatformModel *gnModel = actionModel.platforms[0];
    MOBShareContentActionPlatformModel *hwModel = actionModel.platforms[1];
    MOBShareContentActionPlatformModel *otherModel = actionModel.platforms[2];
    
    NSMutableArray<MOBSharePlatformShareItemModel *> *arr = [NSMutableArray arrayWithArray:gnModel.dataSource];
    [arr addObjectsFromArray:hwModel.dataSource];
    [arr addObjectsFromArray:otherModel.dataSource];
    
    NSMutableArray *items = [NSMutableArray array];
    for (MOBSharePlatformShareItemModel *item in arr) {
        [items addObject:@(item.platformModel.platformType)];
    }
    return items;
}

/// 获取视频第一帧图片
- (UIImage*)getVideoFirstViewImage:(NSURL *)path {
    
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:path options:nil];
    AVAssetImageGenerator *assetGen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    
    assetGen.appliesPreferredTrackTransform = YES;
    CMTime time = CMTimeMakeWithSeconds(0.0, 600);
    NSError *error = nil;
    CMTime actualTime;
    CGImageRef imageRef = [assetGen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    UIImage *videoImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return videoImage;
}

- (UIImageView *)videoCoverImg {
    if(!_videoCoverImg){
        UIImageViewModelCreate()
        .addToSuperView(self)
        .cornerRadius(5)
        .masksToBounds(YES)
        .contentMode(UIViewContentModeScaleAspectFit)
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _videoCoverImg = view;
        })
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.centerX.mas_offset(0);
            make.top.mas_offset(12);
            make.width.mas_equalTo(156);
            make.height.mas_equalTo(136);
        });
    }
    return _videoCoverImg;
}

- (UIView *)videoCoverView {
    if(!_videoCoverView){
        UIViewModelCreate()
        .addToSuperView(self.videoCoverImg)
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _videoCoverView = view;
        })
        .backgroundColor([UIColor colorWithWhite:0 alpha:0.4])
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.edges.mas_offset(0);
        });
    }
    return _videoCoverView;;
}

- (UIImageView *)videoPlayImg {
    if(!_videoPlayImg){
        UIImageViewModelCreate()
        .addToSuperView(self.videoCoverView)
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _videoPlayImg = view;
        })
        .image([UIImage imageNamed:@"play"])
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.centerX.centerY.mas_offset(0);
            make.size.mas_equalTo(CGSizeMake(20, 22));
        });
    }
    return _videoPlayImg;;
}

- (UILabel *)guideLabel{
    if (!_guideLabel) {
        UILabelModelCreate()
        .addToSuperView(self)
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _guideLabel = view;
        })
        .numberOfLines(1)
        .font(Font(PingFangReguler, 12))
        .textAlignment(NSTextAlignmentCenter)
        .textColor(UIColorHexString(@"0E0E0E"))
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.centerX.mas_offset(0);
            make.top.mas_offset(184);
        });
    }
    return _guideLabel;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        UIViewModelCreate()
        .addToSuperView(self)
        .backgroundColor(UIColorHexString(@"F5F5F5"))
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _bottomView = view;
        })
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.left.right.bottom.mas_offset(0);
            make.height.mas_equalTo(80);
        });
    }
    return _bottomView;
}

- (UIImageView *)appIconImg {
    if(!_appIconImg){
        UIImageViewModelCreate()
        .addToSuperView(self.bottomView)
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _appIconImg = view;
        })
        .cornerRadius(5)
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.left.mas_offset(17);
            make.top.mas_offset(24);
            make.size.mas_equalTo(CGSizeMake(31, 31));
        });
    }
    return _appIconImg;;
}

- (UILabel *)appNameLabel{
    if (!_appNameLabel) {
        UILabelModelCreate()
        .addToSuperView(self.bottomView)
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _appNameLabel = view;
        })
        .numberOfLines(1)
        .font(Font(PingFangMedium, 12))
        .textAlignment(NSTextAlignmentLeft)
        .textColor(UIColorHexString(@"0E0E0E"))
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.top.mas_offset(22);
            make.left.mas_offset(55);
            make.right.mas_offset(-80);
        });
    }
    return _appNameLabel;
}

- (UILabel *)appDescLabel{
    if (!_appDescLabel) {
        UILabelModelCreate()
        .addToSuperView(self.bottomView)
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _appDescLabel = view;
        })
        .numberOfLines(2)
        .font(Font(PingFangReguler, 10))
        .textAlignment(NSTextAlignmentLeft)
        .textColor(UIColorHexString(@"0E0E0E"))
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.top.mas_offset(42);
            make.left.mas_offset(55);
            make.right.mas_offset(-80);
        });
    }
    return _appDescLabel;
}

- (UIImageView *)qrcodeImg {
    if(!_qrcodeImg){
        UIImageViewModelCreate()
        .addToSuperView(self.bottomView)
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _qrcodeImg = view;
        })
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.right.mas_offset(-18);
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(56, 56));
        });
    }
    return _qrcodeImg;;
}


- (UIImageView *)smallAppIconImg {
    if(!_smallAppIconImg){
        UIImageViewModelCreate()
        .addToSuperView(self.qrcodeImg)
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _smallAppIconImg = view;
        })
        .cornerRadius(2)
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.centerX.centerY.mas_offset(0);
            make.size.mas_equalTo(CGSizeMake(18, 18));
        });
    }
    return _smallAppIconImg;;
}
@end
