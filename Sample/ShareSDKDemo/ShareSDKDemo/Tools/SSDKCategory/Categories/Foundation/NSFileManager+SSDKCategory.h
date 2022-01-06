//
//  NSFileManager+SSDKCategory.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/11.
//  Copyright © 2019 mob. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (SSDKCategory)
/**
 Documents
 */
@property (nonatomic, readonly) NSURL *documentsURL;
@property (nonatomic, readonly) NSString *documentsPath;

/**
 Caches
 */
@property (nonatomic, readonly) NSURL *cachesURL;
@property (nonatomic, readonly) NSString *cachesPath;

/**
 Library
 */
@property (nonatomic, readonly) NSURL *libraryURL;
@property (nonatomic, readonly) NSString *libraryPath;

/**
 将文件一个文件夹或文件中所有包含string的文件替换为新的文件
 */
- (void)replaceFilePath:(NSString *)path  nameString:(NSString *)string withNewString:(NSString *)newString;

/**
 给一个路径的所有文件添加前缀
 */
- (void)addPreNameAtPath:(NSString *)path preName:(NSString *)preName;

@end

NS_ASSUME_NONNULL_END
