//
//  ViewController.swift
//  ShareSDK_swiftBridge
//
//  Created by Max on 2018/9/12.
//  Copyright © 2018年 Max. All rights reserved.
//

import UIKit

let queue = DispatchQueue.init(label: "ShareSDK-swift")

class ViewController: UIViewController, ISSERestoreSceneDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //注册
        ShareSDK.setRestoreSceneDelegate(self)
        
        ShareSDK.registPlatforms { register in
            register?.setupWeChat(withAppId: "wx617c77c82218ea2c", appSecret: "c7253e5289986cf4c4c74d1ccc185fb1",universalLink: "https://ybpre.share2dlink.com/")
            
            register?.setupSinaWeibo(withAppkey: "568898243", appSecret: "38a4f8204cc784f81f9f0daaf31e02e3", redirectUrl: "http://www.sharesdk.cn")
//            register?.setupQQ(withAppId: "100371282", appkey: "aed9b0303e3ed1e27bae87c33761161d" )
            register?.setupQQ(withAppId: "100371282", appkey: "aed9b0303e3ed1e27bae87c33761161d", enableUniversalLink: true, universalLink: "https://ybpre.share2dlink.com/")
        }
        
    }
    
    func isseWillRestoreScene(_ scene: SSERestoreScene!, error: Error!) {
        print("SSERestoreScene to Class  " + (Bundle.main.infoDictionary!["CFBundleExecutable"] as! String) + "." +  scene.className!);
    }
   
    
    @IBAction func share(_ sender: Any) {
        
        let params = NSMutableDictionary()
        
        params.ssdkSetupShareParams(byText: "test", images: "http://c.hiphotos.baidu.com/image/pic/item/b58f8c5494eef01f40ef23e9edfe9925bc317d26.jpg", url: nil, title: nil, type: .image)
        
        ShareSDK.share(.typeWechat, parameters: params) { (state, userdata, contentEntity, error) in
            
            switch state
            {
            case .success:
                print("Success");
            case .fail:
                print("Fail:%@",error ?? "");
            case .cancel:
                print("cancel");
            default : break
            }
        }
    }
    
    @IBAction func auth(_ sender: Any) {
        ShareSDK.authorize(.typeWechat, settings: nil) { (state, user, error) in
            
            switch state
            {
            case .success:
                print("Success:%@",user?.dictionaryValue() ?? "");
            case .fail:
                print("Fail:%@",error ?? "");
            case .cancel:
                print("Cancel");
            default : break
            }
        }
    }
    
    @IBAction func showMenu(_ sender: Any) {
        
        let params = NSMutableDictionary()
        
        params.ssdkSetupShareParams(byText: "test", images: "http://www.mob.com/assets/images/ShareSDK_pic_1-09d293a6.png", url: nil, title: nil, type: .image)
        ShareSDK.showShareActionSheet(nil, customItems: nil, shareParams: params, sheetConfiguration: nil) { (state, platformType, userdata, contentEntity, error, isFinished) in
            
            switch state
            {
            case .success:
                print("Success");
            case .fail:
                print("Fail:%@",error ?? "");
            case .cancel:
                print("Cancel");
            default : break
            }
        }
    }
}


