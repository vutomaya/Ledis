//
//  LogInViewController.swift
//  ledis
//
//  Created by Maya Vu on 13.05.18.
//  Copyright © 2018 Maya Vu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    

    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //handle Text incpute change
        emailTextField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
    }
    
    @IBAction func handleLogin(_ sender: UIButton) {
        guard let login = emailTextField.text, let password = passwordTextField.text else { return }
        Auth.auth().signIn(withEmail: login, password: password) { (user, error) in
            if let error = error{
                print ("Failed to login:", error)
            }else{
                print("Successfully login! User:", user?.uid ?? "")
            }
        }
    }
    
    @objc func handleTextInputChange () {
        let isFormValid = (emailTextField.text?.count ?? 0) > 0 && (passwordTextField.text?.count ?? 0) > 0
        loginButton.isEnabled = isFormValid
        loginButton.backgroundColor = isFormValid ? StyleManager.Colors.validInput : StyleManager.Colors.invalidInput
    }
}
