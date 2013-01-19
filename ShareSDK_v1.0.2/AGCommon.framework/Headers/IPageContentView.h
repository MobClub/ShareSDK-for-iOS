//
//  IPageContentView.h
//  Common
//
//  Created by 冯 鸿杰 on 12/8/26.
//
//

#import <Foundation/Foundation.h>

/**
 *	@brief	页面内容视图接口，实现此接口则可作为PageView的内容页
 */
@protocol IPageContentView <NSObject>

@required

/**
 *	@brief	获取复用标识
 *
 *	@return	复用标识
 */
- (NSString *)reuseIdentifier;

/**
 *	@brief	根据引用标识初始化
 *
 *	@param 	reuseIdentifier 	复用标识
 *  @param  frame   显示区域
 *
 *	@return	对象
 */
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier frame:(CGRect)frame;

@end

