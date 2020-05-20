//
//  FeedViewController.swift
//  SocialNetwork
//
//  Created by Fernando Zelaya on 5/19/20.
//  Copyright © 2020 Fernando Zelaya. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func signOutPressed(_ sender: Any) {
        
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: keyUID)
        print("ID removed from keychain")
        try! Auth.auth().signOut()
        dismiss(animated: true, completion: nil)
    }
}
