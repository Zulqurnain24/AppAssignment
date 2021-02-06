//
//  FileDetailViewController.swift
//  AppAssignment
//
//  Created by Zulqurnain on 25/01/2021.
//  Copyright © 2021 Mohammad Zulqurnain. All rights reserved.
//

import UIKit

class ProductDetailViewController: BaseViewController {
    
    @IBOutlet weak var productDetailLabel: UILabel!
    
    @IBOutlet weak var productImageView: UIImageView!

    @IBOutlet weak var productTitleLabel: UILabel!
    
    @IBOutlet weak var productPriceLabel: UILabel!
    
    @IBOutlet weak var productCategoryLabel: UILabel!
    
    @IBOutlet weak var productDetailScrollview: UIScrollView!
    
    var productDetailViewModel = ProductDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productDetailViewModel.completionHandler = { product in
            DispatchQueue.main.async {
                let url = URL(string: self.productDetailViewModel.product?.image ?? "default")
                self.productImageView.kf.setImage(with: url)
                
                self.productTitleLabel.text = product.title
                
                self.productPriceLabel.text = "AED \(product.price ?? 0.0)"
                
                self.productCategoryLabel.text = product.category
                
                self.productDetailLabel.text =  product.description
            }
        }
        self.setupScrollViewConstraint()
    }
    
    func setupScrollViewConstraint() {
        productDetailScrollview.contentLayoutGuide.bottomAnchor.constraint(equalTo: productDetailLabel.bottomAnchor).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let product = productDetailViewModel.product else { return }
        productDetailViewModel.completionHandler?(product)
    }
    
}
