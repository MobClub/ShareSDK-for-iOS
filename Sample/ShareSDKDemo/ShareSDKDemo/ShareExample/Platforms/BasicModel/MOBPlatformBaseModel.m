//
//  MOBPlatformBaseModel.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/15.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBPlatformBaseModel.h"
#import <ShareSDKExtension/ShareSDK+Extension.h>
#import "MOBShareExample.h"
#import <time.h>
#import <dlfcn.h>
#import <mach-o/ldsyms.h>
#import <MOBFoundation/MOBFoundation.h>

unsigned int count;
const char **classes;
Dl_info info;

void * kMOBPlatformAuthItemModelKey = &kMOBPlatformAuthItemModelKey;
static time_t lasShareTime;

@interface MOBPlatformBaseModel (ext)

- (void)setCurrentShareModel:(MOBSharePlatformShareItemModel *)currentShareModel;

- (void)shareWithPlatformModel:(MOBSharePlatformShareItemModel *)model;

@end



@interface MOBSharePlatformShareItemModel ()

@property (nonatomic, strong) MOBShareItemUI *itemUI;

@property (nonatomic, copy) NSString *method;

@property (nonatomic, copy) void (^methodBlock)(MOBPlatformBaseModel *model, NSMutableDictionary *para);

@end

@implementation MOBSharePlatformShareItemModel


#pragma mark - 分享 -
- (void)share{
    if (time(NULL) - lasShareTime <= 3 && lasShareTime > 0) return;
    lasShareTime = time(NULL);
    self.platformModel.currentShareModel = self;
    if (self.method) {
        [self.platformModel performSelectorWithArguments:NSSelectorFromString(self.method)];
    }else if (self.methodBlock){
        self.methodBlock(self.platformModel,[NSMutableDictionary dictionary]);
    }
}
+ (NSArray *)modelPropertyBlacklist{
    return @[@"platformModel"];
}
@end

static NSArray <NSArray <NSNumber *>*>*mobPlatforms = nil;
static NSArray <NSNumber *>*mobAllowAuthPlatforms = nil;

NSBundle * const MOBPlatformBundle (void){
    static NSBundle *b = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"ShareSDKUI" ofType:@"bundle"];
        b = [NSBundle bundleWithPath:bundlePath];
    });
    return b;
}

@interface MOBPlatformBaseModel (){
    NSArray * _platformTyps;
}

@property (nonatomic, strong) NSMutableDictionary *typesMap;

@property (nonatomic, strong) MOBSharePlatformShareItemModel *currentShareModel;

@property (nonatomic, strong) NSMutableArray *platformsArray;

@property (nonatomic, strong) NSMutableDictionary *settings;

@property (nonatomic, copy) void (^ getUserInfoHandler) (SSDKResponseState state, SSDKUser* user, NSError *error);

@property (nonatomic, copy) void (^ authHandler) (SSDKResponseState state, SSDKUser* user, NSError *error);

@property (nonatomic, copy) void (^ shareHandler) (SSDKResponseState state, NSDictionary *userData, SSDKContentEntity* contentEntity,  NSError *error);

@property (nonatomic, strong) NSMutableArray <void (^) (SSDKResponseState state, SSDKUser* user, NSError *error)>* authBlocks;

@property (nonatomic, strong) NSMutableArray <void (^) (SSDKResponseState state, SSDKUser* user, NSError *error)>* getuserBlocks;

@property (nonatomic, strong) NSMutableArray <void (^) (SSDKResponseState state, NSError *error)>* revokeUserBlocks;

@end

//platformType与class对应的map
static NSDictionary <NSNumber *,NSString *>* _platformMap = nil;

@implementation MOBPlatformBaseModel

