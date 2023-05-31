//
//  MobSharePlatformStyleModel.h
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/11.
//  Copyright © 2019 mob. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN



typedef NS_ENUM(NSUInteger, MobSharePlatformStyle) {
    MobSharePlatformStyleContent,
    MobSharePlatformStylePlatform,
    MobSharePlatformStylePopShare,
    MobSharePlatformStyleShotShare,
    MobSharePlatformStyleShakeShare,
    MobSharePlatformStyleCommandShare,
    MobSharePlatformStyleVideoShare
};

@interface MobSharePlatformStyleBaseModel : NSObject

@property (nonatomic, assign) CGFloat height;

@end

@interface MobSharePlatformStyleModel : MobSharePlatformStyleBaseModel

@property (nonatomic, assign) MobSharePlatformStyle platStyle;

@property (nonatomic, copy) NSString * name;

@property (nonatomic, copy) NSString * introduction;

@property (nonatomic, copy) NSString * image;

@property (nonatomic, copy) NSString * backgroundImage;

@property (nonatomic, copy) void  (^ handle) (MobSharePlatformStyleModel * model);

@property (nonatomic, assign) CGFloat space;

@property (nonatomic, weak) UIView * view;


+ (NSArray *)shareDisplayDataSourceHandle:(void (^)(MobSharePlatformStyleModel *model))handle;


@end

@interface MobSharePlatformStyleGroupModel : MobSharePlatformStyleBaseModel

@property (nonatomic, copy) NSArray <MobSharePlatformStyleModel *>* dataSource;

@end


NS_ASSUME_NONNULL_END
