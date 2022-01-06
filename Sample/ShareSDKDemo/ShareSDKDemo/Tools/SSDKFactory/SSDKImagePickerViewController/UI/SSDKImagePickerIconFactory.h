//
//  SSDKImagePickerViewIconFactory.h
//  ShareSDKDemo
//
//  Created by PP on 2020/2/20.
//  Copyright © 2020 mob. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSDKVideoIconView : UIView

@property (nonatomic, strong) IBInspectable UIColor *iconColor;

@end

@interface SSDKSlomoIconView : UIView
@property (nonatomic, strong) IBInspectable UIColor *iconColor;
@end

@interface SSDKCheckIconView: UIView

@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, assign) IBInspectable CGFloat checkmarkLineWidth;

@property (nonatomic, strong) IBInspectable UIColor *borderColor;
@property (nonatomic, strong) IBInspectable UIColor *bodyColor;
@property (nonatomic, strong) IBInspectable UIColor *checkmarkColor;

@end

@interface SSDKImagePickerAuthorStatusView : UIView

@end

NS_ASSUME_NONNULL_END
