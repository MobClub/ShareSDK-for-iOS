//
//  ShareSDKDemoTests.m
//  ShareSDKDemoTests
//
//  Created by youzu_Max on 2017/10/12.
//  Copyright © 2017年 mob. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
#import <ShareSDK/ShareSDK.h>
#import <ShareSDK/ShareSDK+Base.h>
#import <ShareSDK/NSMutableDictionary+SSDKShare.h>
#import <ShareSDK/NSMutableDictionary+SSDKInit.h>

@interface ShareSDKDemoTests : XCTestCase

@end

@implementation ShareSDKDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - RegisterActivePlatforms

//正常设置
- (void)testRegister
{
    [ShareSDK registerActivePlatforms:@[
                                        @(SSDKPlatformTypeWechat),
                                        ]
                             onImport:^(SSDKPlatformType platformType) {
                                 switch (platformType)
                                 {
                                     case SSDKPlatformTypeWechat:
                                         [ShareSDKConnector connectWeChat:nil delegate:nil];
                                         break;
                                     default:
                                         break;
                                 }
                             }
                      onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
                          switch (platformType) {
                              case SSDKPlatformTypeWechat:
                                  [appInfo SSDKSetupWeChatByAppId:@"wx4868b35061f87885"
                                                        appSecret:@"64020361b8ec4c99936c0e3999a9f249"];
                                  break;
                              default:
                                  break;
                          }
                      }];
}

- (void)testRegisterFor1000
{
    for(int i = 0 ; i <1000 ;i++)
    {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [ShareSDK registerActivePlatforms:@[
                                                @(SSDKPlatformTypeWechat),
                                                ]
                                     onImport:^(SSDKPlatformType platformType) {
                                         switch (platformType)
                                         {
                                             case SSDKPlatformTypeWechat:
                                                 [ShareSDKConnector connectWeChat:nil delegate:nil];
                                                 break;
                                             default:
                                                 break;
                                         }
                                     }
                              onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
                                  switch (platformType) {
                                      case SSDKPlatformTypeWechat:
                                          [appInfo SSDKSetupWeChatByAppId:@"wx4868b35061f87885"
                                                                appSecret:@"64020361b8ec4c99936c0e3999a9f249"];
                                          break;
                                      default:
                                          break;
                                  }
                              }];
        });
    }
}


#pragma mark - RegisterActivePlatforms ActivePlatforms

//ActivePlatforms 传入 nil
- (void)testActivePlatformsForNiL
{
    [ShareSDK registerActivePlatforms:nil
                             onImport:^(SSDKPlatformType platformType) {
                                 switch (platformType)
                                 {
                                     case SSDKPlatformTypeWechat:
                                         [ShareSDKConnector connectWeChat:nil delegate:nil];
                                         break;
                                     default:
                                         break;
                                 }
                             }
                      onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
                          switch (platformType) {
                              case SSDKPlatformTypeWechat:
                                  [appInfo SSDKSetupWeChatByAppId:@"wx4868b35061f87885"
                                                        appSecret:@"64020361b8ec4c99936c0e3999a9f249"];
                                  break;
                              default:
                                  break;
                          }
                      }];
}

//传入不存在的平台类型
- (void)testActivePlatformsForNOPlatformType
{
    [ShareSDK registerActivePlatforms:@[@(123)]
                             onImport:^(SSDKPlatformType platformType) {
                                 switch (platformType)
                                 {
                                     case SSDKPlatformTypeWechat:
                                         [ShareSDKConnector connectWeChat:nil delegate:nil];
                                         break;
                                     default:
                                         break;
                                 }
                             }
                      onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
                          switch (platformType) {
                              case SSDKPlatformTypeWechat:
                                  [appInfo SSDKSetupWeChatByAppId:@"wx4868b35061f87885"
                                                        appSecret:@"64020361b8ec4c99936c0e3999a9f249"];
                                  break;
                              default:
                                  break;
                          }
                      }];
}

//错误的数据传入
- (void)testActivePlatformsForObject
{
    [ShareSDK registerActivePlatforms:[NSObject new]
                             onImport:^(SSDKPlatformType platformType) {
                                 switch (platformType)
                                 {
                                     case SSDKPlatformTypeWechat:
                                         [ShareSDKConnector connectWeChat:nil delegate:nil];
                                         break;
                                     default:
                                         break;
                                 }
                             }
                      onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
                          switch (platformType) {
                              case SSDKPlatformTypeWechat:
                                  [appInfo SSDKSetupWeChatByAppId:@"wx4868b35061f87885"
                                                        appSecret:@"64020361b8ec4c99936c0e3999a9f249"];
                                  break;
                              default:
                                  break;
                          }
                      }];
}

#pragma mark - RegisterActivePlatforms onImport

//正常设置
- (void)testRegisterOnImportForNil
{
    [ShareSDK registerActivePlatforms:@[
                                        @(SSDKPlatformTypeWechat),
                                        ]
                             onImport:nil
                      onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
                          switch (platformType) {
                              case SSDKPlatformTypeWechat:
                                  [appInfo SSDKSetupWeChatByAppId:@"wx4868b35061f87885"
                                                        appSecret:@"64020361b8ec4c99936c0e3999a9f249"];
                                  break;
                              default:
                                  break;
                          }
                      }];
}

//设置不存在的平台
- (void)testRegisterOnImportForNOPlatformType
{
    [ShareSDK registerActivePlatforms:@[
                                        @(SSDKPlatformTypeWechat),
                                        ]
                             onImport:^(SSDKPlatformType platformType) {
                                 switch (platformType)
                                 {
                                     case 123:
                                         break;
                                     default:
                                         break;
                                 }
                             }
                      onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
                          switch (platformType) {
                              case SSDKPlatformTypeWechat:
                                  [appInfo SSDKSetupWeChatByAppId:@"wx4868b35061f87885"
                                                        appSecret:@"64020361b8ec4c99936c0e3999a9f249"];
                                  break;
                              default:
                                  break;
                          }
                      }];
}

#pragma mark - RegisterActivePlatforms onConfiguration

//正常设置
- (void)testRegisterOnConfigurationForNIL
{
    [ShareSDK registerActivePlatforms:@[
                                        @(SSDKPlatformTypeWechat),
                                        ]
                             onImport:^(SSDKPlatformType platformType) {
                                 switch (platformType)
                                 {
                                     case SSDKPlatformTypeWechat:
                                         [ShareSDKConnector connectWeChat:nil delegate:nil];
                                         break;
                                     default:
                                         break;
                                 }
                             }
                      onConfiguration:nil];
}

//设置不存在的平台
- (void)testRegisterOnConfigurationForNOPlatformType
{
    [ShareSDK registerActivePlatforms:@[
                                        @(SSDKPlatformTypeWechat),
                                        ]
                             onImport:^(SSDKPlatformType platformType) {
                                 switch (platformType)
                                 {
                                     case SSDKPlatformTypeWechat:
                                         [ShareSDKConnector connectWeChat:nil delegate:nil];
                                         break;
                                     default:
                                         break;
                                 }
                             }
                      onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
                          switch (platformType) {
                              case 123:
                                  break;
                              default:
                                  break;
                          }
                      }];
}

#pragma mark - Authorize

XCTestExpectation *successExpectation;

- (void)testAuthorize
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"authorize"];
    [ShareSDK authorize:SSDKPlatformTypeWechat
               settings:nil
         onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
             NSLog(@"%lu %@ %@",(unsigned long)state ,user,error);
             [successExpectation fulfill];
         }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

