//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
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
