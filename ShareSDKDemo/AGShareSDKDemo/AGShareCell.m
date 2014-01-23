//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGShareCell.h"

#define IMAGE_SIZE 35.0

@implementation AGShareCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // Initialization code
        self.textLabel.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat vg = (self.contentView.height - IMAGE_SIZE) / 2;
    
    self.imageView.frame = CGRectMake(vg, vg, IMAGE_SIZE, IMAGE_SIZE);
    self.textLabel.frame = CGRectMake(self.imageView.left + self.imageView.width + vg, self.textLabel.top, self.textLabel.width, self.textLabel.height);
}

@end
