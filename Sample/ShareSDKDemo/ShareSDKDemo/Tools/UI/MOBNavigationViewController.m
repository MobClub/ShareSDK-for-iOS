//
//  MOBCommonViewController.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/15.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBNavigationViewController.h"

@interface MOBNavigationViewController ()

@end

@implementation MOBNavigationViewController

@synthesize navigationBar = _navigationBar;

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationBar.middleButton.makeChain
    .text(self.title, UIControlStateNormal)
    .font(Font(PingFangMedium, 17))
    .textColor(UIColorHexString(@"464646"), UIControlStateNormal);
    
    self.navigationBar.leftButton.makeChain
    .image(UIImageNamed(@"nav_icon_back"), UIControlStateNormal)
    .textColor(UIColorHexString(@"464646"), UIControlStateNormal);
    // Do any additional setup after loading the view.
}

- (void)leftButtonTap:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
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