+ (void)load{
//    NSLog(@"super---123123123123123");
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //国内,海外
        mobPlatforms = @[
            @[
                @(SSDKPlatformTypeOasis),
                @(SSDKPlatformTypeDouyin),
                @(SSDKPlatformSubTypeQQFriend),
                @(SSDKPlatformSubTypeQZone),
                @(SSDKPlatformSubTypeWechatSession),
                @(SSDKPlatformSubTypeWechatTimeline),
                @(SSDKPlatformSubTypeWechatFav),
                @(SSDKPlatformTypeSinaWeibo),
                @(SSDKPlatformTypeAliSocial),
                @(SSDKPlatformTypeAliSocialTimeline),
                @(SSDKPlatformTypeDingTalk),
                @(SSDKPlatformTypeYinXiang),
                @(SSDKPlatformTypeYouDaoNote),
                @(SSDKPlatformTypeMingDao),
                @(SSDKPlatformSubTypeYiXinSession),
                @(SSDKPlatformSubTypeYiXinTimeline),
                @(SSDKPlatformSubTypeYiXinFav),
                @(SSDKPlatformTypeWework),
                @(SSDKPlatformTypeFacebookAccount),
                @(SSDKPlatformTypeWatermelonVideo),
                @(SSDKPlatformTypeKuaiShou)
            ],
            @[
                @(SSDKPlatformTypeFacebook),
                @(SSDKPlatformTypeTikTok),
                @(SSDKPlatformTypeFacebookMessenger),
                @(SSDKPlatformTypeTwitter),
                @(SSDKPlatformTypeWhatsApp),
                @(SSDKPlatformTypeLine),
                @(SSDKPlatformTypeSnapChat),
                @(SSDKPlatformTypeGooglePlus),
                @(SSDKPlatformSubTypeKakaoTalk),
                @(SSDKPlatformSubTypeKakaoStory),
                @(SSDKPlatformTypeYouTube),
                @(SSDKPlatformTypeInstagram),
                @(SSDKPlatformTypeFlickr),
                @(SSDKPlatformTypeDropbox),
                @(SSDKPlatformTypeEvernote),
                @(SSDKPlatformTypePinterest),
                @(SSDKPlatformTypePocket),
                @(SSDKPlatformTypeLinkedIn),
                @(SSDKPlatformTypeVKontakte),
                @(SSDKPlatformTypeInstapaper),
                @(SSDKPlatformTypeTumblr),
                @(SSDKPlatformTypeTelegram),
                @(SSDKPlatformTypeReddit)
            ]];
        mobAllowAuthPlatforms = @[
            @(SSDKPlatformTypeDouyin),
            @(SSDKPlatformTypeTikTok),
            @(SSDKPlatformTypeQQ),
            @(SSDKPlatformTypeWechat),
            @(SSDKPlatformTypeSinaWeibo),
            @(SSDKPlatformTypeDingTalk),
            @(SSDKPlatformTypeYinXiang),
            @(SSDKPlatformTypeYouDaoNote),
            @(SSDKPlatformTypeMingDao),
            @(SSDKPlatformTypeYiXin),
            @(SSDKPlatformTypeFacebookAccount),
            @(SSDKPlatformTypeWework),
            @(SSDKPlatformTypeAppleAccount),
            @(SSDKPlatformTypeFacebook),
            @(SSDKPlatformTypeTwitter),
            @(SSDKPlatformTypeGooglePlus),
            @(SSDKPlatformTypeLine),
            @(SSDKPlatformTypeSnapChat),
            @(SSDKPlatformTypeKakao),
            @(SSDKPlatformTypeInstagram),
            @(SSDKPlatformTypeFlickr),
            @(SSDKPlatformTypeDropbox),
            @(SSDKPlatformTypeEvernote),
            @(SSDKPlatformTypeLinkedIn),
            @(SSDKPlatformTypeVKontakte),
            @(SSDKPlatformTypeInstapaper),
            @(SSDKPlatformTypePocket),
            @(SSDKPlatformTypeTumblr),
            @(SSDKPlatformTypeTelegram),
            @(SSDKPlatformTypeReddit),
            @(SSDKPlatformTypeKuaiShou)
        ];
        
        NSMutableDictionary *platformMap = [NSMutableDictionary dictionary];
//        unsigned int count = 0;
//        Class *classes = objc_copyClassList(&count);
        Class baseClass = [MOBPlatformBaseModel class];
        
        //1.获取app的路径
        dladdr(&_mh_execute_header, &info);
            
        //2.返回当前运行的app的所有类的名字，并传出个数
        //classes：二维数组 存放所有类的列表名称
        //count：所有的类的个数
        classes = objc_copyClassNamesForImage(info.dli_fname, &count);
        
        
        for (unsigned int i = 0; i < count; i++) {
//            Class class = classes[i];
//            NSString *className = NSStringFromClass(class);
            NSString *className = [NSString stringWithCString:classes[i] encoding:NSUTF8StringEncoding];
            Class class = NSClassFromString(className);
            
            if (![className hasPrefix:@"MOBPlatform"]) continue;
            if ([class isKindOfClass:object_getClass(baseClass)] && class != baseClass) {
                [platformMap setObject:className forKey:@([class platformType])];
            }
        }
        free(classes);
        _platformMap = platformMap.copy;
        
    });
}

