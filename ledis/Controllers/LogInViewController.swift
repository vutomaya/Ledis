//
//  LogInViewController.swift
//  ledis
//
//  Created by Maya Vu on 13.05.18.
//  Copyright © 2018 Maya Vu. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    

    @IBOutlet weak var LogInTxtField: UITextField!
    @IBOutlet weak var PasswordTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LogInTxtField.layer.cornerRadius = 21.0
        LogInTxtField.clipsToBounds = true
        LogInTxtField.layer.borderWidth = 0.8
        LogInTxtField.layer.borderColor = UIColor.black.cgColor
        PasswordTxtField.layer.cornerRadius = 21.0
        PasswordTxtField.clipsToBounds = true
        PasswordTxtField.layer.borderWidth = 0.8
        PasswordTxtField.layer.borderColor = UIColor.black.cgColor
        
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.LogInTxtField.frame.height))
        LogInTxtField.leftView = paddingView
        LogInTxtField.leftViewMode = UITextFieldViewMode.always
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.PasswordTxtField.frame.height))
        PasswordTxtField.leftView = paddingView
        PasswordTxtField.leftViewMode = UITextFieldViewMode.always

    
    }
}
