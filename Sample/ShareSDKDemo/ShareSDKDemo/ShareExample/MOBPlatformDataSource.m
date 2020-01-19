//
//  MOBPlatformDataSource.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/16.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBPlatformDataSource.h"
#import "MOBAuthItemModel.h"
#import "MOBShareContentActionModel.h"
@interface MOBPlatformDataSource ()

@property (nonatomic, strong) NSMutableArray *allPlatforms;

@property (nonatomic, strong) NSArray *shareWithContentData;

@property (nonatomic, strong) NSArray *authPlatform;

@end

@implementation MOBPlatformDataSource

+ (MOBPlatformDataSource *)dataSource{
    static MOBPlatformDataSource *dataSource = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataSource = [MOBPlatformDataSource new];
        [dataSource setup];
    });
    return dataSource;
}

- (void)setup{
    _allPlatforms = [NSMutableArray array];

//    _allPlatforms.addObjectsChain([MOBPlatformBaseModel totalModels]);
    
    NSArray *platforms = @[
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
        @(SSDKPlatformTypeTencentWeibo),
        @(SSDKPlatformTypeDouBan),
        @(SSDKPlatformTypeMeiPai),
        @(SSDKPlatformTypeYinXiang),
        @(SSDKPlatformTypeYouDaoNote),
        @(SSDKPlatformTypeMingDao),
        @(SSDKPlatformTypeKaixin),
        @(SSDKPlatformTypeRenren),
        @(SSDKPlatformSubTypeYiXinSession),
        @(SSDKPlatformSubTypeYiXinTimeline),
        @(SSDKPlatformSubTypeYiXinFav),
        @(SSDKPlatformTypeCMCC),
        @(SSDKPlatformTypeESurfing),
        @(SSDKPlatformTypeFacebookAccount),
        @(SSDKPlatformTypeWework),
        @(SSDKPlatformTypeAppleAccount),
        @(SSDKPlatformTypeFacebook),
        @(SSDKPlatformTypeFacebookMessenger),
        @(SSDKPlatformTypeTwitter),
        @(SSDKPlatformTypeWhatsApp),
        @(SSDKPlatformTypeLine),
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
        @(SSDKPlatformTypeReddit),
        @(SSDKPlatformTypeSMS),
        @(SSDKPlatformTypeMail),
        @(SSDKPlatformTypeCopy),
        @(SSDKPlatformTypePrint)
    ];
    
    [self addPlatformTypes:platforms];
    
    NSInteger count = _allPlatforms.count;
    
    //授权数据源
    NSMutableArray <NSMutableArray *>*authDataSource = [NSMutableArray arrayWithObjects:@[].mutableCopy,@[].mutableCopy,@[].mutableCopy, nil];
    
    NSMutableArray *shareContentArray = [NSMutableArray array];
    
    //按内容展示的列表
    NSArray *list = listPriority();
    
    //用来标记是否已经添加过授权
    NSMutableArray *addAuthTypes = [NSMutableArray array];
    
    //按平台分享数据源
    NSMutableArray *sharePlatformDataSource = [NSMutableArray arrayWithObjects:@"",@"",@"", nil];
    
    for (int i = 0; i < count; i++) {
        MOBPlatformBaseModel *model = _allPlatforms[i];
        if (model.isAllowAuth && ![addAuthTypes containsObject:@(model.converntPlatformType)]) {
            MOBAuthItemModel *authItemModel = [MOBAuthItemModel new];
            authItemModel.model = model;
            [authDataSource[model.type] addObject:authItemModel];
            [addAuthTypes addObject:@(model.converntPlatformType)];
        }
        if ([sharePlatformDataSource[model.type] isKindOfClass:[NSString class]]) {
            [sharePlatformDataSource replaceObjectAtIndex:model.type withObject:[NSMutableArray array]];
        }
        if (model.platformTyps.count > 0) {
            [sharePlatformDataSource[model.type] addObject:model];
        }
        for (int j = 0 ; j < list.count;  j++) {
            MOBShareContentActionModel *actionModel = [shareContentArray safe_objectAtIndex:j];
            MOBPlatfromMethodStyleModel *styleModel = list[j];
            if (!actionModel) {
                actionModel = [MOBShareContentActionModel new];
                [shareContentArray addObject:actionModel];
                actionModel.name = styleModel.text;
                actionModel.image = styleModel.headerImage;
                actionModel.selectedImage = styleModel.selectedHeaderImage;
            }
            [actionModel addItemModel:model.typesMap[styleModel.method] type:model.type];
        }
    }
   
    _shareWithPlatformsData = sharePlatformDataSource;
    _shareWithContentData = shareContentArray.copy;
    _authPlatform = authDataSource;
}



- (void)addPlatformTypes:(NSArray <NSNumber *> *)types{
    for (NSNumber *platformType in types) {
        _allPlatforms.addObjectChain([MOBPlatformBaseModel initWithPlatformType:[platformType integerValue]]);
    }
}


@end
