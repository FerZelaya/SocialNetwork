//
//  CustomImageView.swift
//  SocialNetwork
//
//  Created by Fernando Zelaya on 5/20/20.
//  Copyright © 2020 Fernando Zelaya. All rights reserved.
//

import UIKit

class CustomImageView: UIImageView {
    
    override func layoutSubviews() {

        layer.cornerRadius = self.frame.width / 2
    }

}
