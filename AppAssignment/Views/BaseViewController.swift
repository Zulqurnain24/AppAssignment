//
//  BaseViewController.swift
//  AppAssignment
//
//  Created by Zulqurnain on 25/01/2021.
//  Copyright © 2021 Mohammad Zulqurnain. All rights reserved.
//

import UIKit

protocol BaseViewControllerDelegate {
    func setupTouchResponder()
    func dismissKeyboard()
}

class BaseViewController: UIViewController, BaseViewControllerDelegate {

    override func loadView() {
        super.loadView()
        
        setupTouchResponder()
    }
   
    func setupTouchResponder() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
