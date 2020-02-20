//
//  SSDKCommonViewController.h
//  mob
//
//  Created by maxl on 2018/12/20.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKCommonNavigationBar.h"
NS_ASSUME_NONNULL_BEGIN
//------------------tableView
@interface SSDKCommonTableViewModel : NSObject
//tableView的类
@property (nonatomic, copy) NSString *  clas;
//tableView的样式
@property (nonatomic, assign) UITableViewStyle  style;
//是否自定义布局
@property (nonatomic, assign) BOOL  isCustomLayout;
//详细设置tableView属性
@property (nonatomic, copy) void (^tableView) (UITableView *tableView);
@end

//协议
@protocol SSDKCommonTableViewProtocol <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@optional
//此方法不需要实现，可直接调用
-  (SSDKCommonTableViewModel *)tableViewModel;

//设置父视图
- (UIView *)comonTableViewSuperView;
//设置一些属性
- (void)commonTableViewModel:(SSDKCommonTableViewModel *)model;

@end


//------------------collectionView

@interface SSDKCommonCollectionViewModel : NSObject

@property (nonatomic, strong) UICollectionViewFlowLayout * layout;

@property (nonatomic, copy) void (^layoutSetting) (UICollectionViewFlowLayout *layout);

//是否自定义布局
@property (nonatomic, assign) BOOL  isCustomLayout;

@end

@protocol SSDKCommonCollectionViewProtocol <UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView * collectionView;

@optional

//此方法不需要实现，可直接调用
- (SSDKCommonCollectionViewModel *)collectionViewModel;

- (UIView *)commonCollectionViewSuperView;

- (void)commonCollectionModel:(SSDKCommonCollectionViewModel *)model;

@end

@protocol SSDKCommonNavigationProtocol <SSDKCommonNavigationBarDelegate>

@property (nonatomic, strong) SSDKCommonNavigationBar * navigationBar;

@optional

- (UIView *)commonNavigationViewSuperView;

@end


typedef NS_ENUM(NSInteger, SSDKAppOrientation) {
    SSDKAppOrientationProtrait = 0,//竖向
    SSDKAppOrientationLeft = 1,
    SSDKAppOrientationWithOutDown = 2 ,//不向下
    SSDKAppOrientationLandscape = 3//横向
};


@protocol SSDKCommonViewControllerProtocol <NSObject>


@optional

//安全区域变化
- (void)viewSafeAreaInsetsChanged:(UIEdgeInsets)edges;

@end
#pragma mark - 基础控制器 -

@interface SSDKCommonViewController : UIViewController <SSDKCommonViewControllerProtocol>

/**
 是否可以左滑
 */
@property (nonatomic, assign) BOOL swipeCanPop;

/**
 方向
 */
- (void)orientationLand:(SSDKAppOrientation)orientation;

/**
 额外的信息
 */
@property (nonatomic, strong) NSMutableDictionary * extraInfo;

@end

NS_ASSUME_NONNULL_END