//错误的数据传入
- (void)testAuthorizeForObject
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"authorize"];
    [ShareSDK authorize:[NSObject new]
               settings:nil
         onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
             NSLog(@"%lu %@ %@",(unsigned long)state ,user,error);
             [successExpectation fulfill];
         }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

//不存在的类型
- (void)testAuthorizeForNOPlatformType
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"authorize"];
    [ShareSDK authorize:123
               settings:nil
         onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
             NSLog(@"%lu %@ %@",(unsigned long)state ,user,error);
             [successExpectation fulfill];
         }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

//错误的数据传入
- (void)testSettingsForObject
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"authorize"];
    [ShareSDK authorize:SSDKPlatformTypeWechat
               settings:[NSObject new]
         onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
             NSLog(@"%lu %@ %@",(unsigned long)state ,user,error);
             [successExpectation fulfill];
         }];
    [self waitForExpectationsWithTimeout:10 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

//nil的数据传入
- (void)testOnStateChangedForNIL
{
    [ShareSDK authorize:SSDKPlatformTypeWechat
               settings:nil
         onStateChanged:nil];
}

#pragma mark - HasAuthorized

- (void)testHasAuthorized
{
    BOOL bo = [ShareSDK hasAuthorized:SSDKPlatformTypeWechat];
    NSLog(@"HasAuthorized %d",bo);
}

//错误的数据传入
- (void)testHasAuthorizedForObject
{
    BOOL bo = [ShareSDK hasAuthorized:[NSObject new]];
    NSLog(@"HasAuthorized %d",bo);
}

//不存在的平台
- (void)testHasAuthorizedForNOPlatformType
{
    BOOL bo = [ShareSDK hasAuthorized:123];
    NSLog(@"HasAuthorized %d",bo);
}

//1000
- (void)testHasAuthorizedFor1000
{
    for(int i = 0 ; i <1000 ;i++)
    {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [ShareSDK hasAuthorized:SSDKPlatformTypeWechat];
        });
    }
}


#pragma mark - CancelAuthorize

- (void)testCancelAuthorize
{
    [ShareSDK cancelAuthorize:SSDKPlatformTypeWechat];
}

//错误的数据传入
- (void)testCancelAuthorizeForObject
{
    [ShareSDK cancelAuthorize:[NSObject new]];
}

//不存在的平台
- (void)testCancelAuthorizeForNOPlatformType
{
    [ShareSDK cancelAuthorize:123];
}

//1000
- (void)testCancelAuthorizeFor1000
{
    for(int i = 0 ; i <1000 ;i++)
    {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [ShareSDK cancelAuthorize:SSDKPlatformTypeWechat];
        });
    }
}

#pragma mark - GetUserInfo

- (void)testGetUserInfo
{
    //    [self testRegister];
    //    sleep(2);
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"userInfo"];
    [ShareSDK getUserInfo:SSDKPlatformTypeWechat
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
               NSLog(@"%lu %@ %@",(unsigned long)state ,user,error);
               [successExpectation fulfill];
           }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testGetUserInfoForObject
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"userInfo"];
    [ShareSDK getUserInfo:[NSObject new]
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
               NSLog(@"%lu %@ %@",(unsigned long)state ,user,error);
               [successExpectation fulfill];
           }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testGetUserInfoForNOPlatformType
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"userInfo"];
    [ShareSDK getUserInfo:123
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
               NSLog(@"%lu %@ %@",(unsigned long)state ,user,error);
               [successExpectation fulfill];
           }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testGetUserInfoOnStateChangedForNil
{
    [ShareSDK getUserInfo:SSDKPlatformTypeWechat
           onStateChanged:nil];
}

#pragma mark - GetUserInfoByConditional

- (void)testGetUserInfoByConditional
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"userInfo"];
    [ShareSDK getUserInfo:SSDKPlatformTypeWechat
              conditional:nil
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
               NSLog(@"%lu %@ %@",(unsigned long)state ,user,error);
               [successExpectation fulfill];
           }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testGetUserInfoByConditionalForObject
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"userInfo"];
    [ShareSDK getUserInfo:[NSObject new]
              conditional:nil
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
               NSLog(@"%lu %@ %@",(unsigned long)state ,user,error);
               [successExpectation fulfill];
           }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testGetUserInfoByConditionalForNOPlatformType
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"userInfo"];
    [ShareSDK getUserInfo:123
              conditional:nil
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
               NSLog(@"%lu %@ %@",(unsigned long)state ,user,error);
               [successExpectation fulfill];
           }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testGetUserInfoConditionalForObject
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"userInfo"];
    [ShareSDK getUserInfo:SSDKPlatformTypeWechat
              conditional:[NSObject new]
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
               NSLog(@"%lu %@ %@",(unsigned long)state ,user,error);
               [successExpectation fulfill];
           }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testGetUserInfoConditionalForNil
{
    [ShareSDK getUserInfo:SSDKPlatformTypeWechat
              conditional:nil
           onStateChanged:nil];
}

#pragma mark - Share

- (void)testShare
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"share"];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"ShareSDK"
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeAuto];
    [ShareSDK share:SSDKPlatformTypeWechat
         parameters:parameters
     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
         NSLog(@"%lu %@ %@ %@",(unsigned long)state ,userData,contentEntity,error);
         [successExpectation fulfill];
     }];
    [self waitForExpectationsWithTimeout:10 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testShareForObject
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"share"];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"ShareSDK"
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeAuto];
    [ShareSDK share:[NSObject new]
         parameters:parameters
     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
         NSLog(@"%lu %@ %@ %@",(unsigned long)state ,userData,contentEntity,error);
         [successExpectation fulfill];
     }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testShareParametersForObject
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"share"];
    [ShareSDK share:SSDKPlatformTypeWechat
         parameters:[NSObject new]
     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
         NSLog(@"%lu %@ %@ %@",(unsigned long)state ,userData,contentEntity,error);
         [successExpectation fulfill];
     }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testShareParametersForNil
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"share"];
    [ShareSDK share:SSDKPlatformTypeWechat
         parameters:nil
     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
         NSLog(@"%lu %@ %@ %@",(unsigned long)state ,userData,contentEntity,error);
         [successExpectation fulfill];
     }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testShareOnStateChangedForNil
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"ShareSDK"
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeAuto];
    [ShareSDK share:SSDKPlatformTypeWechat
         parameters:parameters
     onStateChanged:nil];
}

#pragma mark - SDKVer

- (void)testSDKVer
{
    NSLog(@"%@",[ShareSDK sdkVer]);
}

- (void)testSDKVerFor1000
{
    for(int i = 0 ; i <1000 ;i++)
    {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"%@",[ShareSDK sdkVer]);
        });
    }
}

#pragma mark - ActivePlatforms

- (void)testActivePlatforms
{
    NSLog(@"%@",[ShareSDK activePlatforms]);
}

- (void)testActivePlatformsFor1000
{
    //    [self testRegister];
    //    sleep(1);
    for(int i = 0 ; i <1000 ;i++)
    {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"%d %@",i,[ShareSDK activePlatforms]);
        });
    }
}

#pragma mark - IsSupportAuth

- (void)testIsSupportAuth
{
    BOOL bo = [ShareSDK isSupportAuth:SSDKPlatformTypeWechat];
    NSLog(@"testIsSupportAuth %d",bo);
}

- (void)testIsSupportAuthForObject
{
    BOOL bo = [ShareSDK isSupportAuth:[NSObject new]];
    NSLog(@"testIsSupportAuth %d",bo);
}

- (void)testIsSupportAuthForFor1000
{
    for(int i = 0 ; i <1000 ;i++)
    {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            BOOL bo = [ShareSDK isSupportAuth:SSDKPlatformTypeWechat];
            NSLog(@"testIsSupportAuth %d",bo);
        });
    }
}

