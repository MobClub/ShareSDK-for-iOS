//
//  PlatformRow.h
//  ShareSDKWatchAppDemo
//
//  Created by 刘 靖煌 on 15/5/15.
//  Copyright (c) 2015年 游族网络MOB事业部. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface PlatformRow : NSObject

@property (weak, nonatomic) IBOutlet WKInterfaceGroup *platformIcon;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *platfromName;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)platformWithDic:(NSDictionary *)dic;

@end
