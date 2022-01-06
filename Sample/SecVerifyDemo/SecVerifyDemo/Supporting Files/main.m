//
//  main.m
//  SecVerifyDemo
//
//  Created by yoozoo on 2019/9/2.
//  Copyright © 2019 yoozoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    
    NSLog(@"****>>>start: %f", [NSDate date].timeIntervalSince1970);
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
