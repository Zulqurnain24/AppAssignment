//
//  TestWebserviceManager.swift
//  AppAssignmentTests
//
//  Created by Zulqurnain on 06/02/2021.
//

import UIKit
import XCTest
@testable import AppAssignment

class TestWebserviceManager: XCTestCase {
    
    var sut: WebserviceManager!
    
    override func setUp() {
        super.setUp()
        sut = WebserviceManager()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testCallProductsListService() {
        
        let expectation = self.expectation(description: #function)
               
        sut.callProductsListService { (products) in
            expectation.fulfill()
            XCTAssertTrue((products?.count ?? 0) > 0)
        } _: { (error) in
            
        }
        self.waitForExpectations(timeout: 10)

    }

}
