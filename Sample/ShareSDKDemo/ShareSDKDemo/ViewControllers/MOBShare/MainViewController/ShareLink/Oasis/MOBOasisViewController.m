//
//  MOBOasisViewController.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/18.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBOasisViewController.h"
#import <Photos/Photos.h>
@interface MOBOasisViewController ()<PHPhotoLibraryChangeObserver,PHPhotoLibraryAvailabilityObserver>

@end

@implementation MOBOasisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    shareIconArray = @[@"webURLIcon",@"videoIcon"];
    shareTypeArray = @[@"链接",@"文件"];
    selectorNameArray = @[@"shareLink",@"shareFile"];
    
    
    [[PHPhotoLibrary sharedPhotoLibrary] registerChangeObserver:self];
    
    // Do any additional setup after loading the view.
}

- (void)shareLink{
    
}

- (void)shareFile{
    
}

- (void)photoLibraryDidChange:(PHChange *)changeInstance{
    
}

- (void)photoLibraryDidBecomeUnavailable:(PHPhotoLibrary *)photoLibrary{
    
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
