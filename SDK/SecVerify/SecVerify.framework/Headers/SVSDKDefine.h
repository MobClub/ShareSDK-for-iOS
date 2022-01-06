//
//  SVSDKDefine.h
//  SecVerify
//
//  Created by lujh on 2019/5/17.
//  Copyright © 2019 lujh. All rights reserved.
//

#ifndef SVSDKDefine_h
#define SVSDKDefine_h

//SDK版本号
#define KSVSDKVersion @"3.1.2"
//产品标识
#define KSVIdentifier @"SECVERIFY"

/**
 SecVerify 结果的回调

 @param resultDic 结果的字典
 @param error 错误信息
 */
typedef void(^SecVerifyResultHander)(NSDictionary * _Nullable resultDic, NSError * _Nullable error);

#endif /* SVSDKDefine_h */
