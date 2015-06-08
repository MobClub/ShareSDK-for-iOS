//
//  PlatformRow.m
//  ShareSDKWatchAppDemo
//
//  Created by 刘 靖煌 on 15/5/15.
//  Copyright (c) 2015年 游族网络MOB事业部. All rights reserved.
//

#import "PlatformRow.h"

@implementation PlatformRow

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [self init])
    {
        self.platfromName = dic[@"platImg"];
        self.platformIcon = dic[@"platName"];
    }
    
    return self;
}

+ (instancetype)platformWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

@end
