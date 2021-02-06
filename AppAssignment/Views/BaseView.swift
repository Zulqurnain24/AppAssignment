//
//  BaseView.swift
//  AppAssignment
//
//  Created by Zulqurnain on 25/01/2021.
//  Copyright © 2021 Mohammad Zulqurnain. All rights reserved.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
         
        super.init(frame: frame)
         
        self.setupTouchResponder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTouchResponder() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        self.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
}
