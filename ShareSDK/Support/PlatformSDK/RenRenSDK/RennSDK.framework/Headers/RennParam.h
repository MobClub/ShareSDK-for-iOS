//
//  RennParam.h
//  RennSDK
//
//  Created by Li Chengliang on 13-4-17.
//  Copyright (c) 2013年 Li Chengliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RennParam : NSObject
{
    NSString *_type;
    NSString *_path;
    NSString *_method;
}

- (id)initWithType:(NSString *)type path:(NSString *)path method:(NSString *)method;

- (NSString *)type;

- (NSString *)path;

- (NSString *)method;

- (NSDictionary *)toDictionary;

@end
