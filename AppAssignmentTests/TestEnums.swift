//
//  TestEnums.swift
//  AppAssignmentTests
//
//  Created by Zulqurnain on 06/02/2021.
//


import UIKit
import XCTest
@testable import AppAssignment

class TestEnums: XCTestCase {
    
    func testEnums() {
        checkStringValue(StringConstants.products.rawValue, "products")
        checkStringValue(StringConstants.loading.rawValue, "Please Wait...")
        checkStringValue(StringConstants.empty.rawValue, "")
        checkStringValue(StringConstants.noConnection.rawValue, "No Connection")
        checkStringValue(StringConstants.internetErrorTitleText.rawValue, "Error")
        checkStringValue(StringConstants.internetErrorMessageText.rawValue, "Please make sure you are connected to internet. Close the app and open again after restoring internet")
    }

     private func checkStringValue(_ value: String,  _ actualVal: String) {
         XCTAssertEqual(value, actualVal)
     }
}
