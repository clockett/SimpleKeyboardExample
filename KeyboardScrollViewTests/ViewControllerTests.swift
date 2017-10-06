//
//  ViewControllerTests.swift
//  KeyboardScrollViewTests
//
//  Created by Carolyn Kempkes on 9/29/17.
//  Copyright © 2017 Carolyn Kempkes. All rights reserved.
//

import XCTest
@testable import KeyboardScrollView

class ViewControllerTests: XCTestCase {
    
    var viewController:ViewController!
    
    override func setUp()
    {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        _ = viewController.view
        
    }
    
    override func tearDown()
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        viewController = nil
    }
    
    func testViewControllerSetUp()
    {
        // test that the offset is overridden
        XCTAssertFalse(viewController.offset == 20)
        XCTAssertTrue(viewController.offset == 50)
        
        // test values that we have set on the texfields
        XCTAssertTrue(viewController.textField1.placeholder == "Text Field 1")
        XCTAssertTrue(viewController.textField1.tag == 1)
        XCTAssertTrue(viewController.textField1.returnKeyType == .next)

        XCTAssertTrue(viewController.textField2.placeholder == "Text Field 2")
        XCTAssertTrue(viewController.textField2.tag == 2)
        XCTAssertTrue(viewController.textField2.returnKeyType == .next)
        
        XCTAssertTrue(viewController.textField3.placeholder == "Text Field 3")
        XCTAssertTrue(viewController.textField3.tag == 3)
        XCTAssertTrue(viewController.textField3.returnKeyType == .next)
        
        XCTAssertTrue(viewController.textField4.placeholder == "Text Field 4")
        XCTAssertTrue(viewController.textField4.tag == 4)
        XCTAssertTrue(viewController.textField4.returnKeyType == .done)
        
        // test to see that the tap gesture recognizer is set up by checking that
        // gestureRecognizers not nil and then check to see that our tap gesture recognizer is set
        XCTAssertNotNil(viewController.contentView.gestureRecognizers)
        if let recognizersUnwrapped = viewController.contentView.gestureRecognizers {
            XCTAssertTrue(recognizersUnwrapped.contains(viewController.tapGestureRecognizer))
        }
    }
    
}
