//
//  UAEnums.h
//  TYRZUI
//
//  Created by 谢鸿标 on 2020/3/16.
//  Copyright © 2020 谢鸿标. All rights reserved.
//

#ifndef UAEnums_h
#define UAEnums_h

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, UAPresentationDirection) {
    UAPresentationDirectionBottom = 0,  //底部  present默认效果
    UAPresentationDirectionRight,       //右边  导航栏效果
    UAPresentationDirectionTop,         //上面
    UAPresentationDirectionLeft,        //左边
};

typedef NS_ENUM(NSUInteger, UALanguageType) {
    UALanguageSimplifiedChinese = 0,  //简体中文
    UALanguageTraditionalChinese,     //繁体中文
    UALanguageEnglish,                //英文
};

#endif /* UAEnums_h */