+ (SSDKPlatformType)convertPlatformTypeWithPlatformType:(SSDKPlatformType)platformType{
    switch (platformType) {
        case SSDKPlatformSubTypeQQFriend:
        case SSDKPlatformSubTypeQZone:
            return SSDKPlatformTypeQQ;
        case SSDKPlatformSubTypeWechatSession:
        case SSDKPlatformSubTypeWechatFav:
        case SSDKPlatformSubTypeWechatTimeline:
            return SSDKPlatformTypeWechat;
        case SSDKPlatformTypeAliSocialTimeline:
            return SSDKPlatformTypeAliSocial;
        case SSDKPlatformSubTypeYiXinSession:
        case SSDKPlatformSubTypeYiXinTimeline:
        case SSDKPlatformSubTypeYiXinFav:
            return SSDKPlatformTypeYiXin;
        case SSDKPlatformSubTypeKakaoStory:
        case SSDKPlatformSubTypeKakaoTalk:
            return SSDKPlatformTypeKakao;
        default:
            return platformType;
            break;
    }
}

+ (SSDKPlatformType)convertPlatformImageTypeWithPlatformType:(SSDKPlatformType)platformType{
    switch (platformType) {
        case SSDKPlatformTypeQQ:
        case SSDKPlatformSubTypeQZone:
            return SSDKPlatformSubTypeQQFriend;
        case SSDKPlatformTypeWechat:
        case SSDKPlatformSubTypeWechatFav:
        case SSDKPlatformSubTypeWechatTimeline:
            return SSDKPlatformSubTypeWechatSession;
        case SSDKPlatformTypeAliSocialTimeline:
            return SSDKPlatformTypeAliSocial;
        case SSDKPlatformTypeYiXin:
        case SSDKPlatformSubTypeYiXinTimeline:
        case SSDKPlatformSubTypeYiXinFav:
            return SSDKPlatformSubTypeYiXinSession;
        case SSDKPlatformTypeKakao:
        case SSDKPlatformSubTypeKakaoStory:
            return SSDKPlatformSubTypeKakaoTalk;
        case SSDKPlatformTypeFacebookAccount:
            return SSDKPlatformTypeFacebook;
        default:
            return platformType;
            break;
    }
}

+ (instancetype)initWithPlatformType:(SSDKPlatformType)platformType{
    NSString *className = _platformMap[@(platformType)];
    Class clas = NSClassFromString(className);
    if (clas) {
        return [clas new];
    }
    return nil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _platformsArray = [NSMutableArray array];
        [self setup];
        [self dataInit];
    }
    return self;
}

- (void)setup{
    
}


- (NSMutableArray<void (^)(SSDKResponseState, SSDKUser *, NSError *)> *)authBlocks{
    if (!_authBlocks) {
        _authBlocks = [NSMutableArray array];
    }
    return _authBlocks;
}

- (NSMutableArray<void (^)(SSDKResponseState, SSDKUser *, NSError *)> *)getuserBlocks{
    if (!_getuserBlocks) {
        _getuserBlocks = [NSMutableArray array];
    }
    return _getuserBlocks;
}

- (NSMutableArray<void (^)(SSDKResponseState, NSError *)> *)revokeUserBlocks{
    if (!_revokeUserBlocks) {
        _revokeUserBlocks = [NSMutableArray array];
    }
    return _revokeUserBlocks;
}

