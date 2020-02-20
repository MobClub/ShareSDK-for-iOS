//
//  SSDKCommonViewController.m
//  mob
//
//  Created by maxl on 2018/12/20.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKCommonViewController.h"
#import "UITableView+SSDKCategory.h"
#import <objc/message.h>
@implementation SSDKCommonTableViewModel

@end

@implementation SSDKCommonCollectionViewModel

@end

@interface SSDKCommonViewController (){
    BOOL _isConformsNavigationBar;
    BOOL _isConformsTableView;
    BOOL _isConformsCollectionView;
    BOOL _isRespondsSafeAreaSel;
}

@end

static void *kSSDKCommonViewControllerTableViewModelKey = &kSSDKCommonViewControllerTableViewModelKey;
static void *kSSDKCommonViewControllerCollectionViewModelKey = &kSSDKCommonViewControllerCollectionViewModelKey;


static NSMutableSet *_ssdkCommonProtocolSwizzleSet(){
    static NSMutableSet *set = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        set = [NSMutableSet set];
        
    });
    return set;
}

static void _ssdkCommonProtocolSwizzle(id self){
    @synchronized (_ssdkCommonProtocolSwizzleSet()) {
        if ([_ssdkCommonProtocolSwizzleSet() containsObject:[self clasName]])return;
        Protocol *pT = @protocol(SSDKCommonTableViewProtocol);
        if (pT && class_conformsToProtocol([self class], pT)) {
            SEL sel = sel_registerName("tableViewModel");
            Method method = class_getInstanceMethod([self class], sel);
            if (!method || method_getImplementation(method) != _objc_msgForward) {
                class_addMethod([self class], sel, imp_implementationWithBlock(^(id objc){
                    return objc_getAssociatedObject(objc, kSSDKCommonViewControllerTableViewModelKey);
                }), "@@:");
            }
        }
        Protocol *pC = @protocol(SSDKCommonCollectionViewProtocol);
        if (pC && class_conformsToProtocol([self class], pC)) {
            SEL sel = sel_registerName("collectionViewModel");
            Method method = class_getInstanceMethod([self class], sel);
            if (!method || method_getImplementation(method) != _objc_msgForward) {
                class_addMethod([self class], sel, imp_implementationWithBlock(^(id objc){
                    return objc_getAssociatedObject(objc, kSSDKCommonViewControllerCollectionViewModelKey);
                }), "@@:");
            }
        }
        [_ssdkCommonProtocolSwizzleSet() addObject:[self clasName]];
    }
    
}
@implementation SSDKCommonViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        if ([self conformsToProtocol:@protocol(SSDKCommonNavigationProtocol)]) {
            _isConformsNavigationBar = YES;
        }
        if ([self conformsToProtocol:@protocol(SSDKCommonTableViewProtocol)]) {
            _isConformsTableView = YES;
        }
        if ([self conformsToProtocol:@protocol(SSDKCommonCollectionViewProtocol)]) {
            _isConformsCollectionView = YES;
        }
        if (_isConformsTableView || _isConformsCollectionView) {
            _ssdkCommonProtocolSwizzle(self);
        }
        if ([self respondsToSelector:@selector(viewSafeAreaInsetsChanged:)]) {
            _isRespondsSafeAreaSel = YES;
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_11_0
    self.automaticallyAdjustsScrollViewInsets = NO;
#endif
    
    self.view.backgroundColor = [UIColor whiteColor];
    if (_isConformsNavigationBar) {
        [self commonSetupNavigationView];
    }
    if (_isConformsTableView) {
        [self commonSetupTableView];
    }
    if (_isConformsCollectionView) {
        [self commonSetupCollectionView];
    }
    

    // Do any additional setup after loading the view.
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    if (_isRespondsSafeAreaSel) {
        [self viewSafeAreaInsetsChanged:SSDKSafeArea(self.view)];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)setSwipeCanPop:(BOOL)swipeCanPop{
    _swipeCanPop = swipeCanPop;
    self.navigationController.interactivePopGestureRecognizer.enabled = swipeCanPop;
}

- (void)orientationLand:(SSDKAppOrientation)orientation{
    NSString *orient = [[NSUserDefaults standardUserDefaults] objectForKey:@"supportedInterfaceOrientationsForWindow"];
    BOOL isSame = NO;
    if (orient) {
        SSDKAppOrientation onr = [orient integerValue];
        if (onr == orientation) {
            isSame = YES;
        }
    }
    if (isSame) return;
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%ld",(long)orientation] forKey:@"supportedInterfaceOrientationsForWindow"];
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val;
        switch (orientation) {
            case SSDKAppOrientationLandscape:
            {
                val = UIDeviceOrientationLandscapeLeft | UIDeviceOrientationLandscapeRight;
            }
                break;
            case SSDKAppOrientationProtrait:{
                val = UIDeviceOrientationPortrait;
                break;
            }
            case SSDKAppOrientationWithOutDown:{
                val = UIDeviceOrientationLandscapeLeft | UIDeviceOrientationLandscapeRight | UIDeviceOrientationPortrait;
                break;
            }
            case SSDKAppOrientationLeft:{
                val = UIDeviceOrientationLandscapeLeft;
                break;
            }
            default:
                break;
        }
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}


- (void)commonSetupTableView{
    id <SSDKCommonTableViewProtocol> vc = (id <SSDKCommonTableViewProtocol>) self;
    SEL sel = NSSelectorFromString(@"commonTableViewModel:");
    SSDKCommonTableViewModel *model = [SSDKCommonTableViewModel new];
    if ([self respondsToSelector:sel]) {
        [self performSelectorWithArguments:sel,model];
    }
    Class class;
    if (model.clas.length > 0) {
        class = NSClassFromString(model.clas);
    }
    if (![class isSubclassOfClass:[UITableView class]]) {
        class = [UITableView class];
    }
    objc_setAssociatedObject(self, kSSDKCommonViewControllerTableViewModelKey, model, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    UITableViewStyle style = model.style;
    
    UITableView *tableView = [class tableViewStyle:style];
    
    tableView.makeChain
    .adJustedContentIOS11()
    .dataSource(vc)
    .delegate(vc)
    .separatorStyle(UITableViewCellSeparatorStyleNone)
    .clipsToBounds(YES);
    
    vc.tableView = tableView;
    UIView *view = self.view;
    SEL sel1 = NSSelectorFromString(@"comonTableViewSuperView");
    if ([self respondsToSelector:sel1]) {
        view = [self performSelectorWithArguments:sel1];
    }
    if (model.tableView) {
        model.tableView(tableView);
    }
    if (view) {
        [view addSubview:tableView];
    }
    
    UIView *topView = nil;
    if (_isConformsNavigationBar) {
        topView = [(id <SSDKCommonNavigationProtocol>) vc navigationBar];
        [self.view bringSubviewToFront:topView];
    }
    
    if (view == self.view && !model.isCustomLayout) {
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (topView) {
                make.top.equalTo(topView.mas_bottom);
            }else{
                make.top.equalTo(self.view.mas_top).offset(kStatusBarHeight);
            }
            make.left.bottom.right.mas_offset(0);
        }];
    }
}

