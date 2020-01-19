//
//  MOBShareTableViewHeaderFooterView.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/20.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBShareTableViewHeaderFooterView.h"

@interface MOBShareTableViewHeaderFooterView ()

@property (nonatomic, strong) UILabel *name;

@end
@implementation MOBShareTableViewHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UILabelModelCreate()
    .textColor(UIColorHexString(@"000000"))
    .font(Font(PingFangMedium, 14))
    .addToSuperView(self.contentView)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _name = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.mas_offset(15);
        make.centerY.equalTo(self.contentView);
    });
}

- (void)setType:(NSInteger)type{
    _type = type;
    _name.text =  ({
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
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
