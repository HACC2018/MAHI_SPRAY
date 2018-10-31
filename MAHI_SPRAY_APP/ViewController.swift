//
//  ViewController.swift
//  MAHI_SPRAY_APP
//
//  Created by Jaron Schreiber on 10/30/18.
//  Copyright © 2018 HACC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginCard: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginCard.layer.cornerRadius = 5.0
        
        let layer = CAGradientLayer()
        layer.frame = self.view.bounds
        layer.colors = [UIColor.init(red: 0.301, green: 0.973, blue: 1.0, alpha: 1.0).cgColor, UIColor.init(red: 0.25882, green: 0.7137, blue: 0.9568, alpha: 1.0).cgColor]
        view.layer.insertSublayer(layer, at: 0)
        
    }
    
    


}

