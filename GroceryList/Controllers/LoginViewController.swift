//
//  ViewController.swift
//  GroceryList
//
//  Created by SusantShrestha on 1/26/24.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIBaseViewController {

    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginDidPress(_ sender: Any) {
        guard let email = tfEmail.text,
              let password = tfPassword.text,
              !email.isEmpty,
              !password.isEmpty
        else {
            return
        }

        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if let error = error, user == nil {
                self.showError(title: "Sign In Failed", message: error.localizedDescription)
            } else {
                self.performSegue(withIdentifier: "segGroceryList", sender: self)
            }
        }
    }
    
    @IBAction func signupDidPress(_ sender: Any) {
        guard let email = tfEmail.text,
              let password = tfPassword.text,
              !email.isEmpty,
              !password.isEmpty
        else {
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            if let error = error, user == nil {
                self.showError(title: "Sign Up Failed", message: error.localizedDescription)
            } else {
                self.performSegue(withIdentifier: "segGroceryList", sender: self)
            }
        }
    }
}

