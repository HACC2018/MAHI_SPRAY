//
//  SignUpViewController.swift
//  MAHI_SPRAY_APP
//
//  Created by Jaron Schreiber on 10/30/18.
//  Copyright © 2018 HACC. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    //Design Outlets
    @IBOutlet weak var sign_up_card: UIView!
    @IBOutlet weak var logo_card: UIView!
    @IBOutlet weak var sign_up_button_card: UIView!
    
    weak var delegate: MyDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate?.logo_card_design(ViewToAffect: logo_card)
        delegate?.logo_card_design(ViewToAffect: sign_up_button_card)
        delegate?.logo_card_design(ViewToAffect: sign_up_card)
        
        let layer = CAGradientLayer()
        layer.frame = self.view.bounds
        layer.colors = [UIColor.init(red: 0.301, green: 0.973, blue: 1.0, alpha: 0.5).cgColor, UIColor.init(red: 0.25882, green: 0.7137, blue: 0.9568, alpha: 0.5).cgColor]
        view.layer.insertSublayer(layer, at: 0)
    }
    
    //Textfield Input Outlets
    @IBOutlet weak var usernameInputField: UITextField!
    
    @IBOutlet weak var createPasswordInputField: UITextField!
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: usernameInputField.text!, password: createPasswordInputField.text!) { (user, error) in
            if user != nil {
                print("User Created")
                self.performSegue(withIdentifier: "loginController", sender: self)
            }
            
            else {
                print("error! no input found!")
            }
        }
    }
    
    @IBAction func needToLogInButtonPressed(_ sender: UIButton) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginController") as? LoginViewController {
            self.present(vc, animated: false, completion: nil)
        }
        
        
    }
}
