//
//  SSDKImagePickerTableViewCell.m
//  ShareSDKDemo
//
//  Created by PP on 2020/2/19.
//  Copyright © 2020 mob. All rights reserved.
//

#import "SSDKImagePickerTableViewCell.h"
#import "SSDKCategory.h"
@interface SSDKImagePickerTableViewCell ()

@property (nonatomic, strong) NSArray <UIImageView*>*images;

@property (nonatomic, strong) NSArray <UIView *>*layers;


@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *countLabel;

@property (nonatomic, strong) UIImageView *rightArrow;

@property (nonatomic, strong) UILabel *startTime;

@property (nonatomic, strong) UILabel *endTime;

@end

@implementation SSDKImagePickerTableViewCell

- (void)setup{
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.clipsToBounds = YES;
    UIImageViewModelCreate()
    .multiple(3)
    .contentMode(UIViewContentModeScaleAspectFill)
    .clipsToBounds(YES)
    .cornerRadius(2)
    .reverse()
    .addToSuperView(self.contentView)
    .assignToObjects(^(NSArray * _Nonnull objs) {
        _images = objs;
    })
    .part_first()
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.mas_offset(20);
        make.top.mas_offset(16);
        make.height.mas_equalTo(80);
        make.width.mas_equalTo(80);
    })
    .part_sencond()
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(_images[0]).offset(2);
        make.top.equalTo(_images[0]).offset(-3);
        make.height.mas_equalTo(80);
        make.right.equalTo(_images[0]).offset(-2);
    })
    .part_third()
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(_images[1]).offset(2);
        make.top.equalTo(_images[1]).offset(-3);
        make.height.mas_equalTo(80);
        make.right.equalTo(_images[1]).offset(-2);
    });
    
    UIViewModelCreate()
    .multiple(3)
    .backgroundColor(UIColor.whiteColor)
    .cornerRadius(2)
    .shadow(CGSizeMake(1, 1), 2, UIColorHexString(@"000000"), 0.15)
    .addToSuperView(self.contentView)
    .assignToObjects(^(NSArray * _Nonnull objs) {
        _layers = objs;
    });
    
    for (int i = 0; i < _layers.count; i++) {
        UIView *view = _layers[i];
        [self.contentView.layer insertSublayer:view.layer below:_images[i].layer];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_images[i]);
        }];
    }
    
    UILabelModelCreate()
    .multiple(4)
    .addToSuperView(self.contentView)
    .assignToObjects(^(NSArray * _Nonnull objs) {
        _nameLabel = objs[0];
        _countLabel = objs[1];
        _startTime = objs[2];
        _endTime = objs[3];
    })
    .part_first()
    .font(Font(PingFangSemibold, 17))
    .textColor(UIColor.darkTextColor)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo([_images firstObject].mas_right).offset(10);
        make.top.equalTo([_images firstObject]).offset(-2);
    })
    .part_sencond()
    .font(Font(PingFangReguler, 12))
    .textColor(UIColor.darkTextColor)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(self.nameLabel);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(5);
    })
    .part_range(NSMakeRange(2, 2))
    .font(Font(PingFangLight, 10))
    .textColor(UIColor.grayColor)
    .part_third()
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(self.countLabel);
        make.top.equalTo(self.countLabel.mas_bottom).offset(5);
    })
    .part_fourth()
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(self.startTime);
        make.top.equalTo(self.startTime.mas_bottom).offset(5);
    });
    
    UIViewModelCreate()
    .addToSuperView(self.contentView)
    .backgroundColor(UIColorHexString(@"dbdbdb"))
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.bottom.equalTo(self.contentView);
        make.width.equalTo(self);
        make.height.mas_equalTo(0.5);
    });
}



- (void)setModel:(SSDKImagePickerModel *)model{
    _model = model;
    self.nameLabel.text = model.title;
    self.startTime.text = model.endDate?[NSString stringWithFormat:@"创建时间:%@",model.createDate]:@"";
    self.endTime.text = model.endDate?[NSString stringWithFormat:@"最近更新时间:%@",model.endDate]:@"";
    self.countLabel.text = [NSString stringWithFormat:@"照片数量:%lu 已选数量:%lu",(unsigned long)model.count, (unsigned long)model.selectedCount];
    __weak typeof(self)weakSelf = self;
    [model getImagesCount:3 size:CGSizeMake(80, 80) complete:^(NSArray<UIImage *> * _Nonnull images, SSDKImagePickerModel * _Nonnull sourceMoel) {
        if (weakSelf.model == sourceMoel) {
            NSInteger count = images.count;
            for (int i = 0; i < 3; i++) {
                weakSelf.images[i].hidden = i >= count;
                weakSelf.layers[i].hidden = i >= count;
                if (i < count) {
                    weakSelf.images[i].image = images[i];
                }
            }
        }
    }];

    model.chooseChangeBlock = ^(SSDKImagePickerModel * _Nonnull sourceModel) {
        weakSelf.countLabel.text = [NSString stringWithFormat:@"照片数量:%lu 已选数量:%lu",(unsigned long)sourceModel.count, (unsigned long)sourceModel.selectedCount];
    };
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
