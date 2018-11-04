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
        delegate?.backgroundImageWithHue(viewYouIn: self.view, backgroundImageName: "taro_background", RedValFrom: 0.301, GreenValFrom: 0.973, BlueValFrom: 1.0, RedValTo: 0.25882, GreenValTo: 0.7137, BlueValTo: 0.9568)
        
        let registerBackgroundGradient = CAGradientLayer()
        registerBackgroundGradient.frame = sign_up_card.bounds
        registerBackgroundGradient.startPoint = CGPoint(x: 0, y: 0)
        registerBackgroundGradient.endPoint = CGPoint(x: 1, y: 1)
        registerBackgroundGradient.colors = [UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0).cgColor, UIColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor]
        sign_up_card.layer.insertSublayer(registerBackgroundGradient, at: 0)
        
        usernameInputField.layer.shadowRadius = 5
        usernameInputField.layer.shadowOpacity = 0.2
        usernameInputField.layer.shadowOffset = CGSize(width: 1, height: 5)
        createPasswordInputField.layer.shadowRadius = 5
        createPasswordInputField.layer.shadowOpacity = 0.2
        createPasswordInputField.layer.shadowOffset = CGSize(width: 1, height: 5)
    }
    
    //Textfield Input Outlets
    @IBOutlet weak var usernameInputField: UITextField!
    
    @IBOutlet weak var createPasswordInputField: UITextField!
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: usernameInputField.text!, password: createPasswordInputField.text!) { (user, error) in
            if user != nil {
                if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginController") as? LoginViewController {
                    self.present(vc, animated: false, completion: nil)
                }
            }
            
            else {
                let alert = UIAlertController(title: "Sorry", message: "Please use a real email", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "Okay", style: .default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func needToLogInButtonPressed(_ sender: UIButton) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginController") as? LoginViewController {
            self.present(vc, animated: false, completion: nil)
        }
    }
}
