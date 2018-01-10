//
//  ShareSDKDemoUITests.swift
//  ShareSDKDemoUITests
//
//  Created by youzu_Max on 2017/11/8.
//  Copyright © 2017年 mob. All rights reserved.
//

import XCTest

class ShareSDKDemoUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample()
    {
        
        let app = XCUIApplication()
        app.collectionViews/*@START_MENU_TOKEN@*/.tables.staticTexts["Sina Weibo"]/*[[".cells.tables",".cells.staticTexts[\"Sina Weibo\"]",".staticTexts[\"Sina Weibo\"]",".tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["文字+图片 SDK"]/*[[".cells.staticTexts[\"文字+图片 SDK\"]",".staticTexts[\"文字+图片 SDK\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.navigationBars["WBShareViaStatusComposeView"]/*[[".windows[\"SINA Weibo Main Window\"].navigationBars[\"WBShareViaStatusComposeView\"]",".navigationBars[\"WBShareViaStatusComposeView\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Send"].tap()
        app.alerts["分享成功"].buttons["确定"].tap()
        
    }
}