#pragma mark - CurrentUser

- (void)testCurrentUser
{
    SSDKUser *user = [ShareSDK currentUser:SSDKPlatformTypeWechat];
    NSLog(@"testIsSupportAuth %@",user);
}

- (void)testCurrentUserForObject
{
    SSDKUser *user = [ShareSDK currentUser:[NSObject new]];
    NSLog(@"testIsSupportAuth %@",user);
}

- (void)testCurrentUserForFor1000
{
    for(int i = 0 ; i <1000 ;i++)
    {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            SSDKUser *user = [ShareSDK currentUser:SSDKPlatformTypeWechat];
            NSLog(@"testIsSupportAuth %@",user);
        });
    }
}

#pragma mark - setCurrentUser


- (void)testSetCurrentUserForNil
{
    [ShareSDK setCurrentUser:nil forPlatformType:SSDKPlatformTypeWechat];
}

- (void)testSetCurrentUserForObject
{
    [ShareSDK setCurrentUser:[NSObject new] forPlatformType:SSDKPlatformTypeWechat];
}

- (void)testSetCurrentUserPlatformTypeForObject
{
    [ShareSDK setCurrentUser:nil forPlatformType:[NSObject new]];
}

- (void)testSetCurrentUserForFor1000
{
    for(int i = 0 ; i <1000 ;i++)
    {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [ShareSDK setCurrentUser:nil forPlatformType:SSDKPlatformTypeWechat];
        });
    }
}

#pragma mark - authorizeOnViewDisplay

- (void)testAuthorizeOnViewDisplay
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"authorize"];
    [ShareSDK authorize:SSDKPlatformTypeWechat
               settings:nil
          onViewDisplay:^(UIView<ISSDKAuthView> *view) {
              NSLog(@"%@",view);
          } onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
              NSLog(@"%lu %@ %@",(unsigned long)state ,user,error);
              [successExpectation fulfill];
          }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testAuthorizeOnViewDisplayPlatformTypeForObject
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"authorize"];
    [ShareSDK authorize:[NSObject new]
               settings:nil
          onViewDisplay:^(UIView<ISSDKAuthView> *view) {
              NSLog(@"%@",view);
          } onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
              NSLog(@"%lu %@ %@",(unsigned long)state ,user,error);
              [successExpectation fulfill];
          }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testAuthorizeOnViewDisplaysettingsForObject
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"authorize"];
    [ShareSDK authorize:SSDKPlatformTypeWechat
               settings:[NSObject new]
          onViewDisplay:^(UIView<ISSDKAuthView> *view) {
              NSLog(@"%@",view);
          } onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
              NSLog(@"%lu %@ %@",(unsigned long)state ,user,error);
              [successExpectation fulfill];
          }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testAuthorizeOnViewDisplayForNil
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"authorize"];
    [ShareSDK authorize:SSDKPlatformTypeWechat
               settings:nil
          onViewDisplay:nil
         onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
             NSLog(@"%lu %@ %@",(unsigned long)state ,user,error);
             [successExpectation fulfill];
         }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testAuthorizeOnViewDisplayOnStateChangedForNil
{
    [ShareSDK authorize:SSDKPlatformTypeWechat
               settings:nil
          onViewDisplay:^(UIView<ISSDKAuthView> *view) {
              NSLog(@"%@",view);
          }
         onStateChanged:nil];
}

#pragma mark - GetUserInfoOnAuthorize

- (void)testGetUserInfoOnAuthorize
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"getUserInfo"];
    [ShareSDK getUserInfo:SSDKPlatformTypeWechat
              conditional:nil
              onAuthorize:nil
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
               NSLog(@"%lu %@ %@",(unsigned long)state ,user,error);
               [successExpectation fulfill];
           }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testGetUserInfoOnAuthorizeForObject
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"authorize"];
    [ShareSDK getUserInfo:[NSObject new]
              conditional:nil
              onAuthorize:nil
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
               NSLog(@"%lu %@ %@",(unsigned long)state ,user,error);
               [successExpectation fulfill];
           }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testGetUserInfoOnAuthorizeSettingsForObject
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"authorize"];
    [ShareSDK getUserInfo:SSDKPlatformTypeWechat
              conditional:[NSObject new]
              onAuthorize:nil
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
               NSLog(@"%lu %@ %@",(unsigned long)state ,user,error);
               [successExpectation fulfill];
           }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testGetUserInfoOnAuthorizeOnStateChangedForNil
{
    [ShareSDK authorize:SSDKPlatformTypeWechat
               settings:nil
          onViewDisplay:nil
         onStateChanged:nil];
}

#pragma mark - ShareOnAuthorize

- (void)testShareOnAuthorize
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"share"];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"ShareSDK"
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeAuto];
    [ShareSDK share:SSDKPlatformTypeWechat
         parameters:parameters
        onAuthorize:nil
     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
         NSLog(@"%lu %@ %@",(unsigned long)state ,userData,error);
         [successExpectation fulfill];
     }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testShareOnAuthorizeForObject
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"authorize"];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"ShareSDK"
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeAuto];
    [ShareSDK share:[NSObject new]
         parameters:parameters
        onAuthorize:nil
     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
         NSLog(@"%lu %@ %@",(unsigned long)state ,userData,error);
         [successExpectation fulfill];
     }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testShareOnAuthorizeParametersForNil
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"authorize"];
    [ShareSDK share:SSDKPlatformTypeWechat
         parameters:nil
        onAuthorize:nil
     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
         NSLog(@"%lu %@ %@",(unsigned long)state ,userData,error);
         [successExpectation fulfill];
     }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testShareOnAuthorizeParametersForObject
{
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"authorize"];
    [ShareSDK share:SSDKPlatformTypeWechat
         parameters:[NSObject new]
        onAuthorize:nil
     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
         NSLog(@"%lu %@ %@",(unsigned long)state ,userData,error);
         [successExpectation fulfill];
     }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testShareOnAuthorizeOnStateChangedForNil
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"ShareSDK"
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeAuto];
    [ShareSDK share:SSDKPlatformTypeWechat
         parameters:parameters
        onAuthorize:nil
     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
         NSLog(@"%lu %@ %@",(unsigned long)state ,userData,error);
         [successExpectation fulfill];
     }];
}

#pragma mark - SSDKSetAuthSettings

- (void)testSetAuthSettings
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetAuthSettings:@[]];
}

- (void)testSetAuthSettingsForNil
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetAuthSettings:nil];
}

- (void)testSetAuthSettingsForObject
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetAuthSettings:[NSObject new]];
}

//平台参数设置测试
- (void)checkParameter:(NSArray *)info callback:(void (^)(NSArray *parametersArray))callback
{
    // 检测正确的参数
    callback(info);
    for(int a = 0; a< 2 ; a++ )
    {
        for(int i = 0; i< info.count ; i++ )
        {
            NSMutableArray * tempArray = [[NSMutableArray alloc] initWithArray:info];
            // a = 0 检测 NSObjcet 1 检测 nil
            if(a == 0)
            {
                tempArray[i] = [NSObject new];
            }
            else
            {
                tempArray[i] = [NSNull null];
            }
            callback(tempArray);
        }
    }
}

#pragma mark - SSDKSetupSinaWeibo

- (void)testSSDKSetupSinaWeibo
{
    NSArray *info = @[@"568898243" ,
                      @"38a4f8204cc784f81f9f0daaf31e02e3" ,
                      @"http://www.sharesdk.cn" ,
                      SSDKAuthTypeBoth];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupSinaWeiboParameter %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupSinaWeiboByAppKey:parametersArray[0]
                                     appSecret:parametersArray[1]
                                   redirectUri:parametersArray[2]
                                      authType:parametersArray[3]];
    }];
    
}

