//
//  RootViewController.m
//  RESideMenuExample
//
//  Created by Roman Efimov on 6/26/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"
#import "AuthViewContriller.h"
#import "AppDelegate.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:@selector(showMenu)];
}

#pragma mark -
#pragma mark Button actions

- (void)showMenu
{
    if (!_sideMenu) {
        RESideMenuItem *homeItem = [[RESideMenuItem alloc] initWithTitle:@"主页" action:^(RESideMenu *menu, RESideMenuItem *item) {
            ViewController *viewController = [[ViewController alloc] init];
            viewController.title = item.title;
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
            [menu setRootViewController:navigationController];
        }];
        
        RESideMenuItem *exploreItem = [[RESideMenuItem alloc] initWithTitle:@"授权"
                                                                     action:^(RESideMenu *menu, RESideMenuItem *item) {
            AuthViewContriller *secondViewController = [[AuthViewContriller alloc] init];
            secondViewController.title = item.title;
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:secondViewController];
            [menu setRootViewController:navigationController];
        }];

        _sideMenu = [[RESideMenu alloc] initWithItems:@[homeItem, exploreItem]];
        _sideMenu.verticalOffset = IS_WIDESCREEN ? 110 : 76;
//        _sideMenu.hideStatusBarArea = [AppDelegate OSVersion] < 7;
    }
    
    [_sideMenu show];
}

@end
