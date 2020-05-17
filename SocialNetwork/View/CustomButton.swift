//
//  CustomButton.swift
//  SocialNetwork
//
//  Created by Fernando Zelaya on 5/17/20.
//  Copyright © 2020 Fernando Zelaya. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(displayP3Red: shadowGrey, green: shadowGrey, blue: shadowGrey, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        imageView?.contentMode = .scaleAspectFit
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 20
    }
    

}
