//
//  NotificationController.m
//  ShareSDKWatchAppDemo WatchKit Extension
//
//  Created by 刘 靖煌 on 15/5/15.
//  Copyright (c) 2015年 游族网络MOB事业部. All rights reserved.
//

#import "NotificationController.h"

@interface NotificationController()

@end

@implementation NotificationController

- (instancetype)init {
    self = [super init];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        
    }
    return self;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



