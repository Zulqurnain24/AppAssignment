//
//  TestPersistentStoreManager.swift
//  AppAssignmentTests
//
//  Created by Zulqurnain on 06/02/2021.
//
import UIKit
import XCTest
@testable import AppAssignment

class TestPersistentStoreManager: XCTestCase {
    
    var sut: PersistentStoreManager!
    
    override func setUp() {
        super.setUp()
        sut = PersistentStoreManager.shared
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testPersistentStorage() {
        let productList = [Product(id: 0, title: "Shirt", price: 775, image: "default", description: "simple shirt", category: "shirt")]
        sut.setObject(uniqueId: StringConstants.products.rawValue, key: StringConstants.products.rawValue, value: productList)
        let storedProductList = PersistentStoreManager.shared.getObject(uniqueId: StringConstants.products.rawValue, StringConstants.products.rawValue, [Product].self)
        
        XCTAssertEqual(productList, storedProductList)
    }
}
