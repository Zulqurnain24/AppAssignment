//
//  FileGalleryViewModel.swift
//  AppAssignment
//
//  Created by Zulqurnain on 26/01/2021.
//  Copyright © 2021 Mohammad Zulqurnain. All rights reserved.
//

import Foundation

class ProductGalleryViewModel {
    private let webserviceManager = WebserviceManager()
    var productList = [Product]() {
        didSet {
            guard productList.count > 0 else { return }
            saveFiles()
            refreshCompletionHandler?()
        }
    }
    
    var refreshCompletionHandler: (() -> Void)? = nil

    func saveFiles() {
        PersistentStoreManager.shared.setObject(uniqueId: StringConstants.products.rawValue, key: StringConstants.products.rawValue, value: productList)
    }
    
    func populateFilesFromPersistenceStorage() {
        guard let savedFileList = PersistentStoreManager.shared.getObject(uniqueId: StringConstants.products.rawValue, StringConstants.products.rawValue, [Product].self)
        else { return }

        self.productList = savedFileList
    }
    
    func fetchProductList() {
        webserviceManager.callProductsListService({ productList in
            self.productList = productList ?? []
            self.refreshCompletionHandler?()
        }, { error in
            CommonFunctionality.displayErrorAlert() {
                self.populateFilesFromPersistenceStorage()
                self.refreshCompletionHandler?()
            }
        })
    }
}
