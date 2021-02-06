//
//  TestProductDetailViewModel.swift
//  AppAssignmentTests
//
//  Created by Zulqurnain on 06/02/2021.
//
import UIKit
import XCTest
@testable import AppAssignment

class TestProductDetailViewModel: XCTestCase {
    
    var sut: ProductDetailViewModel!
    
    override func setUp() {
        super.setUp()
        sut = ProductDetailViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testProduct() {
        let product = Product(id: 0, title: "Shirt", price: 133, image: "default", description: "Blue shirt", category: "Shirts")
        sut.product = product
        XCTAssertEqual(sut.product, product)
    }
}