- (void)dataInit{
    _typesMap = [NSMutableDictionary dictionary];
    
    NSInteger index = 0;
    
    NSNumber *number = @(self.platformType);
    
    while (index < mobPlatforms.count) {
        if ([mobPlatforms[index] containsObject:number]) {
            _type = index;
            break;
        }
        index ++;
    }
    
    if (index == mobPlatforms.count) {
        _type = index;
    }
    
    _isAllowAuth = [mobAllowAuthPlatforms containsObject:@(self.converntPlatformType)];

    unsigned int count = 0;
    
    Method *list = class_copyMethodList(self.class, &count);
    unsigned int protocolListCount = 0;
    struct objc_method_description *protocolList = protocol_copyMethodDescriptionList(@protocol(MOBPlatformMethodProtocol), NO, YES, &protocolListCount);
    
    NSMutableArray *illegaMehtod = [NSMutableArray array];
    for (unsigned int i = 0; i < protocolListCount; i++) {
        struct objc_method_description des = protocolList[i];
        NSString *string = NSStringFromSelector(des.name);
        if ([string hasPrefix:@"share"]) {
            [illegaMehtod addObject:string];
        }
    }
    
    for (unsigned int i = 0; i < count; i++) {
        SEL sel = method_getName(list[i]);
        NSString *string = NSStringFromSelector(sel);
        if ([illegaMehtod containsObject:string]) {
            MOBSharePlatformShareItemModel *model = [MOBSharePlatformShareItemModel new];
            model.platformModel = self;
            model.method = string;
            [_typesMap setValue:model forKey:string];
        }
    }
    
    NSMutableArray *platformTyps = [NSMutableArray array];
    
    for (int i = 0; i < listPriority().count; i++) {
        MOBPlatfromMethodStyleModel *model = listPriority()[i];
        MOBSharePlatformShareItemModel *itemModel = self.typesMap[model.method];
        if (itemModel) {
            MOBShareItemUI *ui = [MOBShareItemUI new];
            ui.image = model.image;
            ui.name = model.text;
            ui.styleType = i;
            itemModel.itemUI = ui;
            [platformTyps addObject:itemModel];
        }
    }
    
    _platformsArray.addObjectsChain(platformTyps);
    
    MOBShareItemUI *ui = [MOBShareItemUI new];
    
    NSString *platformTypeName = [NSString stringWithFormat:@"ShareType_%lu",(unsigned long)self.platformType];
    NSString *title = NSLocalizedStringWithDefaultValue(platformTypeName, @"ShareSDKUI_Localizable", MOBPlatformBundle(), platformTypeName, nil);
    #define NSLocalizedStringWithDefaultValue(key, tbl, bundle, val, comment) \
    [bundle localizedStringForKey:(key) value:(val) table:(tbl)]
    ui.name = title;
    NSString *iconName = [NSString stringWithFormat:@"sns_icon_%ld",(long)[self platformType]];
    ui.image = UIImageNamed(iconName);
    _itemUI = ui;
    free(protocolList);
    free(list);
}

- (NSArray<MOBSharePlatformShareItemModel *> *)platformTyps{
    if (!_platformTyps) {
        _platformTyps =  [self.platformsArray sortedArrayUsingComparator:^NSComparisonResult(MOBSharePlatformShareItemModel*  _Nonnull obj1, MOBSharePlatformShareItemModel*  _Nonnull obj2) {
            NSInteger number = obj1.itemUI.styleType - obj2.itemUI.styleType;
            if (number == 0) {
                number = obj1.itemUI.name.length - obj2.itemUI.name.length;
            }
            return number;
        }];
    }
    return _platformTyps;
}

- (void)isInstallApp{
    NSString *title = @"";
    if([ShareSDK isClientInstalled:self.platformType])
    {
        title = @"已安装";
    }
    else
    {
        title = @"未安装";
    }
    
    UIAlertControllerAlertCreate(title, nil)
    .addCancelAction(@"确定")
    .present();
}

#pragma mark - 分享 -

- (void)shareWithParameters:(NSMutableDictionary *)parameters{
    [parameters SSDKSetShareFlags:@[NSStringFromClass([self class])]];
    self.currentShareModel.parameters = parameters;
    [self sharePlatform];
}

- (void)sharePlatform{
    //分享
    NSLog(@"%@", self.currentShareModel.yy_modelDescription);
    //常规分享调用这个方法
    [ShareSDK share:self.platformType
         parameters:self.currentShareModel.parameters.mutableCopy
     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        lasShareTime = 0;
        [[MOBShareExample defaultExample] sharePlatType:self.platformType userData:userData state:state error:error];

        if (self.shareHandler) {
            self.shareHandler(state, userData, contentEntity, error);
        }
        if (self.currentShareModel.shareHandler) {
            self.currentShareModel.shareHandler(state, userData, contentEntity, error);
        }
    }];
}

