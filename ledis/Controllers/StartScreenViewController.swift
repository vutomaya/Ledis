//
//  StartScreenViewController.swift
//  ledis
//
//  Created by Maya Vu on 13.05.18.
//  Copyright © 2018 Maya Vu. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {
    
    @IBOutlet weak var PlayAsGuestBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        PlayAsGuestBtn.layer.borderColor = UIColor.black.cgColor
        
        PlayAsGuestBtn.layer.borderWidth = 0.25
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

}
