//
//  ProductCVFullWidthCell.swift
//  AppAssignment
//
//  Created by Zulqurnain on 06/02/2021.
//

import UIKit
import Kingfisher

class ProductCVFullWidthCell: UICollectionViewCell {

    static let identifier = "ProductCVFullWidthCell"
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    
    var product: Product? {
        didSet {
            self.productName.text = self.product?.title
            let url = URL(string: self.product?.image ?? "default")
            self.productImageView.kf.setImage(with: url)
            self.productPrice.text = "AED \(self.product?.price ?? 0.0)"
            self.productDescription.text = self.product?.description
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
