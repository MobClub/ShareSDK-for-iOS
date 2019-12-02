//
//  MOBAboutMobLinkViewController.m
//  ShareSDKDemo
//
//  Created by wkx on 2019/6/20.
//  Copyright © 2019年 mob. All rights reserved.
//

#import "MOBAboutMobLinkViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKExtension/ShareSDK+Extension.h>


@interface MOBArrowCell : UITableViewCell

@property (nonatomic, copy, readonly) MOBArrowCell * (^ model)(NSString * model);

@property (nonatomic, copy, readonly) MOBArrowCell * (^ isLast)(BOOL isLast);

@property (nonatomic, strong) UILabel * label;

@property (nonatomic, strong) UIView *line;

@end

@implementation MOBArrowCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)layoutSubviews{
    CGRect frame = self.contentView.bounds;
    frame.size.width -= 20;
    frame.origin.x += 10;
    frame.origin.y = frame.size.height - 0.5;
    frame.size.height = 0.5;
    self.line.frame = frame;
    frame = self.contentView.bounds;
    frame.size.width -= 20;
    frame.origin.x += 10;
    frame.size.height -= 1;
    self.label.frame = frame;
}

- (MOBArrowCell *(^)(NSString *))model{
    return ^ (NSString * model){
        self.label.text = model;
        return self;
    };
}

- (MOBArrowCell *(^)(BOOL))isLast{
    return ^ (BOOL isLast){
        self.line.hidden = isLast;
        return self;
    };
}

- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:14];
        _label.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_label];
        
    }
    return _label;
}

- (UIView *)line{
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_line];
    }
    return _line;
}

@end
@interface MOBArrowView : UIView<UITableViewDataSource,UITableViewDelegate>
{
    CGFloat _arrowHeight,
    _arrowWidth,
    _arrowRight,
    _dataHeight,
    _colorRadius,
    _rowHeight;
}
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, copy) void (^ clickRow)(NSInteger index, id data);
@property (nonatomic, strong) CAShapeLayer *shapLayer;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, strong) UIColor * color;

@end

@implementation MOBArrowView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    self.backgroundColor = [UIColor clearColor];
    _arrowWidth = 15;
    _arrowRight = 12;
    _arrowHeight = 10;
    _colorRadius = 4;
    _rowHeight = 44;
    _color = [UIColor whiteColor];
    [self shapLayer];
    [self tableView];
}

- (void)drawRect:(CGRect)rect{
    //    [super drawRect:rect];
    self.shapLayer.bounds = CGRectMake(0, 0, rect.size.width, rect.size.height);
    CGFloat width = rect.size.width;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(width - _arrowWidth - _arrowRight, _arrowHeight)];
    [path addLineToPoint:CGPointMake(width - _arrowWidth/2 - _arrowRight, 0)];
    [path addLineToPoint:CGPointMake(width - _arrowRight, _arrowHeight)];
    CGColorRef color = (self.color?:[UIColor whiteColor]).CGColor;
    if (color != self.shapLayer.fillColor) {
        self.shapLayer.fillColor = color;
        self.tableView.backgroundColor = [UIColor colorWithCGColor:color];
    }
    self.shapLayer.path = path.CGPath;
    CGRect tableViewRect = self.tableView.frame;
    tableViewRect.size.width = rect.size.width;
    tableViewRect.origin.x = 0;
    tableViewRect.origin.y = _arrowHeight;
    self.tableView.frame = tableViewRect;
    self.tableView.layer.cornerRadius = _colorRadius;
    self.shapLayer.backgroundColor = self.backgroundColor.CGColor;
}

- (void)setDataSource:(NSArray *)dataSource{
    _dataSource = dataSource;
    _dataHeight = dataSource.count * _rowHeight;
    CGRect viewRect = self.frame;
    CGRect tableViewRect = self.tableView.frame;
    viewRect.size.height = _dataHeight + _arrowHeight;
    tableViewRect.size.height = _dataHeight;
    self.frame = viewRect;
    self.tableView.frame = tableViewRect;
    [self.tableView reloadData];
}

- (void)dependFrame:(CGRect)frame{
    CGFloat pointCenter = frame.origin.x + frame.size.width/2;
    CGFloat leftO = self.frame.size.width - _arrowWidth/2 - _arrowRight;
    CGRect finalFrame = self.frame;
    finalFrame.origin.x = pointCenter - leftO;
    finalFrame.origin.y = frame.origin.y + 5 + frame.size.height;
    self.frame = finalFrame;
}

