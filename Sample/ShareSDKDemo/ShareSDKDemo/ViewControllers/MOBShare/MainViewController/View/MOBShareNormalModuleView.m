//
//  MOBShareNormalModuleView.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/13.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBShareNormalModuleView.h"

@interface MOBShareNormalModuleView ()

@property (nonatomic, strong) UILabel *text;

@property (nonatomic, strong) UIImageView *imageV;

@end

@implementation MOBShareNormalModuleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}


- (void)setup{
    self.makeChain
    .backgroundColor(UIColorHexString(@"ffffff"))
    .cornerRadius(5)
    .shadow(CGSizeMake(0,4), 4, SSDKRGBAlpha(233, 233, 233, 0.5), 1)
    .addGesture([[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handlerModel)]);
    
    UIImageViewModelCreate()
    .addToSuperView(self)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _imageV = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.centerX.equalTo(self);
        make.top.mas_offset(13 * SSDK_SCALE);
    });
    
    UILabelModelCreate()
    .addToSuperView(self)
    .font(Font(PingFangMedium, 12))
    .textColor(UIColorHexString(@"1e2937"))
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _text = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.imageV.mas_bottom).mas_offset(0);
    });
}

- (void)setData:(MobSharePlatformStyleModel *)data{
    _data = data;
    self.text.text = data.name;
    data.view = self;
    self.hidden = data == nil;
    self.imageV.image = UIImageNamed(data.image);
}


- (void)handlerModel{
    if (self.data.handle) {
        self.data.handle(self.data);
    }

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
