//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
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
