//
//  NSObject+SSDKCategory.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/9.
//  Copyright © 2019 mob. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (SSDKCategory)

@property (nonatomic, copy, readonly) NSString * clasName;

+ (NSString *)clasName;

@end

@interface NSObject (SwizzleClassMehtod)

+ (BOOL)swizzleClassMethod:(SEL)originalSel with:(SEL)newSel;

+ (BOOL)swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel;

@end

typedef void(^ssdk_deallocTask)(id object);

@interface NSObject (AssociateObject)

- (void)setAssociateValue:(id)value forKey:(void *)key;

- (void)setAssociateWeakValue:(nullable id)value forKey:(void *)key;

- (id)getAssociateValueByKey:(void *)key;

- (void)removeAllAssociatedValues;

- (void)addDeallocTask:(ssdk_deallocTask)task;

@end


@interface NSObject (PerformSelector)

- (nullable id)performSelectorWithArguments:(SEL)sel, ...;

- (void)performSelectorWithArguments:(SEL)sel delay:(NSTimeInterval)delay, ...;

- (nullable id)performSelectorWaitUntilDone:(BOOL)wait onMainThreadWithArguments:(SEL)sel ,...;

- (nullable id)performSelectorwaitUntilDone:(BOOL)wait withArguments:(SEL)sel onThread:(NSThread *)thread, ...;

- (void)performSelectorWithArgumentsInBackground:(SEL)sel, ...;

@end

NS_ASSUME_NONNULL_END
