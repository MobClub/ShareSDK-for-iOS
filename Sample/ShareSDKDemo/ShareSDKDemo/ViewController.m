//
//  ViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/6.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "ViewController.h"
#import <ShareSDK/ShareSDK+Base.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>
#import <ShareSDK/NSMutableDictionary+SSDKShare.h>
#import <MOBFoundation/MOBFoundation.h>

#import "MobShareViewController.h"
#import "MobAuthViewController.h"
#import "MobUserInfoViewController.h"

@interface ViewController ()
{
    IBOutlet UIView *topView;
    IBOutlet UIButton *shareButton;
    IBOutlet UIButton *authButton;
    IBOutlet UIButton *userInfoButton;
    NSArray *buttonArray;
    CALayer *lineLayer;
    
    NSInteger selectedIndex;
    IBOutlet UICollectionView *myCollectionView;
    
    MobShareViewController *shareViewController;
    MobAuthViewController *authViewController;
    MobUserInfoViewController *userInfoViewController;
    NSArray *viewControllerArray;
    BOOL isFirst;
}

@end

@implementation ViewController

static NSString * const cellReuseIdentifier = @"cellReuseIdentifier";

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    buttonArray = @[shareButton,authButton,userInfoButton];
    [myCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellReuseIdentifier];
    shareViewController = [[MobShareViewController alloc] initWithNibName:@"MobShareViewController" bundle:nil];
    authViewController = [[MobAuthViewController alloc] initWithNibName:@"MobAuthViewController" bundle:nil];
    userInfoViewController = [[MobUserInfoViewController alloc] initWithNibName:@"MobUserInfoViewController" bundle:nil];
    viewControllerArray = @[shareViewController,authViewController,userInfoViewController];
    isFirst = YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if(isFirst)
    {
        isFirst = NO;
        [self showLineWithButton:shareButton];
        shareViewController.view.frame = myCollectionView.bounds;
        authViewController.view.frame = myCollectionView.bounds;
        userInfoViewController.view.frame = myCollectionView.bounds;
    }
}

- (void)showLineWithButton:(UIButton *)button
{
    selectedIndex = button.tag;
    if(lineLayer == nil)
    {
        lineLayer = [[CALayer alloc] init];
        lineLayer.backgroundColor = [MOBFColor colorWithRGB:0xff6800].CGColor;
        [topView.layer addSublayer:lineLayer];
    }
    CGFloat width = button.titleLabel.text.length * button.titleLabel.font.pointSize;
    CGFloat y = CGRectGetHeight(topView.frame)-2;
    CGFloat x = 0;
    switch (button.tag) {
        case 0:
            x = CGRectGetWidth(button.frame) - width;
            break;
        case 1:
            x = CGRectGetMinX(button.frame) + (CGRectGetWidth(button.frame) - width)/2;
            break;
        default:
            x = CGRectGetMinX(button.frame);
            break;
    }
    lineLayer.frame = CGRectMake(x, y, width, 2);
    
}

- (IBAction)buttonAct:(UIButton *)sender
{
    if(selectedIndex != sender.tag)
    {
        if(sender.tag == 1)
        {
            [authViewController reload];
        }
        else if(sender.tag == 2)
        {
            [userInfoViewController reload];
        }
        UIButton *selecetedButton = buttonArray[selectedIndex];
        [selecetedButton setSelected:NO];
        [UIView animateWithDuration:0.25 animations:^{
            [self showLineWithButton:sender];
            [myCollectionView setContentOffset:CGPointMake(CGRectGetWidth(myCollectionView.bounds) * sender.tag, 0) animated:YES];
            [sender setSelected:YES];
        }];
    }
}

#pragma mark UICollectionViewDelegate UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return collectionView.frame.size;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    UIViewController *viewController = viewControllerArray[indexPath.row];
    [cell addSubview:viewController.view];
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page=scrollView.contentOffset.x/CGRectGetWidth(scrollView.frame);
    UIButton *button = buttonArray[page];
    [self buttonAct:button];
}

@end
