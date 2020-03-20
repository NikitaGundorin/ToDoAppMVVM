//
//  ToDoCheckBox.swift
//  ToDoAppMVVM
//
//  Created by Никита Гундорин on 20.03.2020.
//  Copyright © 2020 Никита Гундорин. All rights reserved.
//

import UIKit

@IBDesignable class ToDoCheckbox: UIButton {
    
    private var isSetuped = false
    
    var isChecked = false {
        didSet {
            UIView.animate(withDuration: 0.2) {
                if (self.isChecked) {
                    self.layer.backgroundColor = self.borderColor.cgColor
                }
                else {
                    self.layer.backgroundColor = UIColor.white.cgColor
                }
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = CGFloat(2) {
        didSet { layer.borderWidth = borderWidth }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.systemRed {
        didSet { layer.borderColor = borderColor.cgColor }
    }
    
    @IBInspectable var cornerRaduis: CGFloat = CGFloat(15) {
        didSet { layoutIfNeeded() }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if (isSetuped) {
           return
        }
        
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRaduis
        layer.borderColor = borderColor.cgColor
        
        isSetuped = true
    }
}
