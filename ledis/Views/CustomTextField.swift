//
//  CustomTextField.swift
//  ledis
//
//  Created by Maya Vu on 30.06.18.
//  Copyright © 2018 Maya Vu. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 21.0
        self.layer.borderWidth = 0.8
        self.layer.borderColor = UIColor.black.cgColor
        self.clipsToBounds = true
        let paddingViewUsername = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        self.leftView = paddingViewUsername
        self.leftViewMode = UITextFieldViewMode.always
    }
}
