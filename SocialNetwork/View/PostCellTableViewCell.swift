//
//  PostCellTableViewCell.swift
//  SocialNetwork
//
//  Created by Fernando Zelaya on 5/23/20.
//  Copyright © 2020 Fernando Zelaya. All rights reserved.
//

import UIKit

class PostCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var caption: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    

}
