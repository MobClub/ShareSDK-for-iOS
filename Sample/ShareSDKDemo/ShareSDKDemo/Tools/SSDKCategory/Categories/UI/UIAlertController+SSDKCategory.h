//
//  UIAlertController+SSDKCategory.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/2.
//  Copyright © 2019 mob. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


/**
 快速创建
 */
static inline UIAlertController *UIAlertControllerCreate( NSString *_Nullable title, NSString *_Nullable message, UIAlertControllerStyle style){
    return [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
}
static inline UIAlertController *UIAlertControllerAlertCreate(NSString *_Nullable title,NSString *_Nullable message){
    return [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
}
static inline UIAlertController *UIAlertControllerSheetCreate(NSString *_Nullable title, NSString *_Nullable message){
    return [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
}

typedef void (^ ssdk_AlertTapBlock)(NSInteger index, UIAlertAction *action);
@interface UIAlertController (SSDKCategory)

/**
 添加Action，并设置key值，需要在点击方法中使用
 */
@property (nonatomic, copy, readonly) UIAlertController * (^ addAction)(NSString *title, UIAlertActionStyle style);
@property (nonatomic, copy, readonly) UIAlertController * (^ addDesAction)(NSString *title);
@property (nonatomic, copy, readonly) UIAlertController * (^ addCancelAction)(NSString *title);
@property (nonatomic, copy, readonly) UIAlertController * (^ addDefaultAction)(NSString *title);

@property (nonatomic, copy, readonly) UIAlertController * (^ actionIndex)(NSInteger index);

@property (nonatomic, copy, readonly) UIAlertController * (^ addTextField) (void (^ textField) (UITextField *textField));
/**
 在点语法中用来返回一个最近添加的UIAlertAction，用来设置样式
 */
@property (nonatomic, copy, readonly) UIAlertController * (^ actionStyle) (void (^ actionStyle)(UIAlertAction * action));


/**
 action点击方法，返回的key值是上面添加的key值
 */
@property (nonatomic, copy, readonly) UIAlertController * (^ actionTap) (ssdk_AlertTapBlock tapIndex);


/**
 在点语法中用来返回当前的UIAlertVController，用来设置样式
 */
@property (nonatomic, copy, readonly) UIAlertController * (^ alertStyle) (void (^ alert)(UIAlertController *alertVC));


/**
 title样式设置
 */
@property (nonatomic, copy, readonly) UIAlertController * (^ alertTitleAttributeFontWithColor)(UIFont *font, UIColor *color);
@property (nonatomic, copy, readonly) UIAlertController * (^ alertTitleAttributeWidthDictionary)(void (^attribute)(NSMutableDictionary * attributes));

/**
 message样式设置
 */
@property (nonatomic, copy, readonly) UIAlertController * (^ alertMessageAttributeFontWithColor)(UIFont *font, UIColor *color);
@property (nonatomic, copy, readonly) UIAlertController * (^ alertMessageAttributeWidthDictionary)(void (^attribute)(NSMutableDictionary * attributes));
//detail
//@property (nonatomic, copy, readonly) UIAlertController * (^ alertDetailAttributeFontWithColor)(UIFont *font, UIColor *color);
//@property (nonatomic, copy, readonly) UIAlertController * (^ alertDetailAttributeWidthDictionary)(void (^attribute)(NSMutableDictionary * attributes));


/**
 title属性
 */
@property (nonatomic, copy, readonly) UIAlertController * (^ alertTitleMaxNum)(NSUInteger numberOfLines);
@property (nonatomic, copy, readonly) UIAlertController * (^ alertTitleLineBreakMode)(NSLineBreakMode mode);
/**
 设置title字体颜色
 */
- (void)setACTitleAttributedString:(nullable NSAttributedString *)attributedString;

/**
 设置message字体颜色
 */
- (void)setACMessageAttributedString:(nullable NSAttributedString *)attributedString;

/**
 设置介绍字体颜色
 */
- (void)setACDetailAttributedString:(nullable NSAttributedString *)attributedString;

/**
 设置title最大行数
 */
- (void)setACTitleLineMaxNumber:(NSInteger)number;

/**
 设置title截断模式
 */
- (void)setACTitleLineBreakModel:(NSLineBreakMode)mode;

/**
 添加action
 */
- (UIAlertAction *)addActionTitle:(NSString *)title style:(UIAlertActionStyle)style block:(void (^) (UIAlertAction *action))block;


@end



@interface UIAlertAction (SSDKCategory)

@property (nonatomic, weak, readonly) UIAlertController * alertViewController;

@property (nonatomic, assign) NSInteger ssdk_actionTag;

/**
 设置action颜色
 */
- (void)setAlertActionTitleColor:(UIColor *)color;

/**
 设置action图片
 
 */
- (void)setAlertImage:(UIImage *)image;


@end

NS_ASSUME_NONNULL_END
