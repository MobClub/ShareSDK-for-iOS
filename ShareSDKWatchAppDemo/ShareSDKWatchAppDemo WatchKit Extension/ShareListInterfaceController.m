//
//  ShareListInterfaceController.m
//  ShareSDKWatchAppDemo
//
//  Created by 刘 靖煌 on 15/5/15.
//  Copyright (c) 2015年 游族网络MOB事业部. All rights reserved.
//

#import "ShareListInterfaceController.h"
#import "PlatformRow.h"
#import "ResultInterfaceController.h"

@interface ShareListInterfaceController ()

@property (nonatomic, strong)NSArray *platArr;

@end

@implementation ShareListInterfaceController

- (void)awakeWithContext:(id)context
{
    [super awakeWithContext:context];
    
    //可以不依赖iOS客户端进行分享的平台：

//    typedef enum
//    {
//        ShareTypeSinaWeibo = 1,         /**< 新浪微博 */
//        ShareTypeTencentWeibo = 2,      /**< 腾讯微博 */
//        ShareTypeDouBan = 5,            /**< 豆瓣社区 */
//        ShareTypeRenren = 7,            /**< 人人网 */
//        ShareTypeKaixin = 8,            /**< 开心网 */
//        ShareTypeFacebook = 10,         /**< Facebook */
//        ShareTypeTwitter = 11,          /**< Twitter */
//        ShareTypeEvernote = 12,         /**< 印象笔记 */
//        ShareTypeLinkedIn = 16,         /**< LinkedIn */
//        ShareTypeTumblr = 17,           /**< Tumbir */
//        ShareTypeInstapaper = 25,       /**< Instapaper */
//        ShareTypePocket = 26,           /**< Pocket */
//        ShareTypeYouDaoNote = 27,       /**< 有道云笔记 */
//        ShareTypeSohuKan = 28,          /**< 搜狐随身看 */
//        ShareTypeFlickr = 34,           /**< Flickr */
//        ShareTypeDropbox = 35,          /**< Dropbox */
//        ShareTypeVKontakte = 36,        /**< VKontakte */
//        ShareTypeMingDao = 41,          /**< 明道 */
//    }
//    ShareType;
    
    self.platArr = @[@{@"platImg":@"sns_icon_01",@"platName":@"新浪微博",@"platformTag":@"1"},
                     @{@"platImg":@"sns_icon_2",@"platName":@"腾讯微博",@"platformTag":@"2"},
                     @{@"platImg":@"sns_icon_5",@"platName":@"豆瓣社区",@"platformTag":@"5"},
                     @{@"platImg":@"sns_icon_7",@"platName":@"人人网",@"platformTag":@"7"},
                     @{@"platImg":@"sns_icon_8",@"platName":@"开心网",@"platformTag":@"8"},
                     @{@"platImg":@"sns_icon_10",@"platName":@"Facebook",@"platformTag":@"10"},
                     @{@"platImg":@"sns_icon_11",@"platName":@"Twitter",@"platformTag":@"11"},
                     @{@"platImg":@"sns_icon_12",@"platName":@"印象笔记",@"platformTag":@"12"},
                     @{@"platImg":@"sns_icon_16",@"platName":@"Linkedin",@"platformTag":@"16"},
                     @{@"platImg":@"sns_icon_17",@"platName":@"Tumbir",@"platformTag":@"17"},
                     @{@"platImg":@"sns_icon_25",@"platName":@"Instapaper",@"platformTag":@"25"},
                     @{@"platImg":@"sns_icon_26",@"platName":@"Pocket",@"platformTag":@"26"},
                     @{@"platImg":@"sns_icon_27",@"platName":@"有道云笔记",@"platformTag":@"27"},
                     @{@"platImg":@"sns_icon_28",@"platName":@"搜狐随身看",@"platformTag":@"28"},
                     @{@"platImg":@"sns_icon_34",@"platName":@"Flickr",@"platformTag":@"34"},
                     @{@"platImg":@"sns_icon_35",@"platName":@"Dropbox",@"platformTag":@"35"},
                     @{@"platImg":@"sns_icon_36",@"platName":@"VKontakte",@"platformTag":@"36"},
                     @{@"platImg":@"sns_icon_41",@"platName":@"明道",@"platformTag":@"41"},
                     ];
    
    [self.table setNumberOfRows:[self.platArr count] withRowType:@"platformRowID"];
    
    for (NSDictionary *plaDic in self.platArr)
    {
        PlatformRow *row = [self.table rowControllerAtIndex:[self.platArr indexOfObject:plaDic]];
        [row.platformIcon setBackgroundImageNamed:plaDic[@"platImg"]];
        [row.platfromName setText:plaDic[@"platName"]];
    }
}

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex
{
    NSString *platTagStr = [[self.platArr objectAtIndex:rowIndex] objectForKey:@"platformTag"];
    NSDictionary *useInfo = @{@"useInfo":[NSKeyedArchiver archivedDataWithRootObject:@{@"platformTag":platTagStr,@"shareContent":@"测试：苹果表分享的内容"}]};
    
    [WKInterfaceController openParentApplication:useInfo
                                           reply:^(NSDictionary *replyInfo, NSError *error)
    {
        if ([[replyInfo objectForKey:@"result"]isEqualToString:@"success"])
        {
            [self presentControllerWithName:@"ResultInterfaceController" context:@"YES"];
        }
        else
        {
            [self presentControllerWithName:@"ResultInterfaceController" context:[replyInfo objectForKey:@"result"]];
        }
    }];
}

@end



