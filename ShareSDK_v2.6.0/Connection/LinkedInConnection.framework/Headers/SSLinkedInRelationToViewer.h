//
//  SSLinkedInRelationToViewer.h
//  LinkedInConnection
//
//  Created by 冯 鸿杰 on 13-8-9.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

@interface SSLinkedInRelationToViewer : SSCDataObject

@property (nonatomic,readonly) NSInteger distance;

+ (SSLinkedInRelationToViewer *)relationToViewerWithResponse:(NSDictionary *)response;

@end
