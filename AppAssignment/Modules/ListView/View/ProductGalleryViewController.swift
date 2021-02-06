//
//  FileGalleryViewController.swift
//  AppAssignment
//
//  Created by Zulqurnain on 25/01/2021.
//  Copyright © 2021 Mohammad Zulqurnain. All rights reserved.
//

import UIKit

class ProductGalleryViewController: UICollectionViewController {
 
    var productGalleryViewModel = ProductGalleryViewModel()
    
    var selectedRow: Int?
    
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        productGalleryViewModel.refreshCompletionHandler = {
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
        
        populateData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if  let vc = segue.destination as? ProductDetailViewController,
            let selectdRow = self.selectedRow as Int?,
            selectdRow < productGalleryViewModel.productList.count {
            vc.productDetailViewModel.product = productGalleryViewModel.productList[selectdRow]
        }
    }
    
    func populateData() {
        productGalleryViewModel.fetchProductList()
    }
}

// MARK: - Collection view data source
extension ProductGalleryViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productGalleryViewModel.productList.count
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = indexPath.row

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCVFullWidthCell.identifier, for: indexPath) as? ProductCVFullWidthCell
        cell?.product = productGalleryViewModel.productList[row]
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 376, height: 113)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        performSegue(withIdentifier: "segueToDetailView", sender: self)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
         let offsetY = scrollView.contentOffset.y
         let contentHeight = scrollView.contentSize.height

         if (offsetY > contentHeight - scrollView.frame.height * 4) && !isLoading {
            productGalleryViewModel.refreshCompletionHandler?()
         }
     }

}
