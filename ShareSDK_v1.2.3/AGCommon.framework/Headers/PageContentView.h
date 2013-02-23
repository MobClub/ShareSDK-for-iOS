//
//  ZGPageContentView.h
//  InputViewDemo
//
//  Created by hower on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IPageContentView.h"

@interface PageContentView : UIView <IPageContentView>
{
@private
    NSString *_reuseIdentifier;
}

/**
	引用标识
 */
@property (nonatomic,readonly) NSString *reuseIdentifier;

@end