- (void)shareByActivityWithParameters:(NSMutableDictionary *)parameters{
    [parameters SSDKSetShareFlags:@[NSStringFromClass([self class])]];
    self.currentShareModel.parameters = parameters;
    [self sharePlatformByActivity];
}

- (void)sharePlatformByActivity{
    //分享
    NSLog(@"%@", self.currentShareModel.yy_modelDescription);
    //系统分享调用这个方法
    [ShareSDK shareByActivityViewController:self.platformType parameters:self.currentShareModel.parameters.mutableCopy onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        lasShareTime = 0;
        [[MOBShareExample defaultExample] sharePlatType:self.platformType userData:userData state:state error:error];

        if (self.shareHandler) {
            self.shareHandler(state, userData, contentEntity, error);
        }
        if (self.currentShareModel.shareHandler) {
            self.currentShareModel.shareHandler(state, userData, contentEntity, error);
        }
    }];
}

#pragma mark - 授权和获取用户信息 -

- (void)setAuthSetting:(NSDictionary *)setting{
    self.settings = setting.mutableCopy;
}

//具体的本地苹果登录成功后，和后台的对接，需要客户自行编写逻辑，本demo只是简单的将数据存储到userdefaults中，用于revoke使用!
- (void)getAccessToken:(NSString *)code token:(NSString *)token completion:(void(^)(SSDKResponseState state,NSDictionary *rstData,NSError *error))completion
{
    
    NSString *url = @"http://47.101.164.72:8080/token";
    url=[NSString stringWithFormat:@"%@?code=%@&id_token=%@",url,code,token];
    [MOBFHttpService sendHttpRequestByURLString:url
                                         method:kMOBFHttpMethodPost
                                     parameters:nil
                                        headers:@{@"Content-Type":@"application/json"}
                                       onResult:^(NSHTTPURLResponse *response, NSData *responseData) {

                                            NSDictionary *dict = [MOBFJson objectFromJSONData:responseData];
                                            if(dict && dict[@"access_token"])
                                            {
                                                //进行存储
                                                //accessTokenDict = dict;
                                                [[NSUserDefaults standardUserDefaults] setObject:dict forKey:@"apple_access_token"];
                                                [[NSUserDefaults standardUserDefaults] synchronize];
                                                
                                                if(completion)
                                                {
                                                    completion(SSDKResponseStateFail,dict,nil);
                                                }
                                            } else {
                                                
                                                if(completion)
                                                {
                                                    completion(SSDKResponseStateFail,dict,nil);
                                                }
                                            }


                                       }
                                        onFault:^(NSError *error) {
                                            if(completion)
                                            {
                                                completion(SSDKResponseStateFail,nil,error);
                                            }
                                        }
                               onUploadProgress:nil];
}

- (void)revokeUserByAccToken:(void(^)(SSDKResponseState state,NSError *error))completion
{
    //revoke接口,传递网络数据
    
    //通过token接口获取到的user refresh token or access token
    //jwt由服务端token接口返回的id_token
    //client_secret
    NSDictionary *accessTokenDict =                                                 [[NSUserDefaults standardUserDefaults] objectForKey:@"apple_access_token"];

    
    NSString *url = @"http://47.101.164.72:8080/revoke";
    url=[NSString stringWithFormat:@"%@?token=%@&id_token=%@",url,accessTokenDict[@"access_token"]   ,accessTokenDict[@"id_token"]];
    [MOBFHttpService sendHttpRequestByURLString:url
                                         method:kMOBFHttpMethodPost
                                     parameters:nil
                                        headers:@{@"Content-Type":@"application/json"}
                                       onResult:^(NSHTTPURLResponse *response, NSData *responseData) {

                                            if(response.statusCode == 200)
                                            {
                                                if(completion)
                                                {
                                                    completion(SSDKResponseStateSuccess,nil);
                                                }
                                            } else {
                                                if(completion)
                                                {
                                                    completion(SSDKResponseStateFail,nil);
                                                }
                                            }

                                       }
                                        onFault:^(NSError *error) {
                                            if(completion)
                                            {
                                                completion(SSDKResponseStateFail,error);
                                            }
                                        }
                               onUploadProgress:nil];
}

