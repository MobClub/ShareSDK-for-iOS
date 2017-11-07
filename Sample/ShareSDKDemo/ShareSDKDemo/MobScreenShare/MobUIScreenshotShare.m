//
//  MobUIScreenshotShare.m
//  MobScreenShareDome
//
//  Created by youzu on 17/1/23.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MobUIScreenshotShare.h"
#import "MOBUIScreenshotShareCollectionViewCell.h"
#import <UIKit/UIKit.h>
#import <ShareSDK/ShareSDK+Base.h>

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface MobUIScreenshotShare ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UIImage *_image;
    MUSSSelecetedPlatformType _selecetedPlatformType;
    UIView *_alterView;
    UIView *_bgView;
    UIView *_mainView;
    NSBundle *_uiBundle;
    NSMutableArray *activePlatformsArray;
}

@end

@implementation MobUIScreenshotShare

+ (MobUIScreenshotShare *)shareInstance
{
    static MobUIScreenshotShare *screenshotShare = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        screenshotShare = [[MobUIScreenshotShare alloc] init];
    });
    return screenshotShare;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"ShareSDKUI" ofType:@"bundle"];
        _uiBundle = [NSBundle bundleWithPath:bundlePath];
    }
    return self;
}

#pragma mark - SSEScreenCaptureUIModeAlert

- (void)showAlertModeWithImage:(UIImage *)image
                         frame:(CGRect)rect
                      duration:(NSTimeInterval)duration
         selecetedPlatformType:(MUSSSelecetedPlatformType)selecetedPlatformType
{
    _image = image;
    _selecetedPlatformType = selecetedPlatformType;
    if(self.window == nil)
    {
        self.window = [[UIWindow alloc] initWithFrame:rect];
        self.window.backgroundColor = [UIColor clearColor];
        self.window.windowLevel = UIWindowLevelAlert + 2; //等级需按各APP情况自行设定
    }
    _alterView = [self myAlertView];
    CGRect imageRect = self.window.bounds;
    imageRect.origin = CGPointMake(6, 6);
    imageRect.size.width -= 12;
    imageRect.size.height -= 40;
    //图片
    UIImageView *smallImageView = [self imageViewWithFrame:imageRect cornerRadius:2];
    smallImageView.image = image;
    [_alterView addSubview:smallImageView];
    smallImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showDefaultMode)];
    [smallImageView addGestureRecognizer:tapGestureRecognizer];
    //按钮
    CGRect buttonRect = self.window.bounds;
    buttonRect.size.width -= 4;
    buttonRect.size.height -= CGRectGetMaxY(smallImageView.frame);
    buttonRect.origin.x = 2;
    buttonRect.origin.y = CGRectGetMaxY(smallImageView.frame);
    UIButton *shareButton = [self shareButtonWithFrame:buttonRect];
    [_alterView addSubview:shareButton];
    [self.window addSubview:_bgView];
    [self.window addSubview:_alterView];
    [self.window makeKeyAndVisible];
    _alterView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    [UIView animateWithDuration:0.25 animations:^{
        _alterView.transform = CGAffineTransformIdentity;
    }];
    if(duration > 0)
    {
        [self performSelector:@selector(closeView) withObject:nil afterDelay:duration];
    }
}

- (UIView *)myAlertView
{
    UIView *alertView = [[UIView alloc] initWithFrame:self.window.bounds];
    alertView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.8];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.window.bounds cornerRadius:6];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.window.bounds;
    maskLayer.path = maskPath.CGPath;
    alertView.layer.mask = maskLayer;
    return alertView;
}

- (UIImageView *)imageViewWithFrame:(CGRect)rect cornerRadius:(CGFloat)cornerRadius
{
    UIImageView *imageView = [[UIImageView alloc]  initWithFrame:rect];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    if(cornerRadius > 0)
    {
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:cornerRadius];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = imageView.bounds;
        maskLayer.path = maskPath.CGPath;
        imageView.layer.mask = maskLayer;
    }
    return imageView;
}

- (UIButton *)shareButtonWithFrame:(CGRect)rect
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = rect;
    button.backgroundColor = [UIColor clearColor];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setImage:[UIImage imageNamed:@"fenxiang"] forState:UIControlStateNormal];
    [button setTitle:@" 好友分享" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(showDefaultMode) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

-(void)closeView
{
    __weak __typeof__ (self) weakSelf = self;
    [UIView animateWithDuration:0.25 animations:^{
        _alterView.alpha = 0;
    }completion:^(BOOL finished) {
        [weakSelf _clear];
        weakSelf.window = nil;
    }];
}

-(void)showDefaultMode
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    _alterView.frame = self.window.frame;
    [UIView animateWithDuration:0.25 animations:^{
        _alterView.alpha = 0;
    }];
    [self showDefaultModeWithImage:_image
             selecetedPlatformType:_selecetedPlatformType];
}

#pragma mark - SSEScreenCaptureUIModeDefault

