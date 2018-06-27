//
//  CustomButton.swift
//  ledis
//
//  Created by Maya Vu on 27.06.18.
//  Copyright © 2018 Maya Vu. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    
    @IBInspectable var radius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = radius
        }
    }
}