#pragma mark - SSDKSetupWeChat

- (void)testSSDKSetupWeChat
{
    NSArray *info = @[@"wx4868b35061f87885" ,
                      @"64020361b8ec4c99936c0e3999a9f249"];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupWeChat %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupWeChatByAppId:parametersArray[0]
                                 appSecret:parametersArray[1]];
    }];
}

#pragma mark - SSDKSetupTwitter

- (void)testSSDKSetupTwitter
{
    NSArray *info = @[@"LRBM0H75rWrU9gNHvlEAA2aOy" ,
                      @"gbeWsZvA9ELJSdoBzJ5oLKX0TU09UOwrzdGfo9Tg7DjyGuMe8G",
                      @"http://mob.com"];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupTwitter %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupTwitterByConsumerKey:parametersArray[0]
                                   consumerSecret:parametersArray[1]
                                      redirectUri:parametersArray[2]];
    }];
}

#pragma mark - SSDKSetupQQ

- (void)testSSDKSetupQQ
{
    NSArray *info = @[@"100371282" ,
                      @"aed9b0303e3ed1e27bae87c33761161d",
                      SSDKAuthTypeSSO];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupQQ %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupQQByAppId:parametersArray[0]
                                appKey:parametersArray[1]
                              authType:parametersArray[2]];
    }];
}

#pragma mark - SSDKSetupFacebook

- (void)testSSDKSetupFacebook
{
    NSArray *info = @[@"107704292745179" ,
                      @"38053202e1a5fe26c80c753071f0b573",
                      @"ShareSDK",
                      SSDKAuthTypeWeb];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupFacebook %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupFacebookByApiKey:parametersArray[0]
                                    appSecret:parametersArray[1]
                                  displayName:parametersArray[2]
                                     authType:parametersArray[3]];
    }];
}

#pragma mark - SSDKSetupTencentWeibo

- (void)testSSDKSetupTencentWeibo
{
    NSArray *info = @[@"801307650" ,
                      @"ae36f4ee3946e1cbb98d6965b0b2ff5c",
                      @"http://www.sharesdk.cn"];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupTencentWeibo %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupTencentWeiboByAppKey:parametersArray[0]
                                        appSecret:parametersArray[1]
                                      redirectUri:parametersArray[2]];
    }];
}

#pragma mark - SSDKSetupDouBan

- (void)testSSDKSetupDouBan
{
    NSArray *info = @[@"02e2cbe5ca06de5908a863b15e149b0b" ,
                      @"9f1e7b4f71304f2f",
                      @"http://www.sharesdk.cn"];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupDouBan %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupDouBanByApiKey:parametersArray[0]
                                     secret:parametersArray[1]
                                redirectUri:parametersArray[2]];
    }];
}

#pragma mark - SSDKSetupRenRen

- (void)testSSDKSetupRenRen
{
    NSArray *info = @[@"226427" ,
                      @"fc5b8aed373c4c27a05b712acba0f8c3",
                      @"f29df781abdd4f49beca5a2194676ca4",
                      SSDKAuthTypeBoth];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupRenRen %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupRenRenByAppId:parametersArray[0]
                                    appKey:parametersArray[1]
                                 secretKey:parametersArray[2]
                                  authType:parametersArray[3]];
    }];
}

#pragma mark - SSDKSetupKaiXin

- (void)testSSDKSetupKaiXin
{
    NSArray *info = @[@"358443394194887cee81ff5890870c7c" ,
                      @"da32179d859c016169f66d90b6db2a23",
                      @"http://www.sharesdk.cn/"];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupKaiXin %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupKaiXinByApiKey:parametersArray[0]
                                  secretKey:parametersArray[1]
                                redirectUri:parametersArray[2]];
    }];
}

#pragma mark - SSDKSetupPocket

- (void)testSSDKSetupPocket
{
    NSArray *info = @[@"11496-de7c8c5eb25b2c9fcdc2b627" ,
                      @"pocketapp1234",
                      SSDKAuthTypeBoth];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupPocket %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupPocketByConsumerKey:parametersArray[0]
                                     redirectUri:parametersArray[1]
                                        authType:parametersArray[2]];
    }];
}


#pragma mark - SSDKSetupGooglePlus

- (void)testSSDKSetupGooglePlus
{
    NSArray *info = @[@"687191611339-t4k0lgh101094hb66qu5c3iakuvopvfc.apps.googleusercontent.com" ,
                      @"",
                      @"http://localhost"];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupGooglePlus %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupGooglePlusByClientID:parametersArray[0]
                                     clientSecret:parametersArray[1]
                                      redirectUri:parametersArray[2]];
    }];
}

#pragma mark - SSDKSetupInstagram

- (void)testSSDKSetupInstagram
{
    NSArray *info = @[@"ff68e3216b4f4f989121aa1c2962d058" ,
                      @"1b2e82f110264869b3505c3fe34e31a1",
                      @"http://sharesdk.cn"];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupInstagram %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupInstagramByClientID:parametersArray[0]
                                    clientSecret:parametersArray[1]
                                     redirectUri:parametersArray[2]];
    }];
}

#pragma mark - SSDKSetupLinkedIn

- (void)SSDKSetupLinkedIn
{
    NSArray *info = @[@"46kic3zr7s4n" ,
                      @"RWw6WRl9YJOcdWsj",
                      @"http://baidu.com"];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"SSDKSetupLinkedIn %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupLinkedInByApiKey:parametersArray[0]
                                    secretKey:parametersArray[1]
                                  redirectUrl:parametersArray[2]];
    }];
}


#pragma mark - SSDKSetupTumblr

- (void)testSSDKSetupTumblr
{
    NSArray *info = @[@"2QUXqO9fcgGdtGG1FcvML6ZunIQzAEL8xY6hIaxdJnDti2DYwM" ,
                      @"3Rt0sPFj7u2g39mEVB3IBpOzKnM3JnTtxX2bao2JKk4VV1gtNo",
                      @"tumblrauthexample://tumblr-authorize"];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupTumblr %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupTumblrByConsumerKey:parametersArray[0]
                                  consumerSecret:parametersArray[1]
                                     callbackUrl:parametersArray[2]];
    }];
}

#pragma mark - SSDKSetupFlickr

- (void)testSSDKSetupFlickr
{
    NSArray *info = @[@"cbed81d4a1bc7417693ab7865e354717" ,
                      @"4c490343869091f2"];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupFlickr %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupFlickrByApiKey:parametersArray[0]
                                  apiSecret:parametersArray[1]];
    }];
}

#pragma mark - SSDKSetupYouDaoNote

- (void)testSSDKSetupYouDaoNote
{
    NSArray *info = @[@"dcde25dca105bcc36884ed4534dab940" ,
                      @"d98217b4020e7f1874263795f44838fe",
                      @"http://www.sharesdk.cn/"];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupYouDaoNote %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYouDaoNoteByConsumerKey:parametersArray[0]
                                      consumerSecret:parametersArray[1]
                                       oauthCallback:parametersArray[2]];
    }];
}

#pragma mark - SSDKSetupEvernote

- (void)testSSDKSetupEvernote
{
    NSArray *info = @[@"vimfung-7482" ,
                      @"31ab0fa3c4a5c4d1",
                      @(YES)];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupEvernote %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupEvernoteByConsumerKey:parametersArray[0]
                                    consumerSecret:parametersArray[1]
                                           sandbox:parametersArray[2]];
    }];
}

