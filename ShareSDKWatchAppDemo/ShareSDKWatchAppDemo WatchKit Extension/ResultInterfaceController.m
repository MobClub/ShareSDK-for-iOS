//
//  ResultInterfaceController.m
//  ShareSDKWatchAppDemo
//
//  Created by 刘靖煌 on 15/5/29.
//  Copyright (c) 2015年 游族网络MOB事业部. All rights reserved.
//

#import "ResultInterfaceController.h"

@interface ResultInterfaceController ()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *resultLabel;

@end

@implementation ResultInterfaceController

- (void)awakeWithContext:(id)context
{
    [super awakeWithContext:context];
    
    if ([context isEqualToString:@"YES"])
    {
        [_resultLabel setText:@"分享成功"];
    }
    else
    {
        [_resultLabel setText:context];
    }
}

@end



