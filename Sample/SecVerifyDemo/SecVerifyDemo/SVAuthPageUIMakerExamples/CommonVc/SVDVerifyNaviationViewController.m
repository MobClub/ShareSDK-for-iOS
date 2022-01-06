//
//  SVDVerifyNaviationViewController.m
//  SecVerifyDemo
//
//  Created by yoozoo on 2019/9/2.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SVDVerifyNaviationViewController.h"

@interface SVDVerifyNaviationViewController ()

@end

@implementation SVDVerifyNaviationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//支持旋转
-(BOOL)shouldAutorotate{
    return NO;
}

//支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
//    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
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
