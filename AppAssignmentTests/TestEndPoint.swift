//
//  TestEndPoint.swift
//  AppAssignmentTests
//
//  Created by Zulqurnain on 06/02/2021.
//

import XCTest
import XCTest
@testable import AppAssignment

class TestEndpoint: XCTestCase {
    
    func testConfig() {
        XCTAssertEqual(Endpoint.getProducts.rawValue, "products")
    }
}