- (void)showDefaultModeWithImage:(UIImage *)image
           selecetedPlatformType:(MUSSSelecetedPlatformType)selecetedPlatformType
{
    if(self.window == nil)
    {
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window.backgroundColor = [UIColor clearColor];
        self.window.windowLevel = UIWindowLevelAlert + 2; //等级需按各APP情况自行设定
    }
    else
    {
        self.window.frame =[UIScreen mainScreen].bounds;
    }
    
    //背景
    _bgView = [[UIView alloc] initWithFrame:self.window.bounds];
    _bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeMainView)];
    [_bgView addGestureRecognizer:tapGestureRecognizer];
    [self.window addSubview:_bgView];
    _mainView = [self myMainView];
    //图片
    CGRect scrollViewRect = _mainView.bounds;
    scrollViewRect.origin = CGPointMake(10, 10);
    scrollViewRect.size.width -= 20;
    scrollViewRect.size.height -= 10;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:scrollViewRect];
    scrollView.alwaysBounceVertical = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    CGRect imageRect = scrollView.bounds;
    imageRect.origin = CGPointMake(0, 0);
    CGFloat scale = image.size.width/CGRectGetWidth(imageRect);
    imageRect.size.height = image.size.height / scale;
    UIImageView *imageView = [self imageViewWithFrame:imageRect cornerRadius:0];
    imageView.image = image;
    [scrollView addSubview:imageView];
    CGSize size = imageRect.size;
    size.height += 170;
    scrollView.contentSize = size;
    [_mainView addSubview:scrollView];
    //工具面板
    CGRect toolRect = _mainView.bounds;
    toolRect.origin.y = toolRect.size.height - 160;
    toolRect.size.height = 160;
    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView * toolView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
     toolView.frame = toolRect;
    //添加线
    CGRect rect = toolView.bounds;
    rect.size.height = 1;
    rect.origin.y = 0;
    CALayer *line = [CALayer layer];
    line.frame = rect;
    line.backgroundColor = UIColorFromRGB(0xd4d4d6).CGColor;
    [toolView.contentView.layer addSublayer:line];
    //添加分享平台列表
    CGRect collectionRect = toolView.bounds;
    collectionRect.origin.y = 0;
    collectionRect.size.height -= 50;
    UICollectionView *collectionView = [self shareListViewWithFrame:collectionRect];
    [toolView.contentView addSubview:collectionView];
    //取消按钮
    CGRect buttonRect = toolView.bounds;
    buttonRect.origin.x = 0;
    buttonRect.origin.y = buttonRect.size.height - 44;
    buttonRect.size.width -= 0;
    buttonRect.size.height = 44;
    UIButton *cancelButton = [self cancelButtonWithFrame:buttonRect];
    [toolView.contentView addSubview:cancelButton];
    [_mainView addSubview:toolView];
    [self.window addSubview:_mainView];
    [self showMainView];
    [self.window makeKeyAndVisible];
}

-(UIView *)myMainView
{
    CGRect rect = self.window.bounds;
    rect.origin.y = 100;
    rect.size.height -= 100;
    UIView *mainView = [[UIView alloc] initWithFrame:rect];
    mainView.backgroundColor = UIColorFromRGB(0xECECEE);
    return mainView;
}

- (UIImage *)getImageWithColor:(UIColor*)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIButton *)cancelButtonWithFrame:(CGRect)rect
{
    UIButton *button = [[UIButton alloc] initWithFrame:rect];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [button setTitleColor:UIColorFromRGB(0x515151) forState:UIControlStateNormal];
    UIImage *bgImage = [self getImageWithColor:[UIColor colorWithWhite:1 alpha:0.5]];
    [button setBackgroundImage:bgImage forState:UIControlStateNormal];
    [button setTitle:@"取 消" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(closeMainView) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)closeMainView
{
    CGRect newRect = _mainView.frame;
    newRect.origin.y += CGRectGetHeight(newRect);
    __weak __typeof__ (self) weakSelf = self;
    [UIView animateWithDuration:0.25 animations:^{
        _bgView.alpha = 0;
        _mainView.frame = newRect;
    }completion:^(BOOL finished) {
        [weakSelf _clear];
        weakSelf.window = nil;
    }];
}

- (void)_clear
{
    if(_alterView != nil)
    {
        [_alterView removeFromSuperview];
        _alterView = nil;
    }
    if(_mainView != nil)
    {
        [_mainView removeFromSuperview];
        _mainView = nil;
    }
    if(_image != nil)
    {
        _image = nil;
    }
    if(_bgView != nil)
    {
        [_bgView removeFromSuperview];
        _bgView = nil;
    }
    if(activePlatformsArray != nil)
    {
        [activePlatformsArray removeAllObjects];
        activePlatformsArray = nil;
    }
}

- (void)showMainView
{
    _bgView.alpha = 0;
    CGRect originRect = _mainView.frame;
    CGRect newRect = originRect;
    newRect.origin.y += CGRectGetHeight(newRect);
    _mainView.frame = newRect;
    [UIView animateWithDuration:0.25 animations:^{
        _bgView.alpha = 1;
        _mainView.frame = originRect;
    }];
}

#pragma mark - UICollectionView UICollectionViewDelegate UICollectionViewDataSource

static NSString * const cellReuseIdentifier = @"cellReuseIdentifier";

- (UICollectionView *)shareListViewWithFrame:(CGRect)rect
{
    [self activePlatforms];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 20;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor clearColor];
    [collectionView registerClass:[MOBUIScreenshotShareCollectionViewCell class] forCellWithReuseIdentifier:cellReuseIdentifier];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.showsHorizontalScrollIndicator = NO;
    return collectionView;
}