- (void)viewSafeAreaInsetsDidChange API_AVAILABLE(ios(11.0)){
    [super viewSafeAreaInsetsDidChange];
    UIEdgeInsets edge = SSDKSafeArea(self.view);
    CGFloat barHeight = kDefaultNavigationBarHeight;
    
    SSDKCommonNavigationBar *view = nil;
    if (_isConformsNavigationBar) {
        view = [(id<SSDKCommonNavigationProtocol>)self navigationBar];
        if (view.superview != self.view) return;
        [view resetLayout:edge];
        [view mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_offset(0);
            make.height.mas_equalTo(barHeight);
        }];
    }
    UIView *tableView;
    if (_isConformsTableView) {
        tableView = [(id<SSDKCommonTableViewProtocol>)self tableView];
        SSDKCommonTableViewModel *model = [(id<SSDKCommonTableViewProtocol>)self tableViewModel];
        if (model.isCustomLayout) return;
        if (tableView.superview != self.view) return;
        
        [tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (view) {
                make.top.equalTo(view.mas_bottom);
            }else{
                make.top.equalTo(self.view).offset(kStatusBarHeight);
            }
            make.left.mas_offset(edge.left);
            make.right.mas_offset(- edge.right);
            make.bottom.mas_offset(- edge.bottom);
        }];
    }
    UIView *collectionView;
    if (_isConformsCollectionView) {
        collectionView = [(id<SSDKCommonCollectionViewProtocol>)self collectionView];
        if (collectionView.superview != self.view) return;
        SSDKCommonCollectionViewModel *model = [(id<SSDKCommonCollectionViewProtocol>)self collectionViewModel];
        if (model.isCustomLayout) return;
        
        [collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (view) {
                make.top.equalTo(view.mas_bottom);
            }else{
                make.top.equalTo(self.view).offset(kStatusBarHeight);
            }
            make.left.mas_offset(edge.left);
            make.right.mas_offset(- edge.right);
            make.bottom.mas_offset(- edge.bottom);
        }];
    }
    
    if (_isRespondsSafeAreaSel) {
        [self viewSafeAreaInsetsChanged:edge];
    }
    if (_isRespondsSafeAreaSel||_isConformsTableView || _isConformsNavigationBar || _isConformsCollectionView) {
        [self.view layoutIfNeeded];
    }

}