#pragma mark - SSDKSetupAliPaySocial

- (void)testSSDKSetupAliPaySocial
{
    NSArray *info = @[@"2015072400185895"];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupAliPaySocial %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupAliSocialByAppId:parametersArray[0]];
    }];
}

#pragma mark - SSDKSetupPinterest

- (void)testSSDKSetupPinterest
{
    NSArray *info = @[@"4869186880492553915"];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupPinterest %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupPinterestByClientId:parametersArray[0]];
    }];
}

#pragma mark - SSDKSetupKaKao

- (void)testSSDKSetupKaKao
{
    NSArray *info = @[@"48d3f524e4a636b08d81b3ceb50f1003",
                      @"ac360fa50b5002637590d24108e6cb10",
                      @"http://www.mob.com/oauth",
                      SSDKAuthTypeBoth];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupKaKao %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupKaKaoByAppKey:parametersArray[0]
                                restApiKey:parametersArray[1]
                               redirectUri:parametersArray[2]
                                  authType:parametersArray[3]];
    }];
}

#pragma mark - SSDKSetupDropbox

- (void)testSSDKSetupDropbox
{
    NSArray *info = @[@"q7rm0f7ocy48ht3",
                      @"fxcl1pu05iiszq6",
                      @"http://localhost"];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupDropbox %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupDropboxByAppKey:parametersArray[0]
                                   appSecret:parametersArray[1]
                               oauthCallback:parametersArray[2]];
    }];
}

#pragma mark - SSDKSetupVKontakte

- (void)testSSDKSetupVKontakte
{
    NSArray *info = @[@"5312801",
                      @"ZHG2wGymmNUCRLG2r6CY",
                      SSDKAuthTypeBoth];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupVKontakte %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupVKontakteByApplicationId:parametersArray[0]
                                            secretKey:parametersArray[1]
                                             authType:parametersArray[2]];
    }];
}

#pragma mark - SSDKSetupMingDao

- (void)testSSDKSetupMingDao
{
    NSArray *info = @[@"97230F25CA5C",
                      @"A5DC29AF7C5A5851F28E903AE9EAC0",
                      @"http://mob.com"];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupMingDao %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupMingDaoByAppKey:parametersArray[0]
                                   appSecret:parametersArray[1]
                                 redirectUri:parametersArray[2]];
    }];
}

#pragma mark - SSDKSetupYiXin

- (void)testSSDKSetupYiXin
{
    NSArray *info = @[@"yx0d9a9f9088ea44d78680f3274da1765f",
                      @"1a5bd421ae089c3",
                      @"https://open.yixin.im/resource/oauth2_callback.html",
                      SSDKAuthTypeSSO];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupYiXin %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYiXinByAppId:parametersArray[0]
                                appSecret:parametersArray[1]
                              redirectUri:parametersArray[2]
                                 authType:parametersArray[3]];
    }];
}

#pragma mark - SSDKSetupInstapaper

- (void)testSSDKSetupInstapaper
{
    NSArray *info = @[@"4rDJORmcOcSAZL1YpqGHRI605xUvrLbOhkJ07yO0wWrYrc61FA",
                      @"GNr1GespOQbrm8nvd7rlUsyRQsIo3boIbMguAl9gfpdL0aKZWe"];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupInstapaper %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupInstapaperByConsumerKey:parametersArray[0]
                                      consumerSecret:parametersArray[1]];
    }];
}

#pragma mark - SSDKSetupDingTalk

- (void)testSSDKSetupDingTalk
{
    NSArray *info = @[@"dingoak5hqhuvmpfhpnjvt"];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupDingTalk %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupDingTalkByAppId:parametersArray[0]];
    }];
}

#pragma mark - SSDKSetupMeiPai

- (void)testSSDKSetupMeiPai
{
    NSArray *info = @[@"1089867596"];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupMeiPai %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupMeiPaiByAppKey:parametersArray[0]];
    }];
}

#pragma mark - SSDKSetupYouTube
- (void)testSSDKSetupYouTube
{
    NSArray *info = @[@"906418427202-jinnbqal1niq4s8isbg2ofsqc5ddkcgr.apps.googleusercontent.com",
                      @"",
                      @"http://localhost"];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupYouTube %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYouTubeByClientId:parametersArray[0]
                                  clientSecret:parametersArray[0]
                                   redirectUri:parametersArray[0]];
    }];
}

#pragma mark - SSDKSetupLine
- (void)testSSDKSetupLine
{
    NSArray *info = @[SSDKAuthTypeWeb];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupLine %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupLineAuthType:parametersArray[0]];
    }];
}

#pragma mark - SSDKSetupShareParams
- (void)testSSDKSetupShareParams
{
    NSArray *info = @[@"shareSDK",
                      [UIImage imageNamed:@"shareImg"],
                      [NSURL URLWithString:@"http://www.mob.com"],
                      @"title",
                      @(SSDKContentTypeAuto)];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupShareParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupShareParamsByText:parametersArray[0]
                                        images:parametersArray[1]
                                           url:parametersArray[2]
                                         title:parametersArray[3]
                                          type:parametersArray[4]];
    }];
}

#pragma mark - SSDKSetupSinaWeiboShareParams
- (void)testSSDKSetupSinaWeiboShareParams
{
    NSArray *info = @[@"shareSDK",
                      @"title",
                      [UIImage imageNamed:@"shareImg"],
                      [NSURL URLWithString:@"http://www.mob.com"],
                      @(1.0),
                      @(1.0),
                      @"123",
                      @(SSDKContentTypeAuto)];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupSinaWeiboShareParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupSinaWeiboShareParamsByText:parametersArray[0]
                                                  title:parametersArray[1]
                                                  image:parametersArray[2]
                                                    url:parametersArray[3]
                                               latitude:0.0
                                              longitude:0.0
                                               objectID:parametersArray[6]
                                                   type:parametersArray[7]];
    }];
}

#pragma mark - SSDKSetupTencentWeiboShareParams
- (void)testSSDKSetupTencentWeiboShareParams
{
    NSArray *info = @[@"shareSDK",
                      [UIImage imageNamed:@"shareImg"],
                      @(1.0),
                      @(1.0),
                      @(SSDKContentTypeAuto)];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupTencentWeiboShareParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupTencentWeiboShareParamsByText:parametersArray[0]
                                                    images:parametersArray[1]
                                                  latitude:0.0
                                                 longitude:0.0
                                                      type:parametersArray[4]];
    }];
}

#pragma mark - SSDKSetupWeChatParams

- (void)testSSDKSetupWeChatParams
{
    NSArray *info = @[@"shareSDK",
                      @"title",
                      [NSURL URLWithString:@"http://www.mob.com"],
                      [UIImage imageNamed:@"shareImg"],
                      [UIImage imageNamed:@"shareImg"],
                      [NSURL URLWithString:@"http://www.mob.com"],
                      @"extInfo",
                      [@"123" dataUsingEncoding:NSUTF8StringEncoding],
                      UIImageJPEGRepresentation([UIImage imageNamed:@"shareImg"], 1.0),
                      @"fileExtension",
                      UIImageJPEGRepresentation([UIImage imageNamed:@"shareImg"], 1.0),
                      @(SSDKContentTypeAuto),
                      @(SSDKPlatformSubTypeWechatSession)];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        //        NSLog(@"testSSDKSetupWeChatParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupWeChatParamsByText:parametersArray[0]
                                          title:parametersArray[1]
                                            url:parametersArray[2]
                                     thumbImage:parametersArray[3]
                                          image:parametersArray[4]
                                   musicFileURL:parametersArray[5]
                                        extInfo:parametersArray[6]
                                       fileData:parametersArray[7]
                                   emoticonData:parametersArray[8]
                            sourceFileExtension:parametersArray[9]
                                 sourceFileData:parametersArray[10]
                                           type:parametersArray[11]
                             forPlatformSubType:parametersArray[12]];
    }];
}

