//
//  EAccountHYUiEventHandler.h
//  EAccountHYSDK
//
//  Created by Reticence Lee on 2020/6/23.
//  Copyright © 2020 21cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EAccountOpenPageConfig.h"

/**
声明一个block
让sdk继续执行往下的流程
*/
typedef   void (^continueExecutionHandler)(void);

/**
声明一个block，让sdk继续执行往下的流程
@param isModified       当前view的状态是否由合作方来改变，如：置为不可按、改变背景颜色等
                    若传入NO，sdk可能会继续修改当前view的状态，覆盖合作方对view所做的修改，如：把登录按钮置为不可按状态，文字置为空，并加载loading
                    若传入YES，sdk不会修改当前view的状态
*/
typedef   void (^continueExecutionHandler_params)(BOOL isModified);

NS_ASSUME_NONNULL_BEGIN

@interface EAccountHYUiEventHandler : NSObject<EAccountOpenPageConfig>

@property (nonatomic, copy) continueExecutionHandler continueExecution;
@property (nonatomic, copy) continueExecutionHandler_params continueExecutionWithParams;

@end

NS_ASSUME_NONNULL_END
