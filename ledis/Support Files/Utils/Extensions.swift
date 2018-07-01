//
//  Extensions.swift
//  ledis
//
//  Created by Maya Vu on 01.05.18.
//  Copyright © 2018 Maya Vu. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgb (red: CGFloat , green: CGFloat, blue: CGFloat) -> UIColor {
        
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

