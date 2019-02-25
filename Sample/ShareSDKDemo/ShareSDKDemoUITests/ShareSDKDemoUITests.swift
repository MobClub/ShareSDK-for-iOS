//
//  ShareSDKDemoUITests.swift
//  ShareSDKDemoUITests
//
//  Created by Max on 2018/9/5.
//  Copyright © 2018年 mob. All rights reserved.
//

import XCTest

class ShareSDKDemoUITests: XCTestCase {
    
    let platformIdentifiers = ["QQ", "新浪微博", "腾讯微博", "豆瓣", "印象笔记", "有道云笔记", "明道", "开心网", "人人网", "易信" ,"Facebook", "Twitter", "Google+", "Line", "Kakao", "Instagram", "Flickr", "Dropbox", "Evernote", "LinkedIn", "VKontakte", "Instapaper", "Pocket", "Tumblr", "Telegram", "Reddit"];
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
    }
    
    func testQQWebAuth() {
        
        let app = XCUIApplication()
        
        self._beginAuthWithName("QQ")
        
        self._typeText("982017940", textField: app.textFields.element(boundBy: 0))
        self._typeText("Chao802307", textField: app.secureTextFields.element(boundBy: 0))
        
        app.webViews.staticTexts["登 录"].tap()
        let copy = app.buttons["复制"]
        XCTAssertTrue(copy.waitForExistence(timeout: 10))
    }
    
    func testSinaWebAuth() {
        
        let app = XCUIApplication()
        
        self._beginAuthWithName("新浪微博")
        
        self._typeText("982017940@qq.com", textField: app.textFields.element(boundBy: 0))
        self._typeText("qc1234567", textField: app.secureTextFields.element(boundBy: 0))
        
        app.webViews/*@START_MENU_TOKEN@*/.staticTexts["登录"]/*[[".otherElements[\"登录 - 新浪微博\"]",".links[\"登录\"].staticTexts[\"登录\"]",".staticTexts[\"登录\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        if app.webViews.staticTexts["确认"].waitForExistence(timeout: 5) {
            app.webViews.staticTexts["确认"].tap()
        }
        let copy = app.buttons["复制"]
        
        XCTAssertTrue(copy.waitForExistence(timeout: 10))
    }
    
    func testTencentWeiboWebAuth() {
        
        let app = XCUIApplication()

        self._beginAuthWithName("腾讯微博")

        self._typeText("982017940", textField: app.textFields.element(boundBy: 0))
        self._typeText("Chao802307", textField: app.secureTextFields.element(boundBy: 0))

        app.staticTexts["登 录"].tap()
        
        let copy = app.buttons["复制"]
        XCTAssertTrue(copy.waitForExistence(timeout: 10))
    }

    //豆瓣网页有点问题
    func testDoubanWebAuth() {
        let app = XCUIApplication()
        self._beginAuthWithName("豆瓣")

        self._typeText("sharetester@163.com", textField: app.textFields.element(boundBy: 0))
        self._typeText("sharesdk.cn123", textField: app.secureTextFields.element(boundBy: 0))

        app.webViews.buttons["授权"].tap()
        let copy = app.buttons["复制"]
        XCTAssertTrue(copy.waitForExistence(timeout: 10))
    }

    func testYinXiangWebAuth() {
        
        let app = XCUIApplication()

        self._beginAuthWithName("印象笔记")
        self._typeText("sharetester", textField: app.textFields.element(boundBy: 0))
        app.webViews.buttons.element(boundBy: 1).tap()
        self._typeText("sharesdk.cn", textField: app.secureTextFields.element(boundBy: 0))
        app.webViews.buttons.element(boundBy: 1).tap()
        sleep(5)
        app.webViews.buttons.element(boundBy: 0).tap()
        let copy = app.buttons["复制"]
        XCTAssertTrue(copy.waitForExistence(timeout: 10))
    }
    
    func testEvernoteWebAuth() {
        let app = XCUIApplication()
        
        self._beginAuthWithName("Evernote")
        
        self._typeText("sharetester", textField: app.textFields.element(boundBy: 0))
        app.webViews.buttons.element(boundBy: 1).tap()
        self._typeText("sharesdk.cn", textField: app.secureTextFields.element(boundBy: 0))
        app.webViews.buttons.element(boundBy: 1).tap()
        sleep(5)
        app.webViews.buttons.element(boundBy: 0).tap()
        let copy = app.buttons["复制"]
        XCTAssertTrue(copy.waitForExistence(timeout: 10))
    }


    func testYouDaoWebAuth() {
        let app = XCUIApplication()
        self._beginAuthWithName("有道云笔记")

        self._typeText("sharetester@163.com", textField: app.textFields.element(boundBy: 0))
        self._typeText("sharesdk.cn", textField: app.secureTextFields.element(boundBy: 0))

        app.staticTexts["登录"].tap()
        
        let copy = app.buttons["复制"]
        XCTAssertTrue(copy.waitForExistence(timeout: 10))
    }


    func testMingDaoWebAuth() {
        let app = XCUIApplication()
        self._beginAuthWithName("明道")
 
        if app.staticTexts["切换邮箱登录"].waitForExistence(timeout: 30) {
            app.staticTexts["切换邮箱登录"].tap()
        }
        
        self._typeText("sharetester@163.com", textField: app.textFields.element(boundBy: 0))

        self._typeText("sharesdk.cn123", textField: app.secureTextFields.element(boundBy: 0))

        app.buttons["用明道账号登录"].tap()
        
        let copy = app.buttons["复制"]
        XCTAssertTrue(copy.waitForExistence(timeout: 10))
    }
    
    func testHappyWebAuth() {
        let app = XCUIApplication()
        self._beginAuthWithName("开心网")
        
        self._typeText("appgocn@163.com", textField: app.textFields.element(boundBy: 0))
        self._typeText("chengang", textField: app.secureTextFields.element(boundBy: 0))
        
        app.webViews.buttons.element(boundBy: 0).tap()
        
        let copy = app.buttons["复制"]
        XCTAssertTrue(copy.waitForExistence(timeout: 10))
    }
    
    func testRenrenWebAuth() {
        let app = XCUIApplication()
        self._beginAuthWithName("人人网")
        
        self._typeText("sharetester@163.com", textField: app.textFields.element(boundBy: 0))
        self._typeText("sharesdk.cn", textField: app.secureTextFields.element(boundBy: 0))
        
        app.buttons["授权并登录"].tap()
        
        let copy = app.buttons["复制"]
        XCTAssertTrue(copy.waitForExistence(timeout: 10))
    }
    
    func testEasyChatWebAuth() {
        let app = XCUIApplication()
        self._beginAuthWithName("易信")
        self._typeText("stesters", textField: app.textFields.element(boundBy: 0))
        self._typeText("sharesdk.cn", textField: app.secureTextFields.element(boundBy: 0))
        
        app.buttons["登 录"].tap()

        let copy = app.buttons["复制"]
        XCTAssertTrue(copy.waitForExistence(timeout: 10))
    }
    
    func testFacebookWebAuth() {
        let app = XCUIApplication()
        self._beginAuthWithName("Facebook")
        
        let continueBtn = app.buttons["继续"]
        if continueBtn.waitForExistence(timeout: 5) {
            continueBtn.tap()
        }else{
            self._typeText("sharetester@163.com", textField: app.textFields.element(boundBy: 0))
            self._typeText("sharesdk@2016", textField: app.secureTextFields.element(boundBy: 0))
            
            app.buttons["Log In"].tap()
            sleep(5)
            continueBtn.tap()
        }
        let copy = app.buttons["复制"]
        XCTAssertTrue(copy.waitForExistence(timeout: 10))
    }
    
    func testTwitterWebAuth() {
        let app = XCUIApplication()
        self._beginAuthWithName("Twitter")
        
        self._typeText("appgocn@163.com", textField: app.textFields.element(boundBy: 0))
        self._typeText("Chen0521", textField: app.secureTextFields.element(boundBy: 0))
        
        app.buttons["Authorize app"].tap()
        
        let copy = app.buttons["复制"]
        XCTAssertTrue(copy.waitForExistence(timeout: 10))
    }
    
    func testGoogleWebAuth() {
        let app = XCUIApplication()
        self._beginAuthWithName("Google+")
        sleep(5)
        
        let elementE = app.webViews.staticTexts["Use another account"];
        if elementE.exists {
            elementE.tap()
        }
        
        let elementC = app.webViews.staticTexts["使用其他帐号"];
        if elementC.exists {
            elementC.tap()
        }
        self._typeText("sharetester163.com@gmail.com", textField: app.textFields.element(boundBy: 0))
        app.webViews.buttons.element(boundBy: 0).tap()
        self._typeText("sharesdk.cn", textField: app.secureTextFields.element(boundBy: 0))
        app.webViews.buttons.element(boundBy: 1).tap()
        
        let copy = app.buttons["复制"]
        XCTAssertTrue(copy.waitForExistence(timeout: 10))
    }
    
    func testInstagramWebAuth() {
        let app = XCUIApplication()
        self._beginAuthWithName("Instagram")
        
        sleep(5);
        let copy = app.buttons["复制"]
        
        if !copy.waitForExistence(timeout: 2) {
            
            self._typeText("sharesdk@163.com", textField: app.textFields.element(boundBy: 0))
            self._typeText("Chen0521", textField: app.secureTextFields.element(boundBy: 0))
            
            app.webViews.buttons.element(boundBy: 2).tap()
            sleep(5)
            
            if app.buttons.count == 2 {
                app.webViews.buttons.element(boundBy: 0).tap()
            }
            
            XCTAssertTrue(copy.waitForExistence(timeout: 20))
        }
    }
    
    func testDropboxWebAuth() {
        let app = XCUIApplication()
        self._beginAuthWithName("Dropbox")
        
        self._typeText("sharetester@163.com", textField: app.textFields.element(boundBy: 0))
        self._typeText("sharesdk.cn", textField: app.secureTextFields.element(boundBy: 0))

        app.webViews.buttons.element(boundBy: 0).tap()
        sleep(5)
        app.webViews.buttons.element(boundBy: 1).tap()
        
        let copy = app.buttons["复制"]
        XCTAssertTrue(copy.waitForExistence(timeout: 10))
    }
    
    func testLinkedInWebAuth() {
        let app = XCUIApplication()
        self._beginAuthWithName("LinkedIn")
        
        self._typeText("vhbvbqc@gmail.com", textField: app.textFields.element(boundBy: 0))
        self._typeText("qc123456", textField: app.secureTextFields.element(boundBy: 0))
        
        app.webViews.buttons.element(boundBy: 0).tap()
        let copy = app.buttons["复制"]
        
        XCTAssertTrue(copy.waitForExistence(timeout: 20))
    }
    
    func testVKontakteWebAuth() {
        let app = XCUIApplication()
        self._beginAuthWithName("VKontakte")
        
        self._typeText("8615011904234", textField: app.textFields.element(boundBy: 0))
        self._typeText("Chen0521", textField: app.secureTextFields.element(boundBy: 0))
        
        app.webViews.buttons.element(boundBy: 0).tap()
        
        let copy = app.buttons["复制"]
        
        XCTAssertTrue(copy.waitForExistence(timeout: 10))
    }
    
    func testInstapaperWebAuth() {
        let app = XCUIApplication()
        self._beginAuthWithName("Instapaper")
        
        self._typeText("sharesdk@163.com", textField: app.textFields.element(boundBy: 0))
        self._typeText("Chen0521", textField: app.secureTextFields.element(boundBy: 0))
        
        app.buttons["登录"].tap()
        let copy = app.buttons["复制"]
        
        XCTAssertTrue(copy.waitForExistence(timeout: 10))
    }
    
    func testPocketWebAuth() {
        let app = XCUIApplication()
        self._beginAuthWithName("Pocket")
        
        if app.webViews.staticTexts["Log In"].waitForExistence(timeout: 20) {
            app.webViews.staticTexts["Log In"].tap()
            
            if app.webViews.buttons["Log In"].waitForExistence(timeout: 20) {
                
                self._typeText("sharetester@163.com", textField: app.textFields.element(boundBy: 0))
                self._typeText("sharesdk.cn", textField: app.secureTextFields.element(boundBy: 0))
                
                app.webViews.element(boundBy: 0).swipeDown()
                app.webViews.buttons["Log In"].tap()
            }
        }
        let copy = app.buttons["复制"]
        XCTAssertTrue(copy.waitForExistence(timeout: 20))
    }
    
    func test___Vpn_Required_______________()
    {
        
    }
    
    func testTelegramWebAuth() {
        let app = XCUIApplication()
        self._beginAuthWithName("Telegram")
        app.textFields.element(boundBy: 0).tap()
        app.keyboards.buttons["delete"].tap()
        self._typeText("86", textField: app.textFields.element(boundBy: 0))
        self._typeText("18516339329", textField: app.textFields.element(boundBy: 1))
        
        app.buttons["NEXT"].tap()
        
        let copy = app.buttons["复制"]
        
        print("---------------->Waiting Auth in Client !")
        XCTAssertTrue(copy.waitForExistence(timeout: 50))
    }
    
    func testRedditWebAuth() {
        let app = XCUIApplication()
        self._beginAuthWithName("Reddit")
        
        self._typeText("wukexiu", textField: app.textFields.element(boundBy: 0))
        self._typeText("63664461", textField: app.secureTextFields.element(boundBy: 0))
        
        app.webViews.buttons["log in"].tap()
        
        if app.webViews.staticTexts["would like to connect with your reddit account."].waitForExistence(timeout: 20) {
            
            app.webViews.element(boundBy: 0).swipeUp();
            app.webViews.buttons["允許"].tap()
        }
        else
        {
            XCTAssert(false, "Web Invalid")
        }
        
        let copy = app.buttons["复制"]
        
        XCTAssertTrue(copy.waitForExistence(timeout: 10))
    }
    
    func testTumblrWebAuth() {
        let app = XCUIApplication()
        self._beginAuthWithName("Tumblr")
        
//        if !app.buttons["允许"].waitForExistence(timeout: 10) {
        
            self._typeText("sharetester@163.com", textField: app.textFields.element(boundBy: 0))
            
            app.webViews.buttons["Next"].tap()
            
            if app.webViews.staticTexts["Use password to log in"].waitForExistence(timeout: 10) {
                app.webViews.staticTexts["Use password to log in"].firstMatch.tap()
            }
            
            self._typeText("sharesdk.cn", textField: app.secureTextFields.element(boundBy: 0))
            
            app.buttons["Log in"].tap()
            
            XCTAssertTrue(app.buttons["允许"].waitForExistence(timeout: 20))
//        }
        
        app.buttons["允许"].tap()
        
        let copy = app.buttons["复制"]
        
        XCTAssertTrue(copy.waitForExistence(timeout: 10))
    }
    
    func testFlickrWebAuth() {
        let app = XCUIApplication()
        self._beginAuthWithName("Flickr")

        if app.buttons["好的，我授權"].exists {
            app.buttons["好的，我授權"].tap()
        } else {
            self._typeText("mob_sharesdk@yahoo.com", textField: app.textFields.element(boundBy: 0))
            app.buttons["Next"].tap()
            self._typeText("Chen0521", textField: app.secureTextFields.element(boundBy: 0))
            app.webViews.buttons["Sign in"].tap()
            
            if app.buttons["好的，我授權"].waitForExistence(timeout: 30) {
                app.buttons["好的，我授權"].tap();
            }
        }
        
        let copy = app.buttons["复制"]
        XCTAssertTrue(copy.waitForExistence(timeout: 10))
    }
    
    func testLineWebAuth() {
        let app = XCUIApplication()
        self._beginAuthWithName("Line")
        
        self._typeText("sharesdk@163.com", textField: app.textFields.element(boundBy: 0))
        self._typeText("Chen0521", textField: app.secureTextFields.element(boundBy: 0))
        app.webViews.buttons["Log in"].tap()
        app.webViews.buttons["Allow"].tap()
        
        let copy = app.buttons["复制"]
        XCTAssertTrue(copy.waitForExistence(timeout: 50))
    }
    
    func testKaKaoWebAuth() {
        let app = XCUIApplication()
        self._beginAuthWithName("Kakao")

        self._typeText("sharetester163.com@gmail.com", textField: app.textFields.element(boundBy: 0))
        self._typeText("sharesdk.cn", textField: app.secureTextFields.element(boundBy: 0))

        app.webViews.staticTexts.element(boundBy: 1).tap();
        
        let copy = app.buttons["复制"]
        XCTAssertTrue(copy.waitForExistence(timeout: 10))
    }
    
    
    //MARK: - Privite
    
    //打开获取用户信息页进行授权
    func _beginAuthWithName(_ name: String)
    {
        let app = XCUIApplication()
        app.navigationBars["View"]/*@START_MENU_TOKEN@*/.buttons["用户信息"]/*[[".staticTexts.buttons[\"用户信息\"]",".buttons[\"用户信息\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let collectionViewsQuery = app.collectionViews
        if self.platformIdentifiers.index(of: name)! > 8 {
            collectionViewsQuery.element(boundBy: 0).swipeUp()
        }
        if self.platformIdentifiers.index(of: name)! > 16 {
            collectionViewsQuery.element(boundBy: 0).swipeUp()
        }
        
        let getInfoBtn = collectionViewsQuery.cells.tables.cells.containing(.staticText, identifier: name).buttons["获取信息"]
        
        if getInfoBtn.waitForExistence(timeout: 2) {
            getInfoBtn.tap()
        }else{
            let checkBtn = collectionViewsQuery.cells.tables.cells.containing(.staticText, identifier: name).buttons["查看"]
            checkBtn.tap()
            if app.buttons["清除信息"].waitForExistence(timeout: 10) {
                app.buttons["清除信息"].tap()
            }
            getInfoBtn.tap()
        }
    }
    
    // 用于wkWebView上的文本输入
    func _typeText(_ text: String, textField: XCUIElement)
    {
        if textField.waitForExistence(timeout: 50)
        {
/*
            let center = CGVector(dx: textField.frame.midX, dy: textField.frame.midY)
            let coordinate = XCUIApplication().coordinate(withNormalizedOffset: .zero).withOffset(center)
            coordinate.tap()//激活响应

            sleep(1)

            //有时候网页会滚动
            let focusCenter = CGVector(dx: textField.frame.midX, dy: textField.frame.midY)
            let focusCoordinate = XCUIApplication().coordinate(withNormalizedOffset: .zero).withOffset(focusCenter)
            focusCoordinate.doubleTap()
            sleep(1)

            if XCUIApplication().menuItems["全选"].exists {
                XCUIApplication().menuItems["全选"].tap()
                XCUIApplication().menuItems["剪切"].tap()
                self._typeText(text, textField:textField)
            } else if XCUIApplication().menuItems["Select All"].exists {
                XCUIApplication().menuItems["Select All"].tap()
                XCUIApplication().menuItems["Cut"].tap()
                self._typeText(text, textField:textField)
            } else if XCUIApplication().menuItems["粘贴"].exists {
                UIPasteboard.general.string = text;
                XCUIApplication().menuItems["粘贴"].tap()
            } else if XCUIApplication().menuItems["Paste"].exists {
                UIPasteboard.general.string = text;
                XCUIApplication().menuItems["Paste"].tap()
            } else {
                self._typeText(text, textField: textField)
            }
 */
            
            textField.tap()
            sleep(1)
            textField.doubleTap()
            
            if XCUIApplication().menuItems["全选"].exists {
                XCUIApplication().menuItems["全选"].tap()
                XCUIApplication().menuItems["剪切"].tap()
//                self._typeText(text, textField:textField)
            } else if XCUIApplication().menuItems["Select All"].exists {
                XCUIApplication().menuItems["Select All"].tap()
                XCUIApplication().menuItems["Cut"].tap()
//                self._typeText(text, textField:textField)
            }
            
            textField.typeText(text)
            
            if XCUIApplication().toolbars["Toolbar"].exists {
                XCUIApplication().toolbars["Toolbar"].buttons.element(boundBy: XCUIApplication().toolbars["Toolbar"].buttons.count - 1)
            }
        }
        else
        {
            XCTAssert(false, "textfield not found")
        }
    }
    
    func _forceTap(_ element:XCUIElement)
    {
        let center = CGVector(dx: element.frame.midX, dy: element.frame.midY)
        let coordinate = XCUIApplication().coordinate(withNormalizedOffset: .zero).withOffset(center)
        coordinate.tap()//激活响应
    }
}
