//
//  MOBShareContentActionModel.h
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/13.
//  Copyright © 2019 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOBShareContentActionPlatformModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MOBShareContentActionModel : NSObject

@property (nonatomic, copy) NSString * name;

@property (nonatomic, strong) UIImage * image;

@property (nonatomic, strong) UIImage * selectedImage;

@property (nonatomic, strong) NSArray <MOBShareContentActionPlatformModel *>*platforms;

@property (nonatomic, strong) NSMutableDictionary *parameters;

- (void)addItemModel:(MOBSharePlatformShareItemModel *)item type:(NSInteger)type;

@end

NS_ASSUME_NONNULL_END
