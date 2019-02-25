//
//  UIImage+KaImage.m
//  JLbao
//
//  Created by anplex_yy on 16/5/12.
//  Copyright © 2016年 anplex. All rights reserved.
//

#import "UIImage+KaImage.h"

@implementation UIImage (KaImage)

+ (UIImage *)getImageWithColor:(UIColor*)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
