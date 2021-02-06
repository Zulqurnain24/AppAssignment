//
//  TestProductDetail.swift
//  AppAssignmentTests
//
//  Created by Zulqurnain on 06/02/2021.
//
import UIKit
import XCTest
@testable import AppAssignment

class TestProduct: XCTestCase {
    
    var sut: Product!
    
    override func setUp() {
        super.setUp()
        sut = Product(id: 0, title: "Shirt", price: 133, image: "default", description: "Blue shirt", category: "Shirts")
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testProduct() {
        let product = Product(id: 0, title: "Shirt", price: 133, image: "default", description: "Blue shirt", category: "Shirts")
        XCTAssertEqual(product, sut) 
    }
}
