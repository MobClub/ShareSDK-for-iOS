//
//  Header.h
//  WordPressSDK
//
//  Created by 冯 鸿杰 on 12-9-18.
//  Copyright (c) 2012年 掌淘科技. All rights reserved.
//

#pragma once

#import "UIView+Common.h"

#define __DEBUG__

#ifdef __DEBUG__

#import "DebugLog.h"

#define __DEBUG_LOG(text) [DebugLog writeInfo:(text)]
#define __DEBUG_WARNING(text) [DebugLog writeWarning:(text)]
#define __DEBUG_ERROR(text) [DebugLog writeError:(text)]
#define __DEBUG_CONTENT(content) [DebugLog writeContentWithDictionary:(content)]

#else

#define __DEBUG_LOG(text) (text)
#define __DEBUG_WARNING(text) (text)
#define __DEBUG_ERROR(text) (text)
#define __DEBUG_CONTENT(content) (content)

#endif

//#if __has_feature(objc_arc)
//
//    #define RETAIN(obj) (obj)
//    #define RELEASE(obj) (void)(obj)
//    #define AUTORELEASE(obj) (obj)
//    #define SUPER_DEALLOC (void)(0)
//
//#else
//
//    #define __WEAK
//    #define WEAK assign
//    #define RETAIN(obj) [(obj) retain]
//    #define RELEASE(obj) [(obj) release]
//    #define AUTORELEASE(obj) [(obj) autorelease]
//    #define SUPER_DEALLOC [super dealloc]
//
//#endif
//
//
//#ifndef WEAK
//    #if defined __IPHONE_OS_VERSION_MIN_REQUIRED
//        #if __IPHONE_OS_VERSION_MIN_REQUIRED > __IPHONE_4_3
//            #define __WEAK __weak
//            #define WEAK weak
//        #else
//            #define __WEAK __unsafe_unretained
//            #define WEAK unsafe_unretained
//        #endif
//    #elif defined __MAC_OS_X_VERSION_MIN_REQUIRED
//        #if __MAC_OS_X_VERSION_MIN_REQUIRED > __MAC_10_6
//            #define __WEAK __weak
//            #define WEAK weak
//        #else
//            #define __WEAK __unsafe_unretained
//            #define WEAK unsafe_unretained
//        #endif
//    #endif
//#endif

#define SAFE_RELEASE(obj) if(obj){[obj release];obj=nil;}