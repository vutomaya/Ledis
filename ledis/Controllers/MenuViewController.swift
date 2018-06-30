//
//  MenuViewController.swift
//  ledis
//
//  Created by Maya Vu on 13.05.18.
//  Copyright © 2018 Maya Vu. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet var buttonsCollection: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonsCollection.forEach {
            $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.borderWidth = 0.25
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

