Pod::Spec.new do |s|
  s.name             = 'mob_sharesdk'
  s.version          = "4.0.4"
  s.summary          = 'ShareSDK is the most comprehensive Social SDK in the world,which share easily with 40+ platforms.'
  s.license          = 'MIT'
  s.author           = { "mob" => "mobproducts@163.com" }

  s.homepage         = 'http://www.mob.com'
  s.source           = { :git => "https://github.com/MobClub/ShareSDK-for-iOS.git", :tag => s.version.to_s }
  s.platform         = :ios
  s.ios.deployment_target = "8.0"
  s.frameworks       = 'JavaScriptCore'
  s.libraries        = 'z.1.2.5', 'stdc++'
  s.default_subspecs    = 'ShareSDK'
  s.vendored_frameworks = 'SDK/ShareSDK/ShareSDK.framework'
  s.dependency 'MOBFoundation'

  # 核心模块
    s.subspec 'ShareSDK' do |sp|
        sp.vendored_frameworks = 'SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework'
        sp.libraries = 'z', 'stdc++'
        sp.resources = 'SDK/ShareSDK/Support/Required/ShareSDK.bundle'
    end

    # 各个平台：需要集成哪些平台需要选择相应的平台语句，如果以下语句没有对应的平台，则是：1、不需要（如Twitter），2、ShareSDK尚未支持。
    s.subspec 'ShareSDKPlatforms' do |sp|
        #sp.default_subspecs = 'QQ', 'SinaWeibo', 'WeChat', 'RenRen', 'AliPaySocial','Kakao','Yixin', 'MeiPai','Messenger','Copy','Evernote','GooglePlus','Instagram','Instapaper','Line','Mail','SMS','WhatsApp','Facebook','YouTube' - Errors: Can't set `default_subspecs` attribute for subspecs

        # QQ
        sp.subspec 'QQ' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformSDK/QQSDK/TencentOpenAPI.framework','SDK/ShareSDK/Support/PlatformConnector/QQConnector.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resources = 'SDK/ShareSDK/Support/PlatformSDK/QQSDK/TencentOpenApi_IOS_Bundle.bundle','SDK/ShareSDK/Support/Required/ShareSDK.bundle'
            ssp.libraries = 'sqlite3'
        end

        # SinaWeibo
        sp.subspec 'SinaWeibo' do |ssp|
            ssp.vendored_libraries = "SDK/ShareSDK/Support/PlatformSDK/SinaWeiboSDK/*.a"
            ssp.resources = 'SDK/ShareSDK/Support/PlatformSDK/SinaWeiboSDK/WeiboSDK.bundle','SDK/ShareSDK/Support/Required/ShareSDK.bundle'
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/SinaWeiboConnector.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.frameworks = 'ImageIO'
            ssp.libraries = 'sqlite3'
            ssp.source_files = "SDK/ShareSDK/Support/PlatformSDK/SinaWeiboSDK/*.{h,m}"
            ssp.public_header_files = "SDK/ShareSDK/Support/PlatformSDK/SinaWeiboSDK/*.h"
        end

        # WeChat
        sp.subspec 'WeChat' do |ssp|
            ssp.vendored_libraries = "SDK/ShareSDK/Support/PlatformSDK/WeChatSDK/*.a"
            ssp.source_files = "SDK/ShareSDK/Support/PlatformSDK/WeChatSDK/*.{h,m}"
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/WechatConnector.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'SDK/ShareSDK/Support/Required/ShareSDK.bundle'
            ssp.public_header_files = "SDK/ShareSDK/Support/PlatformSDK/WeChatSDK/*.h"
            ssp.libraries = 'sqlite3'
        end

        # WeChatFull
        sp.subspec 'WeChatFull' do |ssp|
            ssp.vendored_libraries = "SDK/ShareSDK/Support/PlatformSDK/WeChatSDKFull/*.a"
            ssp.source_files = "SDK/ShareSDK/Support/PlatformSDK/WeChatSDKFull/*.{h,m}"
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/WechatConnector.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'SDK/ShareSDK/Support/Required/ShareSDK.bundle'
            ssp.public_header_files = "SDK/ShareSDK/Support/PlatformSDK/WeChatSDKFull/*.h"
            ssp.libraries = 'sqlite3'
        end

        # RenRen
        sp.subspec 'RenRen' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformSDK/RenRenSDK/RennSDK.framework' ,'SDK/ShareSDK/Support/PlatformConnector/RenrenConnector.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'SDK/ShareSDK/Support/PlatformSDK/RenRenSDK/RennSDK.bundle','SDK/ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # 支付宝（AliPaySocial）
        sp.subspec 'AliPaySocial' do |ssp|
            ssp.vendored_libraries = 'SDK/ShareSDK/Support/PlatformSDK/APSocialSDK/*.a'
            ssp.source_files = "SDK/ShareSDK/Support/PlatformSDK/APSocialSDK/*.{h,m}"
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/AliPayConnector.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'SDK/ShareSDK/Support/Required/ShareSDK.bundle'
            ssp.public_header_files = "SDK/ShareSDK/Support/PlatformSDK/APSocialSDK/*.h"
        end

        # Kakao
        sp.subspec 'Kakao' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformSDK/KaKaoSDK/KakaoOpenSDK.framework','SDK/ShareSDK/Support/PlatformConnector/KakaoConnector.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'SDK/ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # MeiPai
        sp.subspec 'MeiPai' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformSDK/MPShareSDK/MPShareSDK.framework','SDK/ShareSDK/Support/PlatformConnector/MeiPaiConnector.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'SDK/ShareSDK/Support/Required/ShareSDK.bundle'
            ssp.frameworks = 'AssetsLibrary'
        end

        # Yixin
        sp.subspec 'Yixin' do |ssp|
            ssp.vendored_libraries = "SDK/ShareSDK/Support/PlatformSDK/YiXinSDK/*.a"
            ssp.source_files = "SDK/ShareSDK/Support/PlatformSDK/YiXinSDK/*.{h,m}"
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/YiXinConnector.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.public_header_files = "SDK/ShareSDK/Support/PlatformSDK/YiXinSDK/*.h"
            ssp.resource = 'SDK/ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # Facebook
        sp.subspec 'Facebook' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformSDK/FacebookMessengerSDK/FBSDKMessengerShareKit.framework','SDK/ShareSDK/Support/PlatformConnector/FacebookConnector.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'SDK/ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # Copy
        sp.subspec 'Copy' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/CopyConnector.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'SDK/ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # Evernote
        sp.subspec 'Evernote' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/EvernoteConnector.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'SDK/ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # GooglePlus
        sp.subspec 'GooglePlus' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/GooglePlusConnector.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'SDK/ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # Instagram
        sp.subspec 'Instagram' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/InstagramConnector.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'SDK/ShareSDK/Support/Required/ShareSDK.bundle'
            ssp.frameworks = 'AssetsLibrary','Photos'
        end

        # Instapaper
        sp.subspec 'Instapaper' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/InstapaperConnector.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'SDK/ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # Line
        sp.subspec 'Line' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformSDK/LineSDK/LineSDK.framework','SDK/ShareSDK/Support/PlatformConnector/LineConnector.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'SDK/ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # Mail
        sp.subspec 'Mail' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/MailConnector.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'SDK/ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # SMS
        sp.subspec 'SMS' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/SMSConnector.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'SDK/ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # WhatsApp
        sp.subspec 'WhatsApp' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/WhatsAppConnector.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'SDK/ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # YouTube
        sp.subspec 'YouTube' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/YouTubeConnector.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'SDK/ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # Twitter
        sp.subspec 'Twitter' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/TwitterConnector.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'SDK/ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # Dropbox
        sp.subspec 'Dropbox' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/DropboxConnector.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'SDK/ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # DingTalk
        sp.subspec 'DingTalk' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformSDK/DingTalkSDK/DTShareKit.framework','SDK/ShareSDK/Support/PlatformConnector/DingTalkConnector.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'SDK/ShareSDK/Support/Required/ShareSDK.bundle'
        end
    end

    # ShareSDK 配置文件模块
    s.subspec 'ShareSDKConfigurationFile' do |sp|
        sp.vendored_frameworks = 'SDK/ShareSDK/Support/Optional/ShareSDKConfigFile.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
        sp.resources = 'SDK/ShareSDK/Support/Optional/ShareSDKConfigFile.bundle','SDK/ShareSDK/Support/Required/ShareSDK.bundle'
    end
    
    # ShareSDK Extension扩展模块
    s.subspec 'ShareSDKExtension' do |sp|
        sp.vendored_frameworks = 'SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
    sp.resources = 'SDK/ShareSDK/Support/Required/ShareSDK.bundle'
    end

    # ShareSDK提供的UI
    s.subspec 'ShareSDKUI' do |sp|
        sp.vendored_frameworks = 'SDK/ShareSDK/Support/Optional/ShareSDKUI.framework','SDK/ShareSDK/ShareSDK.framework','SDK/ShareSDK/Support/Required/ShareSDKConnector.framework','SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
        sp.resources = 'SDK/ShareSDK/Support/Optional/ShareSDKUI.bundle','SDK/ShareSDK/Support/Required/ShareSDK.bundle'
    end
end
