//
//  TestProductDetailViewController.swift
//  AppAssignmentTests
//
//  Created by Zulqurnain on 06/02/2021.
//

import XCTest
import XCTest
@testable import AppAssignment

class TestConfig: XCTestCase {
    
    func testConfig() {
        XCTAssertEqual(config.baseURL, "https://fakestoreapi.com/")
    }
}
