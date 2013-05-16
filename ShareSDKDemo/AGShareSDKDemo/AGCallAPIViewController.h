//
//  AGCallAPIViewController.h
//  AGShareSDKDemo
//
//  Created by 冯 鸿杰 on 13-4-24.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AGCallAPIViewController : UIViewController <UITextFieldDelegate>
{
@private
    UIScrollView *_contentView;
    UITextField *_focusTextField;
    
    UITextField *_sinaGetCmtStatusIdField;
    UITextField *_sinaReplyStatusIdField;
    UITextField *_sinaReplyCommendIdField;
    UITextField *_sinaReplyContentField;
    
    UITextField *_tencentGetCmtStatusIdField;
    UITextField *_tencentReplyStatusIdField;
    UITextField *_tencentReplyContentField;
}

@end
