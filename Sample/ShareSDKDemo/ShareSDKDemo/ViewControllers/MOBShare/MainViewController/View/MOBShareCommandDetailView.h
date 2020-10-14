//
//  MOBShareCommandDetailView.h
//  ShareSDKDemo
//
//  Created by cl on 2020/7/28.
//  Copyright © 2020 mob. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface MOBShareCommandDetailView : UIView

- (void)showWithParams:(NSDictionary *)parameters;

//展示视频(此方法暂时不调用   2020-09-09)
- (void)showVideoDetailWithParams:(NSDictionary *)parameters;

@end

NS_ASSUME_NONNULL_END
