//
//  MobSharePlatformStyleModel.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/11.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MobSharePlatformStyleModel.h"

@implementation MobSharePlatformStyleBaseModel

@end

@implementation MobSharePlatformStyleModel

- (MobSharePlatformStyleModel *(^)(id))configureHandle{
    return ^(id handle){
        self.handle = handle;
        return self;
    };
}

+ (instancetype)modelWithStyle:(MobSharePlatformStyle)style name:(NSString *)name inroduction:(NSString *)introduction image:(NSString *)image backgroundImage:(NSString *)backgroundImage{
    MobSharePlatformStyleModel *model = [MobSharePlatformStyleModel new];
    model.name = name;
    model.platStyle = style;
    model.introduction = introduction;
    model.image = image;
    model.backgroundImage = backgroundImage;
    model.height = 83 * SSDK_SCALE;
    model.space = 10;
    return model;
}

+ (NSArray *)shareDisplayDataSourceHandle:(void (^)(MobSharePlatformStyleModel * _Nonnull))handle{
    NSMutableArray *dataSource = [NSMutableArray array];
    [dataSource addObject:[MobSharePlatformStyleModel shareContent].configureHandle(handle)];
    [dataSource addObject:[MobSharePlatformStyleModel platform].configureHandle(handle)];
    
    MobSharePlatformStyleGroupModel *model = [MobSharePlatformStyleGroupModel new];
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:[MobSharePlatformStyleModel shareMenu].configureHandle(handle)];
    [array addObject:[MobSharePlatformStyleModel shareShot].configureHandle(handle)];
    [array addObject:[MobSharePlatformStyleModel shareShake].configureHandle(handle)];
    [array addObject:[MobSharePlatformStyleModel shareLinkCard].configureHandle(handle)];
    
    model.dataSource = array.copy;
    [dataSource addObject:model];
    return dataSource;
}

+ (instancetype)shareContent{
    return [MobSharePlatformStyleModel modelWithStyle:MobSharePlatformStyleContent name:@"按内容分享演示" inroduction:@"支持文字、单图等多种内容格式" image:@"share_icon_content" backgroundImage:@"home_share_bg_1"];
}

+ (instancetype)platform{
    return [MobSharePlatformStyleModel modelWithStyle:MobSharePlatformStylePlatform name:@"按平台分享演示" inroduction:@"支持多种平台" image:@"share_icon_platform" backgroundImage:@"home_share_bg_2"];
}
+ (instancetype)shareMenu{
    return [MobSharePlatformStyleModel modelWithStyle:MobSharePlatformStylePopShare name:@"弹出分享菜单" inroduction:@"" image:@"icon_pop" backgroundImage:@""];
}
+ (instancetype)shareShot{
    return [MobSharePlatformStyleModel modelWithStyle:MobSharePlatformStyleShotShare name:@"截图分享" inroduction:@"" image:@"Rectangle" backgroundImage:@""];
}
+ (instancetype)shareShake{
    return [MobSharePlatformStyleModel modelWithStyle:MobSharePlatformStyleShakeShare name:@"摇一摇分享" inroduction:@"" image:@"icon_shake" backgroundImage:@""];
}
+ (instancetype)shareLinkCard{
    return [MobSharePlatformStyleModel modelWithStyle:MobSharePlatformStyleLinkCardShare name:@"新浪LinkCard分享" inroduction:@"" image:@"icon_sina" backgroundImage:@""];
}

@end

@implementation MobSharePlatformStyleGroupModel


- (void)setDataSource:(NSArray<MobSharePlatformStyleModel *> *)dataSource{
    _dataSource = dataSource;
    MobSharePlatformStyleModel *model = [dataSource firstObject];
    self.height = (_dataSource.count + 1) / 2 *(model.height + model.space) - model.space + 15;
    
}
@end