//获取可用的分享平台 （也可自行设置）
- (void)activePlatforms
{
    NSArray *array = [ShareSDK activePlatforms];
    activePlatformsArray = [[NSMutableArray alloc] init];
    if(array.count > 0)
    {
        [activePlatformsArray addObjectsFromArray:array];
    }
    //对微信和QQ、Kakao等包含多个平台的平台处理
    if ([activePlatformsArray containsObject:@(SSDKPlatformTypeWechat)])
    {
        if (![activePlatformsArray containsObject:@(SSDKPlatformSubTypeWechatSession)])
        {
            [activePlatformsArray addObject:@(SSDKPlatformSubTypeWechatSession)];
        }
        
        if (![activePlatformsArray containsObject:@(SSDKPlatformSubTypeWechatTimeline)]) {
            [activePlatformsArray addObject:@(SSDKPlatformSubTypeWechatTimeline)];
        }
        
        if (![activePlatformsArray containsObject:@(SSDKPlatformSubTypeWechatFav)]) {
            [activePlatformsArray addObject:@(SSDKPlatformSubTypeWechatFav)];
        }
        
        [activePlatformsArray removeObject:@(SSDKPlatformTypeWechat)];
    }
    //易信
    if([activePlatformsArray containsObject:@(SSDKPlatformTypeYiXin)])
    {
        if (![activePlatformsArray containsObject:@(SSDKPlatformSubTypeYiXinSession)])
        {
            [activePlatformsArray addObject:@(SSDKPlatformSubTypeYiXinSession)];
        }
        
        if (![activePlatformsArray containsObject:@(SSDKPlatformSubTypeYiXinTimeline)])
        {
            [activePlatformsArray addObject:@(SSDKPlatformSubTypeYiXinTimeline)];
        }
        
        if (![activePlatformsArray containsObject:@(SSDKPlatformSubTypeYiXinFav)])
        {
            [activePlatformsArray addObject:@(SSDKPlatformSubTypeYiXinFav)];
        }
        
        [activePlatformsArray removeObject:@(SSDKPlatformTypeYiXin)];
    }
    if ([activePlatformsArray containsObject:@(SSDKPlatformTypeKakao)])
    {
        if (![activePlatformsArray containsObject:@(SSDKPlatformSubTypeKakaoTalk)])
        {
            [activePlatformsArray addObject:@(SSDKPlatformSubTypeKakaoTalk)];
        }
        
        if (![activePlatformsArray containsObject:@(SSDKPlatformSubTypeKakaoStory)])
        {
            [activePlatformsArray addObject:@(SSDKPlatformSubTypeKakaoStory)];
        }
        
        [activePlatformsArray removeObject:@(SSDKPlatformTypeKakao)];
    }
    if ([activePlatformsArray containsObject:@(SSDKPlatformTypeQQ)])
    {
        if (![activePlatformsArray containsObject:@(SSDKPlatformSubTypeQZone)]) {
            [activePlatformsArray addObject:@(SSDKPlatformSubTypeQZone)];
        }
        
        if (![activePlatformsArray containsObject:@(SSDKPlatformSubTypeQQFriend)]) {
            [activePlatformsArray addObject:@(SSDKPlatformSubTypeQQFriend)];
        }
        
        [activePlatformsArray removeObject:@(SSDKPlatformTypeQQ)];
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return activePlatformsArray.count;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 15, 0, 15);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(60, 100);
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MOBUIScreenshotShareCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    if(indexPath.row < activePlatformsArray.count)
    {
        id obj = activePlatformsArray[indexPath.row];
        NSInteger platformType = [obj integerValue];
        NSString *iconImageName = [NSString stringWithFormat:@"Icon/sns_icon_%ld.png",(long)platformType];
        UIImage *icon = [UIImage imageWithContentsOfFile:[_uiBundle pathForResource:(iconImageName) ofType:nil]];
        cell.imageView.image = icon;
        NSString *platformTypeName = [NSString stringWithFormat:@"ShareType_%zi",platformType];
        NSString *titel = NSLocalizedStringWithDefaultValue(platformTypeName, @"ShareSDKUI_Localizable", _uiBundle, platformTypeName, nil);
        cell.titelLabel.text = titel;
    }
    return cell;
}

//选中操作 跳转
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    id obj = activePlatformsArray[indexPath.row];
    NSInteger platformType = [obj integerValue];
    _selecetedPlatformType(platformType);
    [self closeMainView];
}

@end