#pragma mark - SSDKSetupWeChatParamsMini

- (void)testSSDKSetupWeChatParamsMini
{
    NSArray *info = @[@"Title",
                      @"description",
                      [NSURL URLWithString:@"http://www.mob.com"],
                      @"path",
                      [UIImage imageNamed:@"shareImg"],
                      @"userName",
                      @(SSDKPlatformSubTypeWechatSession)];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupWeChatParamsMini %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupWeChatParamsByTitle:parametersArray[0]
                                     description:parametersArray[1]
                                      webpageUrl:parametersArray[2]
                                            path:parametersArray[3]
                                      thumbImage:parametersArray[4]
                                        userName:parametersArray[5]
                              forPlatformSubType:parametersArray[6]];
    }];
}

#pragma mark - SSDKSetupTwitterParams

- (void)testSSDKSetupTwitterParams
{
    NSArray *info = @[@"Text",
                      [UIImage imageNamed:@"shareImg"],
                      @(1.1),
                      @(1.1),
                      @(SSDKPlatformSubTypeWechatSession)];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupTwitterParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupTwitterParamsByText:parametersArray[0]
                                          images:parametersArray[1]
                                        latitude:0.0
                                       longitude:0.0
                                            type:parametersArray[4]];
    }];
}

#pragma mark - SSDKSetupTwitterParamsVideo

- (void)testSSDKSetupTwitterParamsVideo
{
    NSArray *info = @[@"Text",
                      [NSURL URLWithString:@"http://www.mob.com"],
                      @(1.1),
                      @(1.1),
                      @"tag"];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupTwitterParamsVideo %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupTwitterParamsByText:parametersArray[0]
                                           video:parametersArray[1]
                                        latitude:0.0
                                       longitude:0.0
                                             tag:parametersArray[4]];
    }];
}

#pragma mark - SSDKSetupQQParams

- (void)testSSDKSetupQQParams
{
    NSArray *info = @[@"Text",
                      @"title",
                      [NSURL URLWithString:@"http://www.mob.com"],
                      [NSURL URLWithString:@"http://www.mob.com"],
                      [NSURL URLWithString:@"http://www.mob.com"],
                      [UIImage imageNamed:@"shareImg"],
                      [UIImage imageNamed:@"shareImg"],
                      @(SSDKContentTypeAuto),
                      @(SSDKPlatformSubTypeQQFriend),
                      ];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupQQParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupQQParamsByText:parametersArray[0]
                                      title:parametersArray[1]
                                        url:parametersArray[2]
                              audioFlashURL:parametersArray[3]
                              videoFlashURL:parametersArray[4]
                                 thumbImage:parametersArray[5]
                                     images:parametersArray[6]
                                       type:parametersArray[7]
                         forPlatformSubType:parametersArray[8]];
    }];
}

#pragma mark - SSDKSetupFacebookParams

- (void)testSSDKSetupFacebookParams
{
    NSArray *info = @[@"Text",
                      [UIImage imageNamed:@"shareImg"],
                      [NSURL URLWithString:@"http://www.mob.com"],
                      @"urlTitle",
                      @"urlName",
                      [NSURL URLWithString:@"http://www.mob.com"],
                      @(SSDKContentTypeAuto),
                      ];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupFacebookParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupFacebookParamsByText:parametersArray[0]
                                            image:parametersArray[1]
                                              url:parametersArray[2]
                                         urlTitle:parametersArray[3]
                                          urlName:parametersArray[4]
                                   attachementUrl:parametersArray[5]
                                             type:parametersArray[6]];
    }];
}

#pragma mark - SSDKSetupSMSParams

- (void)testSSDKSetupSMSParams
{
    NSArray *info = @[@"Text",
                      @"title",
                      [UIImage imageNamed:@"shareImg"],
                      [UIImage imageNamed:@"shareImg"],
                      @[@"400-1111-111"],
                      @(SSDKContentTypeAuto)
                      ];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupSMSParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupSMSParamsByText:parametersArray[0]
                                       title:parametersArray[1]
                                      images:parametersArray[2]
                                 attachments:parametersArray[3]
                                  recipients:parametersArray[4]
                                        type:parametersArray[5]];
    }];
}

#pragma mark - SSDKSetupMailParams

- (void)testSSDKSetupMailParams
{
    NSArray *info = @[@"Text",
                      @"title",
                      [UIImage imageNamed:@"shareImg"],
                      [UIImage imageNamed:@"shareImg"],
                      @[@"tester2@163.com"],
                      @[@"tester2@163.com"],
                      @[@"tester2@163.com"],
                      @(SSDKContentTypeAuto)
                      ];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupMailParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupMailParamsByText:parametersArray[0]
                                        title:parametersArray[1]
                                       images:parametersArray[2]
                                  attachments:parametersArray[3]
                                   recipients:parametersArray[4]
                                 ccRecipients:parametersArray[5]
                                bccRecipients:parametersArray[6]
                                         type:parametersArray[7]];
    }];
}


#pragma mark - SSDKSetupCopyParams

- (void)testSSDKSetupCopyParams
{
    NSArray *info = @[@"Text",
                      [UIImage imageNamed:@"shareImg"],
                      [NSURL URLWithString:@"http://www.mob.com"],
                      @(SSDKContentTypeAuto)
                      ];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupCopyParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupCopyParamsByText:parametersArray[0]
                                       images:parametersArray[1]
                                          url:parametersArray[2]
                                         type:parametersArray[3]];
    }];
}

#pragma mark - SSDKSetupDouBanParams

- (void)testSSDKSetupDouBanParams
{
    NSArray *info = @[@"Text",
                      [UIImage imageNamed:@"shareImg"],
                      @"title",
                      [NSURL URLWithString:@"http://www.mob.com"],
                      @"urlDesc",
                      @(SSDKContentTypeAuto)
                      ];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupDouBanParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupDouBanParamsByText:parametersArray[0]
                                          image:parametersArray[1]
                                          title:parametersArray[2]
                                            url:parametersArray[3]
                                        urlDesc:parametersArray[4]
                                           type:parametersArray[5]];
    }];
}

#pragma mark - SSDKSetupRenRenParams

- (void)testSSDKSetupRenRenParams
{
    NSArray *info = @[@"Text",
                      [UIImage imageNamed:@"shareImg"],
                      [NSURL URLWithString:@"http://www.mob.com"],
                      @"albumId",
                      @(SSDKContentTypeAuto)
                      ];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"SSDKSetupRenRenParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupRenRenParamsByText:parametersArray[0]
                                          image:parametersArray[1]
                                            url:parametersArray[2]
                                        albumId:parametersArray[3]
                                           type:parametersArray[4]];
    }];
}

#pragma mark - SSDKSetupKaiXinParams

- (void)testSSDKSetupKaiXinParams
{
    NSArray *info = @[@"Text",
                      [UIImage imageNamed:@"shareImg"],
                      @(SSDKContentTypeAuto)
                      ];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"SSDKSetupKaiXinParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupKaiXinParamsByText:parametersArray[0]
                                          image:parametersArray[1]
                                           type:parametersArray[2]];
    }];
}

#pragma mark - SSDKSetupPocketParams

