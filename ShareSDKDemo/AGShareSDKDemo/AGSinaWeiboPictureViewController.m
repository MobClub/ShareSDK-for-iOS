//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
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
    
            //Load image.
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
