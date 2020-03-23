//
//  MOBTabBarController.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/11/22.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBTabBarController.h"
#import <objc/runtime.h>

@interface MOBTabBarItem : NSObject

@property (nonatomic, copy) NSString * image;

@property (nonatomic, copy) NSString * selectedImage;

@property (nonatomic, copy) NSString * title;

@property (nonatomic, copy) NSString * selectedTitle;

@property (nonatomic, strong) UIColor * color;

@property (nonatomic, strong) UIColor * selectedColor;

@property (nonatomic, copy) NSString * className;

@property (nonatomic, assign) NSInteger index;

@property (nonatomic, weak) UIViewController * itemViewController;

@property (nonatomic, assign) BOOL needChangeTitle;

@end

@implementation MOBTabBarItem

+ (instancetype)image:(NSString *)image
        selectedImage:(NSString *)selectedImage
                title:(NSString *)title
        selectedTitle:(NSString *)selectedTitle
                color:(UIColor *)color
        selectedColor:(UIColor *)selectedColor
            className:(NSString *)className{
    MOBTabBarItem *item = [MOBTabBarItem new];
    item.image = image;
    item.selectedImage = selectedImage;
    item.title = title;
    item.selectedTitle = selectedTitle;
    item.color = color;
    item.selectedColor = selectedColor;
    item.className = className;
    item.needChangeTitle = item.title && item.selectedTitle && ![item.title isEqualToString:item.selectedTitle];
    return item;
}



@end

static void * kMobTabbarItemKey = &kMobTabbarItemKey;

@interface MOBTabBarController ()<UITabBarControllerDelegate>{
    NSInteger _lastSelectedIndex;
}

@property (nonatomic, strong) NSArray * items;

@end

@implementation MOBTabBarController

- (void)viewDidLoad {
    _lastSelectedIndex = -1;
    [super viewDidLoad];
    [self  setupUI];
    self.tabBar.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}


- (void)setupUI{
    self.tabBar.backgroundColor = [UIColor whiteColor];
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < self.items.count; i++) {
        MOBTabBarItem *item = self.items[i];
        [array addObject:[self createTabBarItemWithMobTabBarItem:item]];
        item.index = i;
    }
    self.viewControllers = array.copy;
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex{
    if (_lastSelectedIndex == -1) {
        [self willSelectedIndex:selectedIndex];
    }
    [super setSelectedIndex:selectedIndex];
}


- (void)willSelectedIndex:(NSInteger)selectedIndex{
    if (_lastSelectedIndex != selectedIndex) {
        NSArray * items = self.tabBar.items;
        if (_lastSelectedIndex != -1) {
            UITabBarItem *unSelectedItem = items[_lastSelectedIndex];
            MOBTabBarItem *item =  objc_getAssociatedObject(unSelectedItem, kMobTabbarItemKey);
            if (item.needChangeTitle) {
                unSelectedItem.title = item.title;
            }
        }
        UITabBarItem *selectedItem = items[selectedIndex];
        MOBTabBarItem *seletItems =  objc_getAssociatedObject(selectedItem, kMobTabbarItemKey);
        if (seletItems.needChangeTitle) {
            selectedItem.title = seletItems.selectedTitle;
        }
        self.tabBar.tintColor = seletItems.selectedColor;
        _lastSelectedIndex = selectedIndex;
    }
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    [self willSelectedIndex:[tabBar.items indexOfObject:item]];
}

- (UIViewController *)createTabBarItemWithMobTabBarItem:(MOBTabBarItem *)item{
    UITabBarItem *tabbarItem = [[UITabBarItem alloc] initWithTitle:item.title?:item.selectedTitle image:[UIImageNamed(item.image) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[UIImageNamed(item.selectedImage) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    objc_setAssociatedObject(tabbarItem, kMobTabbarItemKey, item, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    UINavigationController *viewController = [[UINavigationController alloc] initWithRootViewController:[NSClassFromString(item.className) new]];
    viewController.navigationBar.hidden = YES;
    viewController.viewControllers.firstObject.hidesBottomBarWhenPushed = NO;
    viewController.tabBarItem = tabbarItem;
    item.itemViewController = viewController;
    return viewController;
}


- (NSArray *)items{
    if (!_items) {
        _items = @[
            [MOBTabBarItem image:@"tab_icon_share_nor" selectedImage:@"tab_icon_share_sel" title:@"分享" selectedTitle:nil color:UIColorHexString(@"000000") selectedColor:UIColorHexString(@"FF7800") className:@"ViewController"],
            [MOBTabBarItem image:@"tab_icon_login_nor" selectedImage:@"tab_icon_login_sel" title:@"授权" selectedTitle:nil color:UIColorHexString(@"000000") selectedColor:UIColorHexString(@"FF7800") className:@"MOBAuthViewController"]
        ];
    }
    return _items;
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
