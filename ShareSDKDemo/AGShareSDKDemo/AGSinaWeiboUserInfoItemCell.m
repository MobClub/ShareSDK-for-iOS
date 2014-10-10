//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
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
