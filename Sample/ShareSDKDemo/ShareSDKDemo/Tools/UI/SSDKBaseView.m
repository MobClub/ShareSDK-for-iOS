//
//  SSDKBaseView.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/13.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseView.h"

@implementation SSDKBaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
