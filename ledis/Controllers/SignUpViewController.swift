//
//  SignUpViewController.swift
//  ledis
//
//  Created by Maya Vu on 13.05.18.
//  Copyright © 2018 Maya Vu. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var ucheckedBox: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    var uncheckedBox = UIImage(named: "elipse")
    var checkedBox = UIImage(named: "CheckBox1")
    var isBoxClicked = Bool()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.layer.cornerRadius = 21.0
        usernameTextField.clipsToBounds = true
        usernameTextField.layer.borderWidth = 0.8
        usernameTextField.layer.borderColor = UIColor.black.cgColor
        emailTextField.layer.cornerRadius = 21.0
        emailTextField.clipsToBounds = true
        emailTextField.layer.borderWidth = 0.8
        emailTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.layer.cornerRadius = 21.0
        passwordTextField.clipsToBounds = true
        passwordTextField.layer.borderWidth = 0.8
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        
        usernameTextField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
        //padding View for username text field
        let paddingViewUsername = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.usernameTextField.frame.height))
        usernameTextField.leftView = paddingViewUsername
        usernameTextField.leftViewMode = UITextFieldViewMode.always
        
        //padding View for email text field
        let paddingViewEmail = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.emailTextField.frame.height))
        emailTextField.leftView = paddingViewEmail
        emailTextField.leftViewMode = UITextFieldViewMode.always
        
        //padding View for login password field
        let paddingViewPassword = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.usernameTextField.frame.height))
        passwordTextField.leftView = paddingViewPassword
        passwordTextField.leftViewMode = UITextFieldViewMode.always
        
    }
    
    @objc func handleTextInputChange () {
        let isFormValid = usernameTextField.text?.count ?? 0 > 0 && emailTextField.text?.count ?? 0 > 0 && passwordTextField.text?.count ?? 0 > 0
        if isFormValid && isBoxClicked { // have a question, how to do it correctly
            signUpButton.isEnabled = true
            signUpButton.backgroundColor = UIColor.rgb(red: 48, green: 79, blue: 254)
        }
        else {
            signUpButton.isEnabled = false
            signUpButton.backgroundColor = UIColor.rgb(red: 112, green: 131, blue: 241)
        }
    }
    
    @IBAction func handleSignUp(_ sender: UIButton) {
        guard let username = usernameTextField.text, username.count > 0 else { return }
        guard let email = emailTextField.text, email.count > 0 else { return }
        guard let password = passwordTextField.text, password.count > 0  else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let err = error {
                print ("There is a problem with registration:", err)
                return
            }
            else{
                print ("Succesfully created an user! User ID:", user?.uid ?? "")
            }
            guard let uid = user?.uid else { return }
            
            let usernameValues = ["username": username]
            let values = [uid: usernameValues]
            
            Database.database().reference().child("users").updateChildValues(values, withCompletionBlock: { (err, ref) in
                
                if let err = err {
                    print("failed to save info to database:", err)
                    return
                }
                else{
                    print("Successfully saved info")
                }
            })
        }
    }
    @IBAction func clickBox(_ sender: UIButton) {
     
        
        isBoxClicked = isBoxClicked == true ? false : true
        
        isBoxClicked == true ? ucheckedBox.setImage(checkedBox, for: UIControlState.normal) : ucheckedBox.setImage(uncheckedBox, for: UIControlState.normal)
        
       
    }
    
}
