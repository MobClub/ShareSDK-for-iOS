Pod::Spec.new do |s|
  s.name             = 'ShareSDK3'
  s.version          = "3.6.3"
  s.summary          = 'ShareSDK is the most comprehensive Social SDK in the world,which share easily with 40+ platforms.'
  s.license          = 'MIT'
  s.author           = { "Jinghuang Liu" => "liujinghuang@icloud.com" }

  s.homepage         = 'http://www.mob.com'
  s.source           = { :git => "https://github.com/ShareSDKPlatform/ShareSDK.git", :tag => s.version.to_s }
  s.platform         = :ios
  s.ios.deployment_target = "6.0"
  s.frameworks       = 'UIKit', 'JavaScriptCore','SystemConfiguration','CoreTelephony'
  s.libraries        = 'icucore', 'z.1.2.5', 'stdc++'

  s.default_subspecs    = 'ShareSDK'
  s.vendored_frameworks = 'ShareSDK/ShareSDK.framework'
  s.dependency 'MOBFoundation'

  # 核心模块
    s.subspec 'ShareSDK' do |sp|
        sp.vendored_frameworks = 'ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework'
        sp.libraries = 'icucore', 'z', 'stdc++'
        sp.resources = 'ShareSDK/Support/Required/ShareSDK.bundle'
    end

    # 各个平台：需要集成哪些平台需要选择相应的平台语句，如果以下语句没有对应的平台，则是：1、不需要（如Twitter），2、ShareSDK尚未支持。
    s.subspec 'ShareSDKPlatforms' do |sp|
        #sp.default_subspecs = 'QQ', 'SinaWeibo', 'WeChat', 'RenRen', 'AliPaySocial','Kakao','Yixin', 'MeiPai','Messenger','Copy','Evernote','GooglePlus','Instagram','Instapaper','Line','Mail','SMS','WhatsApp','Facebook','YouTube' - Errors: Can't set `default_subspecs` attribute for subspecs

        # QQ
        sp.subspec 'QQ' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/QQSDK/TencentOpenAPI.framework','ShareSDK/Support/PlatformConnector/QQConnector.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resources = 'ShareSDK/Support/PlatformSDK/QQSDK/TencentOpenApi_IOS_Bundle.bundle','ShareSDK/Support/Required/ShareSDK.bundle'
            ssp.libraries = 'sqlite3'
        end

        # SinaWeibo
        sp.subspec 'SinaWeibo' do |ssp|
            ssp.vendored_libraries = "ShareSDK/Support/PlatformSDK/SinaWeiboSDK/*.a"
            ssp.resources = 'ShareSDK/Support/PlatformSDK/SinaWeiboSDK/WeiboSDK.bundle','ShareSDK/Support/Required/ShareSDK.bundle'
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/SinaWeiboConnector.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.frameworks = 'ImageIO'
            ssp.libraries = 'sqlite3'
            ssp.source_files = "ShareSDK/Support/PlatformSDK/SinaWeiboSDK/*.{h,m}"
            ssp.public_header_files = "ShareSDK/Support/PlatformSDK/SinaWeiboSDK/*.h"
        end

        # WeChat
        sp.subspec 'WeChat' do |ssp|
            ssp.vendored_libraries = "ShareSDK/Support/PlatformSDK/WeChatSDK/*.a"
            ssp.source_files = "ShareSDK/Support/PlatformSDK/WeChatSDK/*.{h,m}"
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/WechatConnector.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'ShareSDK/Support/Required/ShareSDK.bundle'
            ssp.public_header_files = "ShareSDK/Support/PlatformSDK/WeChatSDK/*.h"
            ssp.libraries = 'sqlite3'
        end

        # RenRen
        sp.subspec 'RenRen' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/RenRenSDK/RennSDK.framework' ,'ShareSDK/Support/PlatformConnector/RenrenConnector.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'ShareSDK/Support/PlatformSDK/RenRenSDK/RennSDK.bundle','ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # 支付宝（AliPaySocial）
        sp.subspec 'AliPaySocial' do |ssp|
            ssp.vendored_libraries = 'ShareSDK/Support/PlatformSDK/APSocialSDK/*.a'
            ssp.source_files = "ShareSDK/Support/PlatformSDK/APSocialSDK/*.{h,m}"
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/AliPayConnector.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'ShareSDK/Support/Required/ShareSDK.bundle'
            ssp.public_header_files = "ShareSDK/Support/PlatformSDK/APSocialSDK/*.h"
        end

        # Kakao
        sp.subspec 'Kakao' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/KaKaoSDK/KakaoOpenSDK.framework','ShareSDK/Support/PlatformConnector/KakaoConnector.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # MeiPai
        sp.subspec 'MeiPai' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/MPShareSDK/MPShareSDK.framework','ShareSDK/Support/PlatformConnector/MeiPaiConnector.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'ShareSDK/Support/Required/ShareSDK.bundle'
            ssp.frameworks = 'AssetsLibrary'
        end

        # Yixin
        sp.subspec 'Yixin' do |ssp|
            ssp.vendored_libraries = "ShareSDK/Support/PlatformSDK/YiXinSDK/*.a"
            ssp.source_files = "ShareSDK/Support/PlatformSDK/YiXinSDK/*.{h,m}"
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/YiXinConnector.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.public_header_files = "ShareSDK/Support/PlatformSDK/YiXinSDK/*.h"
            ssp.resource = 'ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # Facebook
        sp.subspec 'Facebook' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/FacebookMessengerSDK/FBSDKMessengerShareKit.framework','ShareSDK/Support/PlatformConnector/FacebookConnector.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # Copy
        sp.subspec 'Copy' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/CopyConnector.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # Evernote
        sp.subspec 'Evernote' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/EvernoteConnector.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # GooglePlus
        sp.subspec 'GooglePlus' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/GooglePlusConnector.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # Instagram
        sp.subspec 'Instagram' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/InstagramConnector.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'ShareSDK/Support/Required/ShareSDK.bundle'
            ssp.frameworks = 'AssetsLibrary','Photos'
        end

        # Instapaper
        sp.subspec 'Instapaper' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/InstapaperConnector.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # Line
        sp.subspec 'Line' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/LineSDK/LineSDK.framework','ShareSDK/Support/PlatformConnector/LineConnector.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # Mail
        sp.subspec 'Mail' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/MailConnector.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # SMS
        sp.subspec 'SMS' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/SMSConnector.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # WhatsApp
        sp.subspec 'WhatsApp' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/WhatsAppConnector.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # YouTube
        sp.subspec 'YouTube' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/YouTubeConnector.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # Twitter
        sp.subspec 'Twitter' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/TwitterConnector.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'ShareSDK/Support/Required/ShareSDK.bundle'
        end

        # DingTalk
        sp.subspec 'DingTalk' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/DingTalkSDK/DTShareKit.framework','ShareSDK/Support/PlatformConnector/DingTalkConnector.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
            ssp.resource = 'ShareSDK/Support/Required/ShareSDK.bundle'
        end
    end

    # ShareSDK 配置文件模块
    s.subspec 'ShareSDKConfigurationFile' do |sp|
        sp.vendored_frameworks = 'ShareSDK/Support/Optional/ShareSDKConfigFile.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
        sp.resources = 'ShareSDK/Support/Optional/ShareSDKConfigFile.bundle','ShareSDK/Support/Required/ShareSDK.bundle'
    end
    
    # ShareSDK Extension扩展模块
    s.subspec 'ShareSDKExtension' do |sp|
        sp.vendored_frameworks = 'ShareSDK/Support/Optional/ShareSDKExtension.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
    sp.resources = 'ShareSDK/Support/Required/ShareSDK.bundle'
    end

    # ShareSDK提供的UI
    s.subspec 'ShareSDKUI' do |sp|
        sp.vendored_frameworks = 'ShareSDK/Support/Optional/ShareSDKUI.framework','ShareSDK/ShareSDK.framework','ShareSDK/Support/Required/ShareSDKConnector.framework','ShareSDK/Support/Optional/ShareSDKExtension.framework'
        sp.resources = 'ShareSDK/Support/Optional/ShareSDKUI.bundle','ShareSDK/Support/Required/ShareSDK.bundle'
    end
end
