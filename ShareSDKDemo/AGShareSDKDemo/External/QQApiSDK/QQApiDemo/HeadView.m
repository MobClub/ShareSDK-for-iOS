//
//  HeadView.m
//  QQApiDemo
//
//  Created by Tencent on 12-5-7.
//  Copyright 2012年 Tencent. All rights reserved.
//

#import "HeadView.h"

@implementation HeadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithRed:240.0f/255.f green:240.f/255.f blue:240.f/255.f alpha:1.f];
        
        // logo
        
        UIImageView* imgView = [[[UIImageView alloc] initWithFrame:CGRectMake(133, 17, 54, 54)] autorelease];
        imgView.image = [UIImage imageNamed:@"qqicon.png"];
        [self addSubview:imgView];
        
        UILabel* label = [[[UILabel alloc] initWithFrame:CGRectMake(20, 75, 280, 30)] autorelease];
        label.text = @"手机QQ OpenAPI Demo";
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor blackColor];
        label.textAlignment = UITextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14];
        [self addSubview:label];
        
        //version
        UILabel* versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(195, 45, 100, 40)];
        versionLabel.font = [UIFont systemFontOfSize:14];
        NSString* version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
        version = [NSString stringWithFormat:@"%@%@",@"ver ",version];
        versionLabel.text = version;
        versionLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:versionLabel];
        // line
        
        UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height - 2, 320, 1)];
        lineView1.backgroundColor = [UIColor blackColor];
        lineView1.alpha = 0.1f;
        [self addSubview:lineView1];
        [lineView1 release];
        
        UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height - 1, 320, 1)];
        lineView2.backgroundColor = [UIColor whiteColor];
        lineView2.alpha = 0.25f;
        [self addSubview:lineView2];
        [lineView2 release];

    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}


@end
