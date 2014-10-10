//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGSinaWeiboUserDescItemCell.h"
#import <AGCommon/UIColor+Common.h>

#define PADDING_LEFT 14.0
#define PADDING_RIGHT 14.0
#define PADDING_BOTTOM 13.0
#define PADDING_TOP 13.0
#define VERTICAL_GAP 8.0

@implementation AGSinaWeiboUserDescItemCell

@synthesize cellHeight = _cellHeight;

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
        self.detailTextLabel.textColor = [UIColor blackColor];
        self.detailTextLabel.numberOfLines = 0;
        self.detailTextLabel.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.textLabel.frame = CGRectMake(PADDING_LEFT,
                                      PADDING_TOP,
                                      self.textLabel.width,
                                      self.textLabel.height);
    self.detailTextLabel.frame = [self.detailTextLabel textRectForBounds:CGRectMake(PADDING_LEFT,
                                                                                    self.textLabel.bottom + VERTICAL_GAP,
                                                                                    self.contentView.width - PADDING_LEFT - PADDING_RIGHT,
                                                                                    MAXFLOAT)
                                                  limitedToNumberOfLines:0];
    _cellHeight = self.detailTextLabel.bottom + PADDING_BOTTOM;
}

- (CGFloat)cellHeight
{
    [self.textLabel sizeToFit];
    [self.detailTextLabel sizeToFit];
    
    self.textLabel.frame = CGRectMake(PADDING_LEFT,
                                      PADDING_TOP,
                                      self.textLabel.width,
                                      self.textLabel.height);
    self.detailTextLabel.frame = [self.detailTextLabel textRectForBounds:CGRectMake(PADDING_LEFT,
                                                                                    self.textLabel.bottom + VERTICAL_GAP,
                                                                                    self.width - 20 - PADDING_LEFT - PADDING_RIGHT,
                                                                                    MAXFLOAT)
                                                  limitedToNumberOfLines:0];
    _cellHeight = self.detailTextLabel.bottom + PADDING_BOTTOM;

    return _cellHeight;
}

@end
