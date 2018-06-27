//
//  MenuViewController.swift
//  ledis
//
//  Created by Maya Vu on 13.05.18.
//  Copyright © 2018 Maya Vu. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

  
    @IBOutlet var ButtonsCollection: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<ButtonsCollection.count {
        ButtonsCollection[i].layer.borderColor = UIColor.black.cgColor
        ButtonsCollection[i].layer.borderWidth = 0.25
        }
    }
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: false)
}
}
