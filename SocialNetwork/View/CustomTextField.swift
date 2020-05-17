//
//  CustomTextField.swift
//  SocialNetwork
//
//  Created by Fernando Zelaya on 5/17/20.
//  Copyright © 2020 Fernando Zelaya. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor(red: shadowGrey, green: shadowGrey, blue: shadowGrey, alpha: 0.2).cgColor
        layer.borderWidth = 3.0
        layer.cornerRadius = 5.0
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }

}
