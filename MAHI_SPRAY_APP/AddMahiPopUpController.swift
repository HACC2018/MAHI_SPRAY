//
//  AddMahiPopUpController.swift
//  MAHI_SPRAY_APP
//
//  Created by Jaron Schreiber on 11/4/18.
//  Copyright © 2018 HACC. All rights reserved.
//

import UIKit

class AddMahiPopUpController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var mahiNameTextField: UITextField!
    @IBOutlet weak var mahiAddressTextField: UITextField!
    @IBOutlet weak var yearAppliedField: UITextField!
    
    weak var delegate: addMahiDelegate?
    @IBOutlet var outsideView: UIView!
    @IBOutlet weak var addMahiCard: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outsideView.layer.shadowRadius = 5.0
        outsideView.layer.shadowOpacity = 0.3
        addMahiCard.layer.cornerRadius = 10.0

        mahiNameTextField.delegate = self
        mahiAddressTextField.delegate = self
        yearAppliedField.delegate = self
    }
    
    @IBAction func cancelAddingMahiButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        delegate?.removeBlur()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func done(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
        if let mahiName = mahiNameTextField.text, let mahiAddress = mahiAddressTextField.text, let mahiYear = yearAppliedField.text {
            let newFarm : Mahi = Mahi(name: mahiName, address: mahiAddress, yearApplied: Int(mahiYear) ?? 2018)
            farms.append(newFarm)
        }
        
        delegate?.removeBlur()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
