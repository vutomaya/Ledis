//
//  GradientView.swift
//  ledis
//
//  Created by Maya Vu on 01.05.18.
//  Copyright © 2018 Maya Vu. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var FirstColor: UIColor = UIColor.clear{
        didSet{
            updateView()
        }
    }
    @IBInspectable var SecondColor: UIColor = UIColor.clear{
        didSet{
            updateView()
        }
    }
    @IBInspectable var ThirdColor: UIColor = UIColor.clear{
        didSet{
            updateView()
        }
    }
    @IBInspectable var FourthColor: UIColor = UIColor.clear{
        didSet{
            updateView()
        }
    }
    @IBInspectable var FifthColor: UIColor = UIColor.clear{
        didSet{
            updateView()
        }
    }
    @IBInspectable var SixthColor: UIColor = UIColor.clear{
        didSet{
            updateView()
        }
    }
    
    override class var layerClass: AnyClass{
        get{
           return CAGradientLayer.self
    }
    }
    
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [FirstColor.cgColor, SecondColor.cgColor, ThirdColor.cgColor, FourthColor.cgColor, FifthColor.cgColor, SixthColor.cgColor]
        layer.locations = [0.0, 0.25, 0.45, 0.65, 0.90, 1.0]
        
    }
    
}
