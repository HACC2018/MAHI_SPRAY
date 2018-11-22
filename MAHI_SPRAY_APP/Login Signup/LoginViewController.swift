//
//  ViewController.swift
//  MAHI_SPRAY_APP
//
//  Created by Jaron Schreiber on 10/30/18.
//  Copyright © 2018 HACC. All rights reserved.
//

import UIKit
import FirebaseAuth

protocol MyDelegate: class {
    func logo_card_design(ViewToAffect: UIView)
    func backgroundImageWithHue(viewYouIn: UIView, backgroundImageName: String, RedValFrom: CGFloat, GreenValFrom: CGFloat, BlueValFrom: CGFloat, RedValTo: CGFloat, GreenValTo: CGFloat, BlueValTo: CGFloat)
}

class LoginViewController: UIViewController, MyDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var loginCard: UIView!
    @IBOutlet weak var logo_card: UIView!
    @IBOutlet weak var login_button_card: UIView!
    
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logo_card_design(ViewToAffect: loginCard)
        logo_card_design(ViewToAffect: logo_card)
        logo_card_design(ViewToAffect: login_button_card)
        backgroundImageWithHue(viewYouIn: self.view, backgroundImageName: "patch_background", RedValFrom: 0.839, GreenValFrom: 0.47, BlueValFrom: 0.247, RedValTo: 0.824, GreenValTo: 0.255, BlueValTo: 0.282)

        let loginCardBG = CAGradientLayer()
        loginCardBG.frame = loginCard.bounds
        loginCardBG.startPoint = CGPoint(x: 0, y: 0)
        loginCardBG.endPoint = CGPoint(x: 1, y: 1)
        loginCardBG.colors = [UIColor.init(red: 0.839, green: 0.47, blue: 0.247, alpha: 1.0).cgColor, UIColor.init(red: 0.824, green: 0.255, blue: 0.282, alpha: 1.0).cgColor]
        loginCard.layer.insertSublayer(loginCardBG, at: 0)
        
        usernameLogInputField.layer.shadowRadius = 10
        usernameLogInputField.layer.shadowOpacity = 0.1
        passwordLogInputField.layer.shadowRadius = 10
        passwordLogInputField.layer.shadowOpacity = 0.1
        
        usernameLogInputField.delegate = self
        passwordLogInputField.delegate = self
        
        usernameLogInputField.text = "jkschrei@gmail.com"
        passwordLogInputField.text = "123456"
    }
    
    //Textfield Outlets
    @IBOutlet weak var usernameLogInputField: UITextField!
    
    @IBOutlet weak var passwordLogInputField: UITextField!
    
    @IBAction func go_sign_up_pressed(_ sender: UIButton) {
        needToCreateAccountButtonPressed()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func activityShow() {
        if activityIndicator.isDescendant(of: self.view) {
            //loginCard.layer.opacity = 1.0
            self.view.layer.opacity = 1.0
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
            print("should stop")
        }
            
        else {
            //loginCard.layer.opacity = 0.8
            self.view.layer.opacity = 0.7
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.color = UIColor.black
            self.view.addSubview(activityIndicator)
            //self.view.bringSubviewToFront(activityIndicator)
            //self.view.insertSubview(activityIndicator, at: 0)
            activityIndicator.startAnimating()
        }
    }
    
    @IBAction func logInButton(_ sender: UIButton) {
        self.activityShow()
        
        Auth.auth().signIn(withEmail: usernameLogInputField.text!, password: passwordLogInputField.text!) { (user, error) in
            if user != nil {
                self.activityShow()
                if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main screen") as? MahiTabsController {
                    self.present(vc, animated: false, completion: nil)
                }
            }
                
            else {
                self.activityShow()
                let alert = UIAlertController(title: "Sorry", message: "Either your username or password were wrong.", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func needToCreateAccountButtonPressed() {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signUpController") as? SignUpViewController {
            vc.delegate = self
            self.present(vc, animated: false, completion: nil)
        }
    }
    
    func logo_card_design (ViewToAffect: UIView) {
        ViewToAffect.layer.cornerRadius = 25.0
        ViewToAffect.clipsToBounds = true
    }
    
    func backgroundImageWithHue(viewYouIn: UIView, backgroundImageName: String, RedValFrom: CGFloat, GreenValFrom: CGFloat, BlueValFrom: CGFloat, RedValTo: CGFloat, GreenValTo: CGFloat, BlueValTo: CGFloat) {
        var backgroundImageView : UIImageView!
        backgroundImageView = UIImageView(frame: viewYouIn.bounds)
        backgroundImageView.contentMode =  UIView.ContentMode.scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.image = UIImage(named: backgroundImageName)
        backgroundImageView.center = viewYouIn.center
        backgroundImageView.layer.opacity = 0.5
        viewYouIn.addSubview(backgroundImageView)
        viewYouIn.sendSubviewToBack(backgroundImageView)

        let signInBackgroundGradient = CAGradientLayer()
        signInBackgroundGradient.frame = viewYouIn.bounds
        signInBackgroundGradient.colors = [UIColor.init(red: RedValFrom, green: GreenValFrom, blue: BlueValFrom, alpha: 0.5).cgColor, UIColor.init(red: RedValTo, green: GreenValTo, blue: BlueValTo, alpha: 0.5).cgColor]
        viewYouIn.layer.insertSublayer(signInBackgroundGradient, at: 1)
    }
    
}

