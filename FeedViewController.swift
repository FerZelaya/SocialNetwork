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
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    

    @IBAction func signOutPressed(_ sender: Any) {
        
        let _ = KeychainWrapper.standard.removeObject(forKey: keyUID)
        print("ID removed from keychain")
        try! Auth.auth().signOut()
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
}


extension FeedViewController: UITableViewDelegate, UITableViewDataSource {    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCellTableViewCell
    }
    
}
