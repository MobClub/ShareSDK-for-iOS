//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGSinaWeiboPictureViewController.h"

@interface AGSinaWeiboPictureViewController ()

@end

@implementation AGSinaWeiboPictureViewController

- (id)initWithImageUrl:(NSString *)imageUrl imageCacheManager:(CMImageCacheManager *)imageCacheManager
{
    if (self = [super init])
    {
        _imageUrl = [imageUrl copy];
        _imageCacheManager = imageCacheManager;
        
        self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"TEXT_CANCEL", @"取消") 
                                                                                  style:UIBarButtonItemStyleBordered
                                                                                 target:self
                                                                                 action:@selector(closeButtonClickHandler:)]
                                                 autorelease];
    }
    return self;
}

- (void)dealloc
{
    _imageCacheManager = nil;
    SAFE_RELEASE(_imageUrl);
    
    [_imageLoader removeAllNotificationWithTarget:self];
    SAFE_RELEASE(_imageLoader);
    
    _contentView.delegate = nil;
    _contentView = nil;
    _imageView = nil;
    
    [super dealloc];
}

- (void)loadView
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor blackColor];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    
    _contentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.width, self.view.height)];
    _contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _contentView.minimumZoomScale = 1;
    _contentView.maximumZoomScale = 2;
    _contentView.zoomScale = 1;
    _contentView.delegate = self;
    [self.view addSubview:_contentView];
    [_contentView release];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [_contentView addSubview:_imageView];
    [_imageView release];
    
        //加载图片
        [_imageLoader removeAllNotificationWithTarget:self];
    SAFE_RELEASE(_imageLoader);
    
    _imageLoader = [[_imageCacheManager getImage:_imageUrl] retain];
    if (_imageLoader.state == ImageLoaderStateReady)
    {
        _imageView.image = _imageLoader.content;
        [_imageView sizeToFit];
        _imageView.frame = CGRectMake(0.0, 0.0, self.view.width, _imageView.height * self.view.width / _imageView.width);
    }
    else
    {
        [_imageLoader addNotificationWithName:NOTIF_IMAGE_LOAD_COMPLETE
                                       target:self
                                       action:@selector(imageLoadCompleteHandler:)];
        [_imageLoader addNotificationWithName:NOTIF_IMAGE_LOAD_ERROR
                                       target:self
                                       action:@selector(imageLoadErrorHandler:)];
    }
}

- (void)closeButtonClickHandler:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - Private

- (void)imageLoadCompleteHandler:(NSNotification *)notif
{
    _imageView.image = _imageLoader.content;
    [_imageView sizeToFit];
    _imageView.frame = CGRectMake(0.0, 0.0, self.view.width, _imageView.height * self.view.width / _imageView.width);
    
    [_imageLoader removeAllNotificationWithTarget:self];
    SAFE_RELEASE(_imageLoader);
}

- (void)imageLoadErrorHandler:(NSNotification *)notif
{
    [_imageLoader removeAllNotificationWithTarget:self];
    SAFE_RELEASE(_imageLoader);
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

@end
