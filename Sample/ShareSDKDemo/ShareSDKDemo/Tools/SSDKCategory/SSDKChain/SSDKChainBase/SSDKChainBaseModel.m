//
//  SSDKChainBaseModel.m
//  ShareSDKDemo
//
//  Created by maxl on 2020/1/16.
//  Copyright © 2020 mob. All rights reserved.
//

#import "SSDKChainBaseModel.h"
#import "SSDKChainBaseModel+SSDKPrivate.h"

@interface SSDKChainBaseModel ()
{
    Class _modelClass;
}
@property (nonatomic, strong) NSMutableArray * allOjects;

@property (nonatomic, strong) NSMutableArray * effectiveObjects;

@end

@implementation SSDKChainBaseModel

- (instancetype)initWithModelObject:(id)object modelClass:(Class)modelClass{
    if (self = [super init]) {
        _modelClass = modelClass;
        [self.allOjects addObject:object];
        self.part_first();
    }
    return self;
}

- (instancetype)initWithModelObjects:(NSArray *)objects modelClass:(Class)modelClass{
    if (self = [super init]) {
        _modelClass = modelClass;
        [objects enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:_modelClass]) {
                [self.allOjects addObject:obj];
            }
        }];
        self.part_all();
    }
    return self;
}


- (id  _Nonnull (^)(NSInteger))multiple{
    return  ^ (NSInteger count){
        NSInteger addCount = count - self.allOjects.count;
        while (addCount > 0) {
            [self.allOjects addObject: [[_modelClass alloc] init]];
            addCount --;
        }
        self.part_all();
        return self;
    };
}

- (id  _Nonnull (^)(void))part_first{
    return ^{
        [self effiveChangeObjectForRange:NSMakeRange(0, 1)];
        return self;
    };
}

- (id  _Nonnull (^)(void))part_sencond{
    return ^{
        [self effiveChangeObjectForRange:NSMakeRange(1, 1)];
        return self;
    };
}

- (id  _Nonnull (^)(void))part_third{
    return ^{
        [self effiveChangeObjectForRange:NSMakeRange(2, 1)];
        return self;
    };
}

- (id  _Nonnull (^)(void))part_fourth{
    return ^{
        [self effiveChangeObjectForRange:NSMakeRange(3, 1)];
        return self;
    };
}

- (id  _Nonnull (^)(void))part_fifth{
    return ^{
        [self effiveChangeObjectForRange:NSMakeRange(4, 1)];
        return self;
    };
}

- (id  _Nonnull (^)(void))part_sixth{
    return ^{
        [self effiveChangeObjectForRange:NSMakeRange(5, 1)];
        return self;
    };
}

- (id  _Nonnull (^)(void))part_seventh{
    return ^{
        [self effiveChangeObjectForRange:NSMakeRange(6, 1)];
        return self;
    };
}

- (id  _Nonnull (^)(void))part_eighth{
    return ^{
        [self effiveChangeObjectForRange:NSMakeRange(7, 1)];
        return self;
    };
}

- (id  _Nonnull (^)(void))part_ninth{
    return ^{
        [self effiveChangeObjectForRange:NSMakeRange(8, 1)];
        return self;
    };
}

- (id  _Nonnull (^)(void))part_tenth{
    return ^{
        [self effiveChangeObjectForRange:NSMakeRange(9, 1)];
        return self;
    };
}

- (id  _Nonnull (^)(void))part_all{
    return ^{
        [self.effectiveObjects removeAllObjects];
        [self.effectiveObjects addObjectsFromArray:self.allOjects];
        return self;
    };
}

- (id  _Nonnull (^)(NSRange))part_range{
    return ^(NSRange range){
        [self effiveChangeObjectForRange:range];
        return self;
    };
}

- (id  _Nonnull (^)(NSUInteger))part_sequence{
    return ^ (NSUInteger index){
        [self effiveChangeObjectForRange:NSMakeRange(index, 1)];
        return self;
    };
}

- (id  _Nonnull (^)(void (^ _Nonnull)(NSArray * _Nonnull)))assignToObjects{
    return ^ (void (^array) (NSArray *)){
        array(self.allOjects.copy);
        return self;
    };
}

- (void)effiveChangeObjectForRange:(NSRange)range{
    [self.effectiveObjects removeAllObjects];
    
    NSUInteger count = self.allOjects.count;
    NSUInteger needCount = range.location + range.length;
    needCount = (needCount < count)? needCount : count;
    for (NSUInteger i = range.location; i < needCount; i++) {
        [self.effectiveObjects addObject:self.allOjects[i]];
    }
}

- (NSMutableArray *)allOjects{
    if (!_allOjects) {
        _allOjects = [NSMutableArray array];
        
    }
    return _allOjects;
}

- (NSMutableArray *)effectiveObjects{
    if (!_effectiveObjects) {
        _effectiveObjects = [NSMutableArray array];
    }
    return _effectiveObjects;
}


- (void)enumerateObjectsUsingBlock:(void (^)(id _Nonnull))block{
    [self.effectiveObjects enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        block(obj);
    }];
    block = nil;
}

@end
