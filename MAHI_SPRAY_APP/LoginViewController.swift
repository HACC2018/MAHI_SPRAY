//
//  ViewController.swift
//  MAHI_SPRAY_APP
//
//  Created by Jaron Schreiber on 10/30/18.
//  Copyright © 2018 HACC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginCard: UIView!
    @IBOutlet weak var logo_card: UIView!
    @IBOutlet weak var login_button_card: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginCard.layer.cornerRadius = 25.0
        logo_card_design(ViewToAffect: logo_card)
        logo_card_design(ViewToAffect: login_button_card)
        
        let layer = CAGradientLayer()
        layer.frame = self.view.bounds
        layer.colors = [UIColor.init(red: 0.301, green: 0.973, blue: 1.0, alpha: 0.5).cgColor, UIColor.init(red: 0.25882, green: 0.7137, blue: 0.9568, alpha: 0.5).cgColor]
        view.layer.insertSublayer(layer, at: 0)
        
    }
    
    func logo_card_design (ViewToAffect: UIView) {
        ViewToAffect.layer.cornerRadius = 25.0
        //ViewToAffect.layer.shadowColor = UIColor.black.cgColor
        ViewToAffect.layer.shadowOpacity = 0.2
        //ViewToAffect.layer.shadowOffset = CGSize.zero
        ViewToAffect.layer.shadowRadius = 10
    }
    
    


}

