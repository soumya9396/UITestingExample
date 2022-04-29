//
//  LoginUITest.swift
//  UITestingExampleUITests
//
//  Created by Soumitra Bera on 29/04/22.
//

import XCTest
@testable import UITestingExample

class LoginUITest: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func test_LoginUI() throws {
        
        let app = XCUIApplication()
        
        let logInText = app.staticTexts["Log In"]
        XCTAssertTrue(logInText.exists, "LogIn text does not exists.")
        
        let userName = app.textFields["Username"]
        //XCTAssertTrue(userName.exists, "User name field does not exists.")
        
        userName.tap()
        userName.typeText("Soumitra")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        //XCTAssertTrue(passwordSecureTextField.exists, "Password field does not exists.")
        
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("123456")
       
        
        let continueButton = app.buttons["Continue"]
        XCTAssertTrue(continueButton.exists, "Continue button does not exists.")
        continueButton.tap(withNumberOfTaps: 1, numberOfTouches: 1)
        
        let successText = app.staticTexts["Logged In Successfully"]
        XCTAssertTrue(successText.exists, "Success text does not exists.")
        
    }

}
