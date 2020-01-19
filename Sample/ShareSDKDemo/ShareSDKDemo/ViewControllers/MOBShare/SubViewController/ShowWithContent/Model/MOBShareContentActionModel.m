//
//  MOBShareContentActionModel.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/13.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBShareContentActionModel.h"


@interface MOBShareContentActionModel ()

@property (nonatomic, strong) NSMutableArray <MOBShareContentActionPlatformModel *>*platformsArray;


@end

@implementation MOBShareContentActionModel

- (void)addItemModel:(MOBSharePlatformShareItemModel *)item type:(NSInteger)type{
    if (!item) return;
    if ([self.platformsArray[type] isKindOfClass:[NSString class]]) {
        [self.platformsArray replaceObjectAtIndex:type withObject:[MOBShareContentActionPlatformModel modelType:type]];
    }
    [self.platformsArray[type] addPlatformItem:item];
}


- (NSMutableArray <MOBShareContentActionPlatformModel *>*)platformsArray{
    if (!_platformsArray) {
        _platformsArray = [NSMutableArray arrayWithObjects:@"",@"",@"", nil];
    }
    return _platformsArray;
}

- (NSArray<MOBShareContentActionPlatformModel *> *)platforms{
    if (!_platforms) {
        _platforms = ({
            NSMutableArray *array = [NSMutableArray array];
            for (id obj in _platformsArray) {
                if (![obj isKindOfClass:[NSString class]]) {
                    [array addObject:obj];
                }
            }
            array;
        });
    }

    return _platforms;
}

@end