- (void)testSSDKSetupPocketParams
{
    NSArray *info = @[[NSURL URLWithString:@"http://www.mob.com"],
                      @"title",
                      @[@"tag"],
                      @"tweetId"
                      ];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupPocketParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupPocketParamsByUrl:parametersArray[0]
                                         title:parametersArray[1]
                                          tags:parametersArray[2]
                                       tweetId:parametersArray[3]];
    }];
}

#pragma mark - SSDKSetupGooglePlusParams

- (void)testSSDKSetupGooglePlusParams
{
    NSArray *info = @[@"Text",
                      [NSURL URLWithString:@"http://www.mob.com"],
                      @(SSDKContentTypeAuto)
                      ];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupGooglePlusParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupGooglePlusParamsByText:parametersArray[0]
                                                url:parametersArray[1]
                                               type:parametersArray[2]];
    }];
}

#pragma mark - SSDKSetupInstagramParams

- (void)testSSDKSetupInstagramParams
{
    NSArray *info = @[[UIImage imageNamed:@"shareImg"]];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"SSDKSetupInstagram %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupInstagramByImage:parametersArray[0]
                             menuDisplayPoint:CGPointMake(0, 0)];
    }];
}

#pragma mark - SSDKSetupInstagramVideo

- (void)testSSDKSetupInstagramVideo
{
    NSArray *info = @[[NSURL URLWithString:@"http://www.mob.com"]];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"SSDKSetupInstagramVideo %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupInstagramByVideo:parametersArray[0]];
    }];
}

#pragma mark - SSDKSetupLinkedInParams

- (void)testSSDKSetupLinkedInParams
{
    NSArray *info = @[@"Text",
                      [UIImage imageNamed:@"shareImg"],
                      [NSURL URLWithString:@"http://www.mob.com"],
                      @"title",
                      @"urlDesc",
                      @"visibility",
                      @(SSDKContentTypeAuto)];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupLinkedInParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupLinkedInParamsByText:parametersArray[0]
                                            image:parametersArray[1]
                                              url:parametersArray[2]
                                            title:parametersArray[3]
                                          urlDesc:parametersArray[4]
                                       visibility:parametersArray[5]
                                             type:parametersArray[6]];
    }];
}

#pragma mark - SSDKSetupTumblrParams

- (void)testSSDKSetupTumblrParams
{
    NSArray *info = @[@"Text",
                      [UIImage imageNamed:@"shareImg"],
                      [NSURL URLWithString:@"http://www.mob.com"],
                      @"title",
                      @"blogName",
                      @(SSDKContentTypeAuto)];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupTumblrParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupTumblrParamsByText:parametersArray[0]
                                          image:parametersArray[1]
                                            url:parametersArray[2]
                                          title:parametersArray[3]
                                       blogName:parametersArray[4]
                                           type:parametersArray[5]];
    }];
}

#pragma mark - SSDKSetupFlickrParams

- (void)testSSDKSetupFlickrParams
{
    NSArray *info = @[@"Text",
                      [UIImage imageNamed:@"shareImg"],
                      @"title",
                      @[@"tag"],
                      @(YES),
                      @(YES),
                      @(YES),
                      @(1),
                      @(1),
                      @(1)];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupFlickrParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupFlickrParamsByText:parametersArray[0]
                                          image:parametersArray[1]
                                          title:parametersArray[2]
                                           tags:parametersArray[3]
                                       isPublic:parametersArray[4]
                                       isFriend:parametersArray[5]
                                       isFamily:parametersArray[6]
                                    safetyLevel:parametersArray[7]
                                    contentType:parametersArray[8]
                                         hidden:parametersArray[9]];
    }];
}

#pragma mark - SSDKSetupWhatsAppParams

- (void)testSSDKSetupWhatsAppParams
{
    NSArray *info = @[@"Text",
                      [UIImage imageNamed:@"shareImg"],
                      [NSURL URLWithString:@"http://www.mob.com"],
                      [NSURL URLWithString:@"http://www.mob.com"],
                      [NSNull null],
                      @(SSDKContentTypeAuto)];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupWhatsAppParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupWhatsAppParamsByText:parametersArray[0]
                                            image:parametersArray[1]
                                            audio:parametersArray[2]
                                            video:parametersArray[3]
                                 menuDisplayPoint:CGPointMake(0, 0)
                                             type:parametersArray[5]];
    }];
}

#pragma mark - SSDKSetupYouDaoNoteParams

- (void)testSSDKSetupYouDaoNoteParams
{
    NSArray *info = @[@"Text",
                      [UIImage imageNamed:@"shareImg"],
                      @"Title",
                      @"source",
                      @"author",
                      @"notebook"];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupYouDaoNoteParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYouDaoNoteParamsByText:parametersArray[0]
                                             images:parametersArray[1]
                                              title:parametersArray[2]
                                             source:parametersArray[3]
                                             author:parametersArray[4]
                                           notebook:parametersArray[5]];
    }];
}

#pragma mark - SSDKSetupLineParams

- (void)testSSDKSetupLineParams
{
    NSArray *info = @[@"Text",
                      [UIImage imageNamed:@"shareImg"],
                      @(SSDKContentTypeAuto)];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupLineParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupLineParamsByText:parametersArray[0]
                                        image:parametersArray[1]
                                         type:parametersArray[2]];
    }];
}

#pragma mark - SSDKSetupEvernoteParams

- (void)testSSDKSetupEvernoteParams
{
    NSArray *info = @[@"Text",
                      [UIImage imageNamed:@"shareImg"],
                      [NSURL URLWithString:@"http://www.mob.com"],
                      @"title",
                      @"notebook",
                      @[@"tag"],
                      @(SSDKContentTypeAuto)];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupEvernoteParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupEvernoteParamsByText:parametersArray[0]
                                           images:parametersArray[1]
                                            video:parametersArray[2]
                                            title:parametersArray[3]
                                         notebook:parametersArray[4]
                                             tags:parametersArray[5]
                                     platformType:parametersArray[6]];
    }];
}

#pragma mark - SSDKSetupAliPaySocialParams

- (void)testSSDKSetupAliPaySocialParams
{
    NSArray *info = @[@"Text",
                      [UIImage imageNamed:@"shareImg"],
                      @"title",
                      [NSURL URLWithString:@"http://www.mob.com"],
                      @(SSDKContentTypeAuto),
                      @(SSDKPlatformTypeAliSocial)];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupAliPaySocialParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupAliSocialParamsByText:parametersArray[0]
                                                image:parametersArray[1]
                                                title:parametersArray[2]
                                                  url:parametersArray[3]
                                                 type:parametersArray[4]
                                         platformType:parametersArray[5]];
    }];
}


#pragma mark - SSDKSetupPinterestParams

- (void)testSSDKSetupPinterestParams
{
    NSArray *info = @[[UIImage imageNamed:@"shareImg"],
                      @"desc",
                      [NSURL URLWithString:@"http://www.mob.com"],
                      @"boardName"];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupAliPaySocialParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupPinterestParamsByImage:parametersArray[0]
                                               desc:parametersArray[1]
                                                url:parametersArray[2]
                                          boardName:parametersArray[3]];
    }];
}

#pragma mark - SSDKSetupKaKaoParams

