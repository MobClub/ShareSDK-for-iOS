//
//  MOBPlatfromMethodStyleModel.h
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/16.
//  Copyright © 2019 mob. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MOBPlatfromMethodStyleModel : NSObject

@property (nonatomic, copy) NSString *method;

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, strong) UIImage *headerImage;

@property (nonatomic, strong) UIImage *selectedHeaderImage;

@end



static inline MOBPlatfromMethodStyleModel * MOBPlatfromMethodStyleModelCreate (NSString *method, NSString *image, NSString *text, NSString *headerImage){
    MOBPlatfromMethodStyleModel *model = [MOBPlatfromMethodStyleModel new];
    model.method = method;
    model.image = UIImageNamed(image);
    model.text = text;
    if (headerImage.length > 0) {
        model.headerImage = UIImageNamed([headerImage stringByAppendingString:@"_nor"]);
        model.selectedHeaderImage = UIImageNamed([headerImage stringByAppendingString:@"_sel"]);
    }
    return model;
}

extern NSString *const MOBTextShareIcon;
extern NSString *const MOBImageShareIcon;
extern NSString *const MOBMutiImageShareIcon;
extern NSString *const MOBTextImageShareIcon;
extern NSString *const MOBAudioShareIcon;
extern NSString *const MOBVideoShareIcon;
extern NSString *const MOBLinkShareIcon;
extern NSString *const MOBFileShareIcon ;
extern NSString *const MOBApplicationShareIcon;
extern NSString *const MOBEmojiShareIcon;
extern NSString *const MOBMiniProgramShareIcon;


static inline NSArray *listPriority(){
    NSArray * _a = @[
    MOBPlatfromMethodStyleModelCreate(@"shareText", MOBTextShareIcon, @"文字", @"content_icon_text"),
    MOBPlatfromMethodStyleModelCreate(@"shareImage", MOBImageShareIcon, @"单图", @"content_icon_img"),
    MOBPlatfromMethodStyleModelCreate(@"shareMutiImage", MOBMutiImageShareIcon, @"多图", @"content_icon_imgs"),
    MOBPlatfromMethodStyleModelCreate(@"shareTextImage", MOBTextImageShareIcon, @"图文", @"content_icon_graphic"),
    MOBPlatfromMethodStyleModelCreate(@"shareAudio", MOBAudioShareIcon, @"音频", @"content_icon_audio"),
    MOBPlatfromMethodStyleModelCreate(@"shareFile", MOBFileShareIcon, @"文件", @"content_icon_file"),
    MOBPlatfromMethodStyleModelCreate(@"shareLink", MOBLinkShareIcon, @"链接", @"content_icon_link"),
    MOBPlatfromMethodStyleModelCreate(@"shareVideo", MOBVideoShareIcon, @"视频", @"content_icon_video"),
    MOBPlatfromMethodStyleModelCreate(@"shareApplication", MOBApplicationShareIcon, @"应用", @"content_icon_application"),
    MOBPlatfromMethodStyleModelCreate(@"shareEmoji", MOBEmojiShareIcon, @"表情", @"content_icon_emoji"),
    MOBPlatfromMethodStyleModelCreate(@"shareMiniProgram", MOBMiniProgramShareIcon, @"小程序", @"content_icon_applets"),
    ];
    return _a;
}

NS_ASSUME_NONNULL_END
