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
        usernameTextField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
    }
    
    @objc func handleTextInputChange () {
        let isFormValid = usernameTextField.text?.count ?? 0 > 0 && emailTextField.text?.count ?? 0 > 0 && passwordTextField.text?.count ?? 0 > 0
        if isBoxClicked{
            signUpButton.isEnabled = isFormValid
        }
        signUpButton.backgroundColor = isFormValid ? StyleManager.Colors.validInput : StyleManager.Colors.invalidInput
    }
    
    @IBAction func handleSignUp(_ sender: UIButton) {
        guard let username = usernameTextField.text, username.count > 0, let email = emailTextField.text, email.count > 0, let password = passwordTextField.text, password.count > 0 else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let err = error {
                print ("There is a problem with registration:", err)
                return
            }else{
                print ("Succesfully created an user! User ID:", user?.uid ?? "")
            }
            guard let uid = user?.uid else { return }
            let usernameValues = ["username": username]
            let values = [uid: usernameValues]
            Database.database().reference().child("users").updateChildValues(values, withCompletionBlock: { (err, ref) in
                
                if let err = err {
                    print("failed to save info to database:", err)
                    return
                }else{
                    print("Successfully saved info")
                }
            })
        }
    }
    @IBAction func checkBox(_ sender: UIButton) {
        isBoxClicked = isBoxClicked == true ? false : true
        isBoxClicked == true ? ucheckedBox.setImage(checkedBox, for: UIControlState.normal) : ucheckedBox.setImage(uncheckedBox, for: UIControlState.normal)
    }
}
