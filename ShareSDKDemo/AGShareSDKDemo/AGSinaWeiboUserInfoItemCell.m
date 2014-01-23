//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGSinaWeiboUserInfoItemCell.h"
#import <AGCommon/UIColor+Common.h>

#define PADDING_LEFT 14.0
#define PADDING_RIGHT 14.0
#define PADDING_BOTTOM 13.0
#define PADDING_TOP 13.0

#define SUBTITLE_LEFT 90.0

@implementation AGSinaWeiboUserInfoItemCell

@synthesize cellHeight;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        self.textLabel.textColor = [UIColor colorWithRGB:0x333333];
        self.textLabel.font = [UIFont systemFontOfSize:15];
        self.textLabel.backgroundColor = [UIColor clearColor];
        
        self.detailTextLabel.font = [UIFont systemFontOfSize:15];
        self.detailTextLabel.numberOfLines = 0;
        self.detailTextLabel.textColor = [UIColor blackColor];
        self.detailTextLabel.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    CGRect rect = [self.detailTextLabel textRectForBounds:CGRectMake(0.0,
                                                                     0.0,
                                                                     self.contentView.width - SUBTITLE_LEFT - PADDING_RIGHT,
                                                                     MAXFLOAT)
                                   limitedToNumberOfLines:0];
    CGFloat height = rect.size.height + PADDING_TOP + PADDING_BOTTOM > self.contentView.height ? rect.size.height + PADDING_TOP + PADDING_BOTTOM : self.contentView.height;
    
    self.textLabel.frame = CGRectMake(PADDING_LEFT,
                                      (height - self.textLabel.height) / 2,
                                      self.textLabel.width,
                                      self.textLabel.height);
    self.detailTextLabel.frame = CGRectMake(SUBTITLE_LEFT,
                                            (height - rect.size.height) / 2,
                                            rect.size.width,
                                            rect.size.height);
    
}

- (CGFloat)cellHeight
{
    [self.textLabel sizeToFit];
    [self.detailTextLabel sizeToFit];
    
    CGRect rect = [self.detailTextLabel textRectForBounds:CGRectMake(0.0,
                                                                     0.0,
                                                                     self.width - 20 - SUBTITLE_LEFT - PADDING_RIGHT,
                                                                     MAXFLOAT)
                                   limitedToNumberOfLines:0];
    CGFloat height = rect.size.height + PADDING_TOP + PADDING_BOTTOM > self.contentView.height ? rect.size.height + PADDING_TOP + PADDING_BOTTOM : self.contentView.height;
    
    self.textLabel.frame = CGRectMake(PADDING_LEFT,
                                      (height - self.textLabel.height) / 2,
                                      self.textLabel.width,
                                      self.textLabel.height);
    self.detailTextLabel.frame = CGRectMake(SUBTITLE_LEFT,
                                            (height - rect.size.height) / 2,
                                            rect.size.width,
                                            rect.size.height);
    
    return height;
}

@end
