//
//  MOBShareContentCollectionHeaderReusableView.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/27.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBShareContentCollectionHeaderReusableView.h"

@interface MOBShareContentCollectionHeaderReusableView ()

@property (nonatomic, strong) UILabel *name;

@end
@implementation MOBShareContentCollectionHeaderReusableView

- (void)setup{
    
    self.backgroundColor = [UIColor whiteColor];
    
    UILabelModelCreate()
    .textColor(UIColorHexString(@"000000"))
    .font(Font(PingFangMedium, 14))
    .addToSuperView(self)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _name = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.mas_offset(15);
        make.centerY.equalTo(self);
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
@end
