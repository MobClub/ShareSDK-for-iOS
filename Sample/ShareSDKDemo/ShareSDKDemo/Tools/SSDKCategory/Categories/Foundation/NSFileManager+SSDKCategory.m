//
//  NSFileManager+SSDKCategory.m
//  SSDKCategory
//
//  Created by maxl on 2019/1/11.
//  Copyright © 2019 mob. All rights reserved.
//

#import "NSFileManager+SSDKCategory.h"
#import "NSString+SSDKCategory.h"
@implementation NSFileManager (SSDKCategory)

- (NSURL *)documentsURL {
    return [[self
             URLsForDirectory:NSDocumentDirectory
             inDomains:NSUserDomainMask] lastObject];
}

- (NSString *)documentsPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

- (NSURL *)cachesURL {
    return [[self
             URLsForDirectory:NSCachesDirectory
             inDomains:NSUserDomainMask] lastObject];
}

- (NSString *)cachesPath {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

- (NSURL *)libraryURL {
    return [[self
             URLsForDirectory:NSLibraryDirectory
             inDomains:NSUserDomainMask] lastObject];
}

- (NSString *)libraryPath {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}


- (void)replaceFilePath:(NSString *)path nameString:(NSString *)string withNewString:(NSString *)newString{
    BOOL isD = NO;
    if (![self fileExistsAtPath:path isDirectory:&isD]) return;
    if (!isD) {
        NSString *la = path.lastPathComponent;
        if ([la containsString:string]) {
            NSString *dir = [path substringToIndex:path.length - la.length];
            NSString *newPath = [dir stringByAppendingPathComponent:[la stringByReplacingOccurrencesOfString:string withString:newString]];
            [self moveItemAtPath:path toPath:newPath error:nil];
        }
        return;
    }
    NSDirectoryEnumerator *enumber = [self enumeratorAtPath:path];
    NSString *filePath = @"";
    for (NSString *a in enumber.allObjects) {
        filePath = a;
        NSString *last = filePath.lastPathComponent;
        filePath = [[[filePath substringToIndex:filePath.length - last.length] stringByReplacingOccurrencesOfString:string withString:newString] stringByAppendingPathComponent:last];
        NSString *p = [path stringByAppendingPathComponent:filePath];
        BOOL isDir = YES;
        if ([self fileExistsAtPath:p isDirectory:&isDir]) {
            if ([filePath containsString:string]) {
                NSString *newPath = [filePath stringByReplacingOccurrencesOfString:string withString:newString];
                NSString *movePath = [path stringByAppendingPathComponent:newPath];
                NSError *error = nil;
                [self moveItemAtPath:p toPath:movePath error:&error];
            }
        }
    }
}

- (void)addPreNameAtPath:(NSString *)path preName:(NSString *)preName{
    BOOL isD = NO;
    if (![self fileExistsAtPath:path isDirectory:&isD]) return;
    if (!isD) {
        NSString *la = path.lastPathComponent;
        if (![la hasPrefix:preName]) {
            NSString *dir = [path substringToIndex:path.length - la.length];
            NSString *newPath = [dir stringByAppendingPathComponent:[preName stringByAppendingString:[la transformToPinyin]]];
            [self moveItemAtPath:path toPath:newPath error:nil];
        }
        return;
    }
    NSDirectoryEnumerator *enumber = [self enumeratorAtPath:path];
    for (NSString *a in enumber.allObjects) {
        NSString *p = [path stringByAppendingPathComponent:a];
        BOOL isDir = NO;
        if ([self fileExistsAtPath:p isDirectory:&isDir]) {
            if (!isDir) {
                NSString *la = a.lastPathComponent;
                NSString *dir = [p substringToIndex:p.length - la.length];
                NSString *newPath = [dir stringByAppendingPathComponent:[preName stringByAppendingString:[la transformToPinyin]]];
                NSError *error = nil;
                [self moveItemAtPath:p toPath:newPath error:&error];
            }
        }
    }
}

@end
