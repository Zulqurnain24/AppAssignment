//
//  FileDetailViewModel.swift
//  AppAssignment
//
//  Created by Zulqurnain on 26/01/2021.
//  Copyright © 2021 Mohammad Zulqurnain. All rights reserved.
//

import Foundation

class ProductDetailViewModel {
    var completionHandler: ((Product) -> Void)? = nil
    
    var product: Product? {
        didSet {
            guard let product = self.product else { return }
            completionHandler?(product)
        }
    }
}