- (void)auth{
    [[SSDKScenePackage defaultPackage] recordWindowKey:@"key"];
    [ShareSDK authorize:self.platformType settings:self.settings onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[MOBShareExample defaultExample] authResponseStatus:state error:error];
            [self.authBlocks.copy enumerateObjectsUsingBlock:^(void (^ _Nonnull obj)(SSDKResponseState, SSDKUser *, NSError *), NSUInteger idx, BOOL
                                                               * _Nonnull stop) {
                [self getAccessToken:user.credential.authCode token:user.credential.token completion:^(SSDKResponseState state, NSDictionary *rstData, NSError *error) {
                    
                }];
                
                obj(state, user, error);
            }];
        });
    }];
}

- (void)setAuthHandler:(void (^)(SSDKResponseState, SSDKUser * _Nonnull, NSError * _Nonnull))authHandler{
    if (authHandler) {
        [self.authBlocks addObject:[authHandler copy]];
    }
}

- (void)setGetUserInfoHandler:(void (^)(SSDKResponseState, SSDKUser * _Nonnull, NSError * _Nonnull))getUserInfoHandler{
    if (getUserInfoHandler) {
        [self.getuserBlocks addObject:[getUserInfoHandler copy]];
    }

}
- (void)getUserInfo{
    [ShareSDK getUserInfo:self.platformType onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        [self.getuserBlocks.copy enumerateObjectsUsingBlock:^(void (^ _Nonnull obj)(SSDKResponseState, SSDKUser *, NSError *), NSUInteger idx, BOOL * _Nonnull stop) {
            obj(state, user, error);
        }];
    }];
}

- (void)setRevokeUserHandler:(void (^ _Nonnull)(SSDKResponseState state, NSError * _Nonnull error))revokeHandler
{
    if(self.revokeUserBlocks)
    {
        [self.revokeUserBlocks addObject:[revokeHandler copy]];
    }
}

//revoke用户
- (void)revokeUser
{
    [self revokeUserByAccToken:^(SSDKResponseState state, NSError *error) {
        
        [self.revokeUserBlocks.copy enumerateObjectsUsingBlock:^(void (^ _Nonnull obj)(SSDKResponseState, NSError *), NSUInteger idx, BOOL * _Nonnull stop) {
                if(state == SSDKResponseStateSuccess)
                    [self cancelAuth];
                obj(state, nil);
        }];
    }];
    

}


#pragma mark - 添加自定义的分享选项 -

- (void)addListItemWithImage:(NSString *)image name:(NSString *)name method:(nonnull void (^)(MOBPlatformBaseModel * _Nonnull, NSMutableDictionary * _Nonnull))method{
    NSArray *imageNames = [listPriority() valueForKey:@"image"];
    MOBSharePlatformShareItemModel *model = [MOBSharePlatformShareItemModel new];
    MOBShareItemUI *ui = [MOBShareItemUI new];
    ui.image = UIImageNamed(image);
    ui.styleType = [imageNames indexOfObject:ui.image];
    if (ui.styleType < 0) {
        ui.styleType = 10000;
    }
    
    ui.name = name;
    model.platformModel = self;
    model.itemUI = ui;
    model.methodBlock = method;
    [self.platformsArray addObject:model];
}

#pragma mark - Other -

- (NSDictionary<NSString *,MOBSharePlatformShareItemModel *> *)typesMap{
    return _typesMap.copy;
}

- (SSDKPlatformType)platformType{
    return [[self class] platformType];
}

- (SSDKPlatformType)converntPlatformType{
    return [[self class] converntPlatformType];
}

+ (SSDKPlatformType)converntPlatformType{
    return [[self class] convertPlatformTypeWithPlatformType:self.platformType];
}

- (SSDKPlatformType)converntImagePlatformType{
    return [[self class] convertPlatformImageTypeWithPlatformType:self.platformType];
}

+ (NSArray <MOBPlatformBaseModel *> *)totalModels{
    NSMutableArray *array = [NSMutableArray array];
    NSArray *platformTypes = [_platformMap.allKeys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 integerValue] > [obj2 integerValue];
    }];
    for (NSNumber *platformType in platformTypes) {
        array.addObjectChain(NSClassFromString(_platformMap[platformType]).new);
    }
    return array;
}

- (void)cancelAuth{
    [ShareSDK cancelAuthorize:self.platformType result:^(NSError *error) {
        [[self getAssociateValueByKey:kMOBPlatformAuthItemModelKey] performSelectorWithArguments:NSSelectorFromString(@"cancelAuth")];
    }];
}

@end
