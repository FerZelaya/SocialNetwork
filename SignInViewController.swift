//
//  ViewController.swift
//  SocialNetwork
//
//  Created by Fernando Zelaya on 5/16/20.
//  Copyright © 2020 Fernando Zelaya. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase


class SignInViewController: UIViewController {

    @IBOutlet weak var FBButton: CustomButton!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }


    @IBAction func FBButtonPressed(_ sender: CustomButton) {
        
        let fbLogin = LoginManager()
        
        fbLogin.logIn(permissions: ["email"], from: self) { (results, error) in
            if error != nil {
                print("Unable to Authenticate with Facebook, \(String(describing: error))")
            } else if results?.isCancelled == true  {
                print("User cancelled Facebook authentication")
            } else {
                print("Success")
                let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
                self.firebaseAuth(credential)
            }
        }
  
    }
    
    
    
    @IBAction func signInPressed(_ sender: Any) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if error == nil {
                    print("Email authenticated with firebase")
                } else {
                    Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                        if error != nil {
                            print("Unable to authenticate this email with firebase")
                        } else {
                            print("Succesfully authenticated your email with firebase")
                        }
                    }
                }
            }
        }
        
        
    }
    
    

    //MARK: - Firebase
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential) { (resutls, error) in
            if error != nil {
                print("Unable to authenticate with firebase, \(String(describing: error))")
            } else {
                print("Success with firebase")
            }
        }
    }
    
}





//MARK: - Extensions


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
}