- (CAShapeLayer *)shapLayer{
    if (!_shapLayer) {
        _shapLayer = [CAShapeLayer layer];
        _shapLayer.anchorPoint = CGPointMake(0, 0);
        _shapLayer.position = CGPointMake(0, 0);
        [self.layer addSublayer:_shapLayer];
    }
    return _shapLayer;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[MOBArrowCell class] forCellReuseIdentifier:@"MOBArrowCell"];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.bounces = NO;
        [self addSubview:_tableView];
    }
    return _tableView;
}



#pragma mark - UITableViewDataSource、UITableViewDelegate -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ((MOBArrowCell *)[tableView dequeueReusableCellWithIdentifier:@"MOBArrowCell" forIndexPath:indexPath]).model(self.dataSource[indexPath.row]).isLast(self.dataSource.count == indexPath.row + 1);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _rowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.clickRow) {
        self.clickRow(indexPath.row, self.dataSource[indexPath.row]);
    }
    
}

@end

@interface MOBAboutMobLinkViewController ()<UIScrollViewDelegate>

@property(nonatomic, strong) SSERestoreScene *scene;

@property (nonatomic, strong) MOBArrowView * arrowView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation MOBAboutMobLinkViewController

- (instancetype) initWithShareSDKScene:(SSERestoreScene *)scene
{
    if (self = [super init])
    {
        self.scene = scene;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"闭环分享";
    self.scrollView.delegate = self;
    [self.scrollView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(shareHidden)]];
    [self navBarSetup];
}

- (void)dealloc
{
    
}
- (void)navBarSetup
{
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 22, 44)];
    [rightBtn setImage:[UIImage imageNamed:@"linkcard_share"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(shareOnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}



- (MOBArrowView *)arrowView{
    if (!_arrowView) {
        _arrowView = [[MOBArrowView alloc] initWithFrame:CGRectMake(0, 0, 130, 0)];
        [self.view addSubview:_arrowView];
        __weak typeof(self)weakSelf = self;
        _arrowView.clickRow = ^(NSInteger index, id data) {
            [weakSelf shareArrowIndex:index];
            weakSelf.arrowView.hidden = YES;
        };
        _arrowView.hidden = YES;
        _arrowView.dataSource = @[@"分享带参数",@"分享不带参数"];
        _arrowView.color = [UIColor lightGrayColor];
    }
    return _arrowView;
}


- (void)shareOnClick:(UIButton *)btn
{
    if (self.arrowView.isHidden == NO) {
        self.arrowView.hidden = YES;
    }else{
        CGRect frame = [btn.superview convertRect:btn.frame toView:self.view.window];
        [self.arrowView dependFrame:frame];
        self.arrowView.hidden = NO;
    }
}

- (void)shareArrowIndex:(NSInteger)index{
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    NSArray* imageArray = @[[[NSBundle mainBundle] pathForResource:@"moblink_ext" ofType:@"jpg"]];
    if (index == 0) {
        [shareParams SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                         images:imageArray//SHARESDKDEMO_IMAGE_LOCALPATH
                                            url:[NSURL URLWithString:@"http://m.93lj.com/sharelink"]
                                          title:@"Share SDK"
                                  linkParameter:@{@"key_a":@"value_a"}];
    }else{
        [shareParams SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                         images:imageArray//SHARESDKDEMO_IMAGE_LOCALPATH
                                            url:[NSURL URLWithString:@"http://m.93lj.com/sharelink"]
                                          title:@"Share SDK"
                                  linkParameter:nil];
        //                //或
        //                [shareParams SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
        //                                                 images:imageArray
        //                                                    url:[NSURL URLWithString:@"http://m.93lj.com/sharelink"]
        //                                                  title:@"ShareSDK助你一键实现闭环分享"
        //                                                   type:SSDKContentTypeWebPage];
    }
    
    
    
    
    [ShareSDK share:SSDKPlatformSubTypeQQFriend parameters:shareParams onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        switch (state) {
                
            case SSDKResponseStateBegin:
            {
                break;
            }
            case SSDKResponseStateSuccess:
            {
                
                UIAlertControllerAlertCreate(@"分享成功", nil)
                .addCancelAction(@"确定", 0)
                .showFromViewController(self);
                break;
            }
            case SSDKResponseStateFail:
            {
                NSLog(@"%@",error);
                
                UIAlertControllerAlertCreate(@"分享失败", [NSString stringWithFormat:@"%@",error])
                .addCancelAction(@"OK", 0)
                .showFromViewController(self);
                break;
            }
            case SSDKResponseStateCancel:
            {
                
                UIAlertControllerAlertCreate(@"分享已取消", nil)
                .addCancelAction(@"确定", 0)
                .showFromViewController(self);
                break;
            }
            default:
                break;
        }
    }];
}

- (void)shareHidden{
    if (self.arrowView.isHidden==NO) {
        self.arrowView.hidden = YES;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self shareHidden];
}

@end