- (void)commonSetupCollectionView{
    id <SSDKCommonCollectionViewProtocol> vc = (id <SSDKCommonCollectionViewProtocol>) self;
    SEL sel = NSSelectorFromString(@"commonCollectionModel:");
    SSDKCommonCollectionViewModel *model = [SSDKCommonCollectionViewModel new];
    if ([self respondsToSelector:sel]) {
        [self performSelectorWithArguments:sel,model];
    }
    UICollectionViewFlowLayout *layout = model.layout;
    if (!layout) {
        layout = [[UICollectionViewFlowLayout alloc] init];
    }
    if (model.layoutSetting) {
        model.layoutSetting(layout);
    }
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    objc_setAssociatedObject(self, kSSDKCommonViewControllerCollectionViewModelKey, model, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    collectionView.makeChain
    .delegate(vc)
    .dataSource(vc)
    .showsVerticalScrollIndicator(NO)
    .showsHorizontalScrollIndicator(NO)
    .backgroundColor([UIColor whiteColor])
    .adJustedContentIOS11();
    
    vc.collectionView = collectionView;
    SEL sel1 = NSSelectorFromString(@"commonCollectionViewSuperView");
    UIView *view = self.view;
    if ([self respondsToSelector:sel1]) {
        view = [self performSelectorWithArguments:sel1];
    }
    if (view) {
        [view addSubview:collectionView];
    }
    UIView *topView = nil;
    if (_isConformsNavigationBar) {
        topView = [(id <SSDKCommonNavigationProtocol>) vc navigationBar];
        [self.view bringSubviewToFront:topView];
    }
    if (view == self.view && !model.isCustomLayout) {
        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (topView) {
                make.top.equalTo(topView.mas_bottom);
            }else{
                make.top.equalTo(self.view).offset(kStatusBarHeight);
            }
            make.left.bottom.right.mas_offset(0);
        }];
    }
}



- (void)commonSetupNavigationView{
    SSDKCommonNavigationBar *bar = [SSDKCommonNavigationBar new];
    id <SSDKCommonNavigationProtocol> vc =  (id <SSDKCommonNavigationProtocol>)self;
    [vc setNavigationBar:bar];
    bar.delegate = vc;
    UIView * view = self.view;
    SEL superSel = NSSelectorFromString(@"commonNavigationViewSuperView");
    if ([self respondsToSelector:superSel]) {
        view = [self performSelectorWithArguments:superSel];
    }
    [view addSubview:bar];
    if (self.view == view) {
        CGFloat barHeight = kDefaultNavigationBarHeight;
        [bar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_offset(0);
            make.height.mas_equalTo(barHeight);
        }];
    }
}


- (NSString *)viewControllerName{
    return self.clasName;
}

- (NSMutableDictionary *)extraInfo{
    if (!_extraInfo) {
        _extraInfo = [NSMutableDictionary dictionary];
    }
    return _extraInfo;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
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
