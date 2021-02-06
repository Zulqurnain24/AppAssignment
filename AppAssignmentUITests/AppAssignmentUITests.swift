

//
//  AppAssignmentUITests.swift
//  AppAssignmentUITests
//
//  Created by Zulqurnain on 06/02/2021.
//

import XCTest

class AppAssignmentUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testScrollAndTouch() throws {
        
        let app = XCUIApplication()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element.tap()
            app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["AED 695.0"]/*[[".cells.staticTexts[\"AED 695.0\"]",".staticTexts[\"AED 695.0\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        }
        
    }
    
    func testInfiniteScroll() {
        let app = XCUIApplication()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element.tap()
            app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["AED 695.0"]/*[[".cells.staticTexts[\"AED 695.0\"]",".staticTexts[\"AED 695.0\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
            
            let scrollViewsQuery = XCUIApplication().scrollViews
            scrollViewsQuery.otherElements.staticTexts["John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet"].swipeUp()
            scrollViewsQuery.otherElements.containing(.staticText, identifier:"John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet").element.tap()
        }
    }
}
