//
//  SignUpViewController.swift
//  ledis
//
//  Created by Maya Vu on 13.05.18.
//  Copyright © 2018 Maya Vu. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var UsernameTxtField: UITextField!
    @IBOutlet weak var EmailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UsernameTxtField.layer.cornerRadius = 21.0
        UsernameTxtField.clipsToBounds = true
        UsernameTxtField.layer.borderWidth = 0.8
        UsernameTxtField.layer.borderColor = UIColor.black.cgColor
        EmailTxtField.layer.cornerRadius = 21.0
        EmailTxtField.clipsToBounds = true
        EmailTxtField.layer.borderWidth = 0.8
        EmailTxtField.layer.borderColor = UIColor.black.cgColor
        passwordTxtField.layer.cornerRadius = 21.0
        passwordTxtField.clipsToBounds = true
        passwordTxtField.layer.borderWidth = 0.8
        passwordTxtField.layer.borderColor = UIColor.black.cgColor
        
        
    }

}
