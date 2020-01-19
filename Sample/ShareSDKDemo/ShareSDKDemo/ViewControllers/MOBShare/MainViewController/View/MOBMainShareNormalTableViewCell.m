//
//  MOBMainShareNormalTableViewCell.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/11.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBMainShareNormalTableViewCell.h"
#import "MOBShareNormalModuleView.h"

@interface MOBMainShareNormalTableViewCell ()

@property (nonatomic, strong) NSMutableArray *views;

@property (nonatomic, assign) NSInteger showCount;


@end

@implementation MOBMainShareNormalTableViewCell

- (void)setup{
    self.backgroundColor = UIColorHexString(@"F7F8F9");
    self.contentView.layer.masksToBounds = NO;
    self.contentView.clipsToBounds = NO;
    self.contentView.backgroundColor = UIColorHexString(@"F7F8F9");
}

- (void)setData:(MobSharePlatformStyleGroupModel *)data{
    _data = data;
    [self resetSubViews];
}

- (void)setFrame:(CGRect)frame{
    frame.size.width -= 30;
    frame.origin.x += 15;
    [super setFrame:frame];
}

- (void)resetSubViews{
    
    NSInteger dataCount = _data.dataSource.count;
    NSInteger viewsCount = _views.count;
    NSInteger leastCount = dataCount - viewsCount;//是否需要增加view
    if (leastCount > 0) {
        for (NSInteger i = 0; i < leastCount; i++) {
            @autoreleasepool {
                MOBShareNormalModuleView *view = [MOBShareNormalModuleView new];
                NSInteger index = viewsCount + i;
                MobSharePlatformStyleModel *model = _data.dataSource[index];
                view.data = model;
                [self.contentView addSubview:view];
                [self.views addObject:view];
                NSInteger positionXTag = index % 2;
                NSInteger positionYTag = index / 2;
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    if (positionXTag == 0) {
                        make.left.equalTo(self.contentView);
                        make.right.equalTo(self.contentView.mas_centerX).offset(-7.5);
                    }else{
                        make.left.equalTo(self.contentView.mas_centerX).offset(7.5);
                        make.right.equalTo(self.contentView);
                    }
                    make.top.equalTo(self.contentView).offset(positionYTag * (model.height + model.space) + model.space);
                    make.height.mas_equalTo(model.height);
                }];
            }
        }
    }
    for (NSInteger i = 0; i < dataCount; i++) {
        MOBShareNormalModuleView *view = _views[i];
        view.data = _data.dataSource[i];
        view.hidden = NO;
    }
    for (NSInteger i = dataCount; i < _showCount; i++) {
        MOBShareNormalModuleView *view = _views[i];
        view.data = nil;
    }
    _showCount = dataCount;
}


- (NSMutableArray *)views{
    if (!_views) {
        _views = [NSMutableArray array];
    }
    return _views;
}

@end
