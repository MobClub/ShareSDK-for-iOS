//
//  MOBRollLabel.h
//  ShareSDKDemo
//
//  Created by wkx on 2019/4/1.
//  Copyright © 2019年 mob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MOBRollLabel : UIScrollView

@property (nonatomic, strong) NSString *text; // 设置文字
@property (nonatomic, strong) UIColor  *textColor;
@property (nonatomic, strong) UIFont   *font;

@property(nonatomic, assign) float rollSpeed; // 滚动速度，默认0.5

@property(nonatomic, assign) BOOL  autoStart; // 自动开始，默认YES

@property (nonatomic, assign, readonly) BOOL isRolling;


/**
 *  初始化方法
 *  @param font  设置字体
 *  @param color 字体颜色
 */
- (instancetype)initWithFrame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)color;

- (instancetype)initWithFrame:(CGRect)frame;

// 开始滚动
- (void)startRolling;

// 停止滚动
- (void)stopRolling;

@end
