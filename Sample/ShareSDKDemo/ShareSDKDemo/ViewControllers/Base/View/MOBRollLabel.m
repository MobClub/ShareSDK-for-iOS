//
//  MOBRollLabel.m
//  ShareSDKDemo
//
//  Created by wkx on 2019/4/1.
//  Copyright © 2019年 mob. All rights reserved.
//

#import "MOBRollLabel.h"

@interface MOBRollLabel (){
    UILabel *_rollLabel;
    NSTimer *_timer;
    CGRect totalRect; // 计算出来的Label的总rect
    BOOL _isCanRoll; // 是否能滚动
}

// 计时器每隔多久执行一次  默认0.01
@property(nonatomic,assign) NSTimeInterval timeInterval;

@end

@implementation MOBRollLabel

- (void)dealloc{
    [self stopRolling];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self _init];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)color{
    self = [super initWithFrame:frame];
    if (self) {
        [self _init];
        _rollLabel.textColor = color;
        _rollLabel.font = font;
    }
    return self;
}

- (void)_init{
    _autoStart = YES;
    _rollLabel = [[UILabel alloc] init];
    [self addSubview:_rollLabel];
}

- (void)setTextColor:(UIColor *)textColor{
    _rollLabel.textColor = textColor;
}

- (void)setFont:(UIFont *)font{
    _rollLabel.font = font;
}

- (void)setText:(NSString *)text{
    _rollLabel.text = text;
    
    CGSize size = [self getFontSize:_rollLabel.font withSize:CGSizeMake(MAXFLOAT, 10) withText:text];
    if (size.width > self.frame.size.width) {
        _isCanRoll = YES;
    }else{
        size.width = self.frame.size.width;
    }
    totalRect = CGRectMake(0, 0, size.width, self.frame.size.height);
    _rollLabel.frame = totalRect;
    if (_autoStart) {
        [self startRolling];
    }
}


-(void)timerAction{
    CGRect r = _rollLabel.frame;
    r.origin.x = r.origin.x - (_rollSpeed <= 0 ? 0.5:_rollSpeed);
    _rollLabel.frame = r;
    if (-r.origin.x > _rollLabel.frame.size.width - self.frame.size.width) {
        r.origin.x = 0;
        [self pauseRoll];
        [self performSelector:@selector(resetStart) withObject:nil afterDelay:0.5];
    }
}

- (void)startRolling{
    if (_isCanRoll) {
        if (_timer) {
            [_timer invalidate];
            _timer = nil;
        }
        _timer = [NSTimer scheduledTimerWithTimeInterval:_timeInterval <= 0 ? 0.01 : _timeInterval target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
        [_timer setFireDate:[NSDate distantFuture]];
        [self resetStart];
    }
}

- (void)stopRolling{
    CGRect r = _rollLabel.frame;
    r.origin.x = 0;
    _rollLabel.frame = r;
    [self pauseRoll];
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

// 从头开始滚动
- (void)resetStart{
    _rollLabel.frame = totalRect;
    [self startRoll];
}

// 开始滚动
-(void)startRoll{
    if (_isCanRoll && _timer && [_timer isValid]) {
        [self performSelector:@selector(start) withObject:nil afterDelay:1];
    }
}

- (void)start{
    [_timer setFireDate:[NSDate date]];
}

// 暂停
-(void)pauseRoll{
    if (_isCanRoll && _timer && [_timer isValid]) {
        [_timer setFireDate:[NSDate distantFuture]];
    }
}

// 获取文字size
-(CGSize)getFontSize:(UIFont *)font withSize:(CGSize)cgSize withText:(NSString *)text{
    if (![text isKindOfClass:[NSNull class]]) {
        CGRect textRect = [text boundingRectWithSize:cgSize
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:@{NSFontAttributeName:font}
                                             context:nil];
        CGSize size = textRect.size;
        return size;
    }
    return CGSizeZero;
}

- (BOOL)isRolling{
    if (_timer && _isCanRoll) {
        return YES;
    }
    return NO;
}

@end
