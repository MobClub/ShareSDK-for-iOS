//
//  MOBShareContentActionTypeModel.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/13.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBShareContentActionPlatformModel.h"

@interface MOBShareContentActionPlatformModel ()

@property (nonatomic, strong) NSMutableArray *items;

@property (nonatomic, copy) NSString * platformName;

@end

@implementation MOBShareContentActionPlatformModel

+ (MOBShareContentActionPlatformModel *)modelType:(NSInteger)type{
    MOBShareContentActionPlatformModel *model = [MOBShareContentActionPlatformModel new];
    model.type = type;
    model.platformName = ({
        NSString *text = @"";
        switch (type) {
            case 0:
                text = @"国内平台";
                break;
            case 1:{
                text = @"海外平台";
            }
                break;
            case 2:{
                text = @"系统平台";
            }
            default:
                break;
        };
        text;
    });
    return model;
}

- (void)addPlatformItem:(MOBSharePlatformShareItemModel *)model{
    [self.items addObject:model];
}

- (NSArray<MOBSharePlatformShareItemModel *> *)dataSource{
    return self.items.copy;
}

- (NSMutableArray *)items{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

@end
