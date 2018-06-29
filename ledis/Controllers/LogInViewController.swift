//
//  LogInViewController.swift
//  ledis
//
//  Created by Maya Vu on 13.05.18.
//  Copyright © 2018 Maya Vu. All rights reserved.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {
    

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.layer.cornerRadius = 21.0
        loginTextField.clipsToBounds = true
        loginTextField.layer.borderWidth = 0.8
        loginTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.layer.cornerRadius = 21.0
        passwordTextField.clipsToBounds = true
        passwordTextField.layer.borderWidth = 0.8
        passwordTextField.layer.borderColor = UIColor.black.cgColor
    
        //padding View for login text field
        let paddingViewLogin = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.loginTextField.frame.height))
        loginTextField.leftView = paddingViewLogin
        loginTextField.leftViewMode = UITextFieldViewMode.always
        
        //padding View for password text field
        let paddingViewPassword = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.passwordTextField.frame.height))
        passwordTextField.leftView = paddingViewPassword
        passwordTextField.leftViewMode = UITextFieldViewMode.always
        
        loginTextField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
    
    }
    
    @IBAction func handleLogin(_ sender: UIButton) {
        guard let login = loginTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: login, password: password) { (user, error) in
            
            if let err = error{
                
                print ("Failed to login:", err)
            }
            else{
                print("Successfully login! User:", user?.uid ?? "")
            }
        }
    }
    
    @objc func handleTextInputChange () {
        let isFormValid = loginTextField.text?.count ?? 0 > 0 && passwordTextField.text?.count ?? 0 > 0
        if isFormValid {
            loginButton.isEnabled = true
            loginButton.backgroundColor = UIColor.rgb(red: 48, green: 79, blue: 254)
        }
        else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = UIColor.rgb(red: 112, green: 131, blue: 241)
        }
    }
}
