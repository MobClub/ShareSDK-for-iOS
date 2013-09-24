//
//  AGLeftSideTableCell.m
//  AGShareSDKDemo
//
//  Created by 冯 鸿杰 on 13-1-30.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import "AGLeftSideTableCell.h"

@implementation AGLeftSideTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.accessoryView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AccessoryView.png"]] autorelease];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.accessoryView.frame = CGRectMake(250, self.accessoryView.top, self.accessoryView.width, self.accessoryView.height);
}

@end
