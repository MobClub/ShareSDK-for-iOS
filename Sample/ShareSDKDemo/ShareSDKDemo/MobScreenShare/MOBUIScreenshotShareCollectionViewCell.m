//
//  MOBUIScreenshotShareCollectionViewCell.m
//  MobScreenShareDome
//
//  Created by youzu on 17/1/23.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBUIScreenshotShareCollectionViewCell.h"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation MOBUIScreenshotShareCollectionViewCell

- (void)dealloc
{
//    NSLog(@"MOBUIScreenshotShareCollectionViewCell dealloc");
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect imageRect;
        imageRect.origin.x = (CGRectGetWidth(frame) - 58) / 2.0;
        imageRect.origin.y = 10;
        imageRect.size = CGSizeMake(58, 58);
        self.imageView = [[UIImageView alloc] initWithFrame:imageRect];
        [self addSubview:self.imageView];
        CGRect rect;
        rect.origin.x = 0;
        rect.origin.y = CGRectGetMaxY(self.imageView.frame);
        rect.size.height = 30;
        rect.size.width = CGRectGetWidth(frame);
        self.titelLabel = [[UILabel alloc] initWithFrame:rect];
        self.titelLabel.textAlignment = NSTextAlignmentCenter;
        self.titelLabel.textColor = UIColorFromRGB(0x515151);
        self.titelLabel.font = [UIFont systemFontOfSize:12];
        self.titelLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:self.titelLabel];
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    if (highlighted)
    {
        self.imageView.alpha = 0.5;
    }
    else
    {
        self.imageView.alpha = 1;
    }
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    if (!selected)
    {
        self.imageView.alpha = 1;
    }
}

@end
