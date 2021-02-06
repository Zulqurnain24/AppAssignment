//
//  TestProductGalleryViewModel.swift
//  AppAssignmentTests
//
//  Created by Zulqurnain on 06/02/2021.
//

import UIKit
import XCTest
@testable import AppAssignment

class TestProductGalleryViewModel: XCTestCase {
    
    var sut: ProductGalleryViewModel!
    
    override func setUp() {
        super.setUp()
        sut = ProductGalleryViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testProductGalleryViewModel() {
        let product1 = Product(id: 0, title: "Shirt", price: 133, image: "default", description: "Blue shirt", category: "Shirts")
        let product2 = Product(id: 1, title: "Bracelet", price: 56, image: "default", description: "silver", category: "jewellery")
        sut.productList = [product1, product2]
        XCTAssertEqual(sut.productList.first, product1)
        XCTAssertEqual(sut.productList.last, product2)
        
        sut.saveFiles()
        sut.productList.removeAll()
        sut.populateFilesFromPersistenceStorage()
        XCTAssertTrue(sut.productList.count > 0)
        XCTAssertEqual(sut.productList.first, product1)
        XCTAssertEqual(sut.productList.last, product2)

    }

}