- (void)testSSDKSetupKaKaoParamsByText
{
    NSArray *info = @[@"Text",
                      [UIImage imageNamed:@"shareImg"],
                      @"title",
                      [NSURL URLWithString:@"http://www.mob.com"],
                      @"permission",
                      @(YES),
                      [NSNull null],
                      @"appButtonTitle",
                      @{@"key" : @"value"},
                      @"androidMarkParam",
                      @{@"key" : @"value"},
                      @"iphoneMarkParam",
                      @{@"key" : @"value"},
                      @"ipadMarkParam",
                      @(SSDKContentTypeAuto),
                      @(SSDKPlatformSubTypeKakaoTalk)
                      ];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupAliPaySocialParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupKaKaoParamsByText:parametersArray[0]
                                        images:parametersArray[1]
                                         title:parametersArray[2]
                                           url:parametersArray[3]
                                    permission:parametersArray[4]
                                   enableShare:parametersArray[5]
                                     imageSize:CGSizeZero
                                appButtonTitle:parametersArray[7]
                              androidExecParam:parametersArray[8]
                              androidMarkParam:parametersArray[9]
                              iphoneExecParams:parametersArray[10]
                               iphoneMarkParam:parametersArray[11]
                                ipadExecParams:parametersArray[12]
                                 ipadMarkParam:parametersArray[13]
                                          type:parametersArray[14]
                            forPlatformSubType:parametersArray[15]];
    }];
}

#pragma mark - SSDKSetupDropboxParams

- (void)testSSDKSetupDropboxParams
{
    NSArray *info = @[UIImageJPEGRepresentation([UIImage imageNamed:@"shareImg"], 1.0),
                      ];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        //        NSLog(@"testSSDKSetupAliPaySocialParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupDropboxParamsByAttachment:parametersArray[0]];
    }];
}

#pragma mark - SSDKSetupVKontakteParams

- (void)testSSDKSetupVKontakteParams
{
    NSArray *info = @[@"Text",
                      [UIImage imageNamed:@"shareImg"],
                      [NSURL URLWithString:@"http://www.mob.com"],
                      @"groupId",
                      @(YES),
                      @(1.1),
                      @(1.1),
                      @(SSDKContentTypeAuto)
                      ];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupAliPaySocialParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupVKontakteParamsByText:parametersArray[0]
                                            images:parametersArray[1]
                                               url:parametersArray[2]
                                           groupId:parametersArray[3]
                                       friendsOnly:parametersArray[4]
                                          latitude:0.0
                                         longitude:0.0
                                              type:parametersArray[7]];
    }];
}

#pragma mark - SSDKSetupMingDaoParams

- (void)testSSDKSetupMingDaoParams
{
    NSArray *info = @[@"Text",
                      [UIImage imageNamed:@"shareImg"],
                      [NSURL URLWithString:@"http://www.mob.com"],
                      @"title",
                      @(SSDKContentTypeAuto)
                      ];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupAliPaySocialParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupMingDaoParamsByText:parametersArray[0]
                                           image:parametersArray[1]
                                             url:parametersArray[2]
                                           title:parametersArray[3]
                                            type:parametersArray[4]];
    }];
}

#pragma mark - SSDKSetupInstapaperParams

- (void)testSSDKSetupInstapaperParams
{
    NSArray *info = @[[NSURL URLWithString:@"http://www.mob.com"],
                      @"Titel",
                      @"desc",
                      @"content",
                      @(YES),
                      @(1),
                      @(YES)
                      ];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupAliPaySocialParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupInstapaperParamsByUrl:parametersArray[0]
                                             title:parametersArray[1]
                                              desc:parametersArray[2]
                                           content:parametersArray[3]
                               isPrivateFromSource:parametersArray[4]
                                          folderId:parametersArray[5]
                                   resolveFinalUrl:parametersArray[6]];
    }];
}

#pragma mark - SSDKSetupYiXinParams

- (void)testSSDKSetupYiXinParams
{
    NSArray *info = @[@"Text",
                      @"Titel",
                      [NSURL URLWithString:@"http://www.mob.com"],
                      [UIImage imageNamed:@"shareImg"],
                      [UIImage imageNamed:@"shareImg"],
                      [NSURL URLWithString:@"http://www.mob.com"],
                      @"extInfo",
                      UIImageJPEGRepresentation([UIImage imageNamed:@"shareImg"], 1.0),
                      @"comment",
                      @"toUserId",
                      @(SSDKContentTypeAuto),
                      @(SSDKPlatformSubTypeYiXinSession)
                      ];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        //        NSLog(@"testSSDKSetupAliPaySocialParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYiXinParamsByText:parametersArray[0]
                                         title:parametersArray[1]
                                           url:parametersArray[2]
                                    thumbImage:parametersArray[3]
                                         image:parametersArray[4]
                                  musicFileURL:parametersArray[5]
                                       extInfo:parametersArray[6]
                                      fileData:parametersArray[7]
                                       comment:parametersArray[8]
                                      toUserId:parametersArray[9]
                                          type:parametersArray[10]
                            forPlatformSubType:parametersArray[11]];
    }];
}

#pragma mark - SSDKSetupFacebookMessengerParams

- (void)testSSDKSetupFacebookMessengerParams
{
    NSArray *info = @[@"Text",
                      [NSURL URLWithString:@"http://www.mob.com"],
                      @"quoteText",
                      [UIImage imageNamed:@"shareImg"],
                      [UIImage imageNamed:@"shareImg"],
                      [NSURL URLWithString:@"http://www.mob.com"],
                      [NSURL URLWithString:@"http://www.mob.com"],
                      @(SSDKContentTypeAuto),
                      ];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupAliPaySocialParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupFacebookMessengerParamsByTitle:parametersArray[0]
                                                        url:parametersArray[1]
                                                  quoteText:parametersArray[2]
                                                     images:parametersArray[3]
                                                        gif:parametersArray[4]
                                                      audio:parametersArray[5]
                                                      video:parametersArray[6]
                                                       type:parametersArray[7]];
    }];
}

#pragma mark - SSDKSetupDingTalkParams

- (void)testSSDKSetupDingTalkParams
{
    NSArray *info = @[@"Text",
                      [UIImage imageNamed:@"shareImg"],
                      @"title",
                      [NSURL URLWithString:@"http://www.mob.com"],
                      @(SSDKContentTypeAuto),
                      ];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupAliPaySocialParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupDingTalkParamsByText:parametersArray[0]
                                            image:parametersArray[1]
                                            title:parametersArray[2]
                                              url:parametersArray[3]
                                             type:parametersArray[4]];
    }];
}

#pragma mark - SSDKSetupMeiPaiParams

- (void)testSSDKSetupMeiPaiParams
{
    NSArray *info = @[[NSURL URLWithString:@"http://www.mob.com"],
                      @(SSDKContentTypeAuto)
                      ];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupAliPaySocialParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupMeiPaiParamsByUrl:parametersArray[0]
                                          type:parametersArray[1]];
    }];
}

#pragma mark - SSDKSetupYouTubeParamsByVideo

- (void)testSSDKSetupYouTubeParamsByVideo
{
    NSArray *info = @[[NSURL URLWithString:@"http://www.mob.com"],
                      @"title",
                      @"description",
                      @[@"tag"],
                      @(1)
                      ];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupAliPaySocialParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYouTubeParamsByVideo:parametersArray[0]
                                            title:parametersArray[1]
                                      description:parametersArray[2]
                                             tags:parametersArray[3]
                                    privacyStatus:parametersArray[4]];
    }];
}

#pragma mark - SSDKSetupYouTubeParams

- (void)testSSDKSetupYouTubeParams
{
    NSArray *info = @[[NSURL URLWithString:@"http://www.mob.com"],
                      @"parts",
                      @"jsonString"
                      ];
    [self checkParameter:info callback:^(NSArray *parametersArray) {
        NSLog(@"testSSDKSetupAliPaySocialParams %@",parametersArray);
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupYouTubeParamsByVideo:parametersArray[0]
                                            parts:parametersArray[1]
                                       jsonString:parametersArray[2]];
    }];
}

@end
