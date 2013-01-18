//
//  AGInputUserNameViewController.h
//  AGShareSDKDemo
//
//  Created by 冯 鸿杰 on 13-1-17.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShareSDK/ShareSDK.h>

@interface AGInputUserNameViewController : UIViewController <UITableViewDataSource,
                                                             UITableViewDelegate,
                                                             UITextFieldDelegate>
{
@private
    UITableView *_tableView;
    UITextField *_textField;
    
    UserParamType _paramType;
    ShareType _shareType;
    
    UITapGestureRecognizer *_gestureRecognizer;
}


@end
