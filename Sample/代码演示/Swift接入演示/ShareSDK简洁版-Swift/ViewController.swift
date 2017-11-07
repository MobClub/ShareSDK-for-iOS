//
//  ViewController.swift
//  ShareSDK简洁版-Swift
//
//  Created by lisk@uuzu.com on 15/7/31.
//  Copyright (c) 2015年 MOB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /**
     * 简单分享示例
     */
    @IBAction func SimpleShare(sender: UIButton) {

        // 1.创建分享参数
        let shareParames = NSMutableDictionary()
        shareParames.ssdkSetupShareParams(byText: "分享内容 http://www.mob.com/",
                                           images : UIImage(named: "shareImg.png"),
                                              url : NSURL(string:"http://mob.com") as URL!,
                                            title : nil,
                                             type : SSDKContentType.image)
        //2.进行分享
        ShareSDK.share(SSDKPlatformType.typeSinaWeibo, parameters: shareParames) { (state : SSDKResponseState, userData : [AnyHashable : Any]?, contentEntity :SSDKContentEntity?, error : Error?) -> Void in
            
            switch state{
                
                case SSDKResponseState.success:
                                                print("分享成功")
                                                let alert = UIAlertView(title: "分享成功", message: "分享成功", delegate: self, cancelButtonTitle: "取消")
                                                alert.show()
                case SSDKResponseState.fail:    print("分享失败,错误描述:\(String(describing: error))")
                case SSDKResponseState.cancel:  print("分享取消")
            
            default:
                break
            }
        }
    }
    
    /**
     * 显示分享菜单示例
     */
    @IBAction func ShowShareMenu(sender: UIButton) {
        
        //1.创建分享参数
        let shareParames = NSMutableDictionary()
        shareParames.ssdkSetupShareParams(byText: "分享内容 http://www.mob.com/",
                                         images : UIImage(named: "shareImg.png"),
                                            url : NSURL(string:"http://mob.com") as URL!,
                                          title : "分享标题",
                                           type : SSDKContentType.auto)
        
        SSUIShareActionSheetStyle.setShareActionSheetStyle(.simple)
        
        //2.进行分享
        let sheet = ShareSDK.showShareActionSheet(sender, items: nil, shareParams: shareParames) { (state : SSDKResponseState, platformType : SSDKPlatformType, userdata : [AnyHashable : Any]?, contentEnity : SSDKContentEntity?, error : Error?, end) in
            
            switch state{
            
                case SSDKResponseState.success: print("分享成功")
                case SSDKResponseState.fail:    print("分享失败,错误描述:\(String(describing: error))")
                case SSDKResponseState.cancel:  print("分享取消")
            
            default:
                break
            }
        }
        sheet?.directSharePlatforms.add(SSDKPlatformType.typeSinaWeibo.rawValue)
    }
    
    /**
    *  显示分享编辑界面
    */
    @IBAction func ShowShareEditor(sender: UIButton) {
        
        // 1.创建分享参数
        let shareParames = NSMutableDictionary()

        shareParames.ssdkSetupShareParams(byText: "分享内容 http://www.mob.com/",
                                         images : UIImage(named: "shareImg.png"),
                                            url : NSURL(string:"http://mob.com") as URL!,
                                          title : "分享标题",
                                           type : SSDKContentType.image)
        
        //2.显示分享编辑页面
        ShareSDK.showShareEditor(SSDKPlatformType.typeSinaWeibo, otherPlatformTypes: nil, shareParams: shareParames) { (state :SSDKResponseState, platformType : SSDKPlatformType, userData: [AnyHashable : Any]?, contentEntity : SSDKContentEntity?, error : Error?, end) -> Void in
            
            switch state{
                
                case SSDKResponseState.success: print("分享成功")
                case SSDKResponseState.fail:    print("分享失败,错误描述:\(String(describing: error))")
                case SSDKResponseState.cancel:  print("分享取消")
                
            default:
                break
            }
        }
    }
    
    /**
    * 获取授权用户信息
    */
    @IBAction func OAuth(sender: UIButton) {
        ShareSDK.authorize(SSDKPlatformType.typeWechat, settings: [:]) { (state : SSDKResponseState, user : SSDKUser?, error : Error?) in
            
        }
        //授权
//        ShareSDK.authorize(SSDKPlatformType.typeWechat, settings: nil, onStateChanged: { (state : SSDKResponseState, user : SSDKUser?, error : Error?) -> Void in
//            
//            switch state{
//                
//            case SSDKResponseState.success: print("授权成功,用户信息为\(user)\n ----- 授权凭证为\(user?.credential)")
//            case SSDKResponseState.fail:    print("授权失败,错误描述:\(error)")
//            case SSDKResponseState.cancel:  print("操作取消")
//                
//            default:
//                break
//            }
//        })
    }
}


