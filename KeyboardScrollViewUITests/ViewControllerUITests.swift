//
//  ViewControllerUITests.swift
//  KeyboardScrollViewUITests
//
//  Created by Carolyn Kempkes on 9/29/17.
//  Copyright © 2017 Carolyn Kempkes. All rights reserved.
//

import XCTest

class ViewControllerUITests: XCTestCase {
        
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
    
    func testKeyboardButtonsResponderChain() {
        
        let app = XCUIApplication()
        let elementsQuery = app.scrollViews.otherElements
        
        let textField1TextField = elementsQuery.textFields["Text Field 1"]
        let textField2TextField = elementsQuery.textFields["Text Field 2"]
        let textField3TextField = elementsQuery.textFields["Text Field 3"]
        let textField4TextField = elementsQuery.textFields["Text Field 4"]
        
        textField1TextField.tap()
        
        let nextButton = app.keyboards.buttons["Next"]
        
        XCTAssertTrue(nextButton.isHittable)
        nextButton.tap()
        
        XCTAssertTrue(textField2TextField.isHittable)
        XCTAssertTrue(nextButton.isHittable)
        nextButton.tap()
        
        XCTAssertTrue(textField3TextField.isHittable)
        XCTAssertTrue(nextButton.isHittable)
        nextButton.tap()
        
        XCTAssertTrue(textField4TextField.isHittable)
        let doneButton = app.keyboards.buttons["Done"]
        XCTAssertTrue(doneButton.isHittable)
        doneButton.tap()
        
    }

}
