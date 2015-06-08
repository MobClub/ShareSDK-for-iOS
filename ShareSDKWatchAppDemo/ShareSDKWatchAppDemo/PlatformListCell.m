//
//  PlatformListCell.m
//  ShareSDKWatchAppDemo
//
//  Created by 刘 靖煌 on 15/5/20.
//  Copyright (c) 2015年 游族网络MOB事业部. All rights reserved.
//

#import "PlatformListCell.h"

#define IMAGE_SIZE 35.0

@implementation PlatformListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.textLabel.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //间距
    CGFloat margin = (self.contentView.frame.size.height - IMAGE_SIZE) / 2;

    self.imageView.frame = CGRectMake(margin, margin, IMAGE_SIZE, IMAGE_SIZE);
    self.textLabel.frame = CGRectMake(self.imageView.frame.origin.x + self.imageView.frame.size.width + margin,
                                      self.textLabel.frame.origin.y,
                                      self.textLabel.frame.size.width,
                                      self.textLabel.frame.size.height);
}


@end
