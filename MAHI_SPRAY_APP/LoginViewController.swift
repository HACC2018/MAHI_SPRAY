//
//  ViewController.swift
//  MAHI_SPRAY_APP
//
//  Created by Jaron Schreiber on 10/30/18.
//  Copyright © 2018 HACC. All rights reserved.
//

import UIKit

protocol MyDelegate: class {
    func logo_card_design(ViewToAffect: UIView)
    
}

class LoginViewController: UIViewController, MyDelegate {

    @IBOutlet weak var loginCard: UIView!
    @IBOutlet weak var logo_card: UIView!
    @IBOutlet weak var login_button_card: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logo_card_design(ViewToAffect: loginCard)
        logo_card_design(ViewToAffect: logo_card)
        logo_card_design(ViewToAffect: login_button_card)
        
        let layer = CAGradientLayer()
        layer.frame = self.view.bounds
        layer.colors = [UIColor.init(red: 0.301, green: 0.973, blue: 1.0, alpha: 0.5).cgColor, UIColor.init(red: 0.25882, green: 0.7137, blue: 0.9568, alpha: 0.5).cgColor]
        view.layer.insertSublayer(layer, at: 0)
        
    }
    
    @IBAction func go_sign_up_pressed(_ sender: UIButton) {
        needToCreateAccountButtonPressed()
    }
    
    func needToCreateAccountButtonPressed() {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signUpController") as? SignUpViewController {
            vc.delegate = self
            self.present(vc, animated: false, completion: nil)
        }
    }
    
    func logo_card_design (ViewToAffect: UIView) {
        ViewToAffect.layer.cornerRadius = 25.0
        //ViewToAffect.layer.shadowColor = UIColor.black.cgColor
        ViewToAffect.layer.shadowOpacity = 0.2
        //ViewToAffect.layer.shadowOffset = CGSize.zero
        ViewToAffect.layer.shadowRadius = 10
    }

}

