//
//  AddMahiPopUpController.swift
//  MAHI_SPRAY_APP
//
//  Created by Jaron Schreiber on 11/4/18.
//  Copyright © 2018 HACC. All rights reserved.
//

import UIKit

class AddMahiPopUpController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
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
    
    let imagePickerController = UIImagePickerController()
    
    @IBAction func addImageTapped(_ sender: UITapGestureRecognizer) {
        mahiNameTextField.resignFirstResponder()
        mahiAddressTextField.resignFirstResponder()
        yearAppliedField.resignFirstResponder()
        
        
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = false
        imagePickerController.delegate = self
        imagePickerController.modalPresentationStyle = .fullScreen
        imagePickerController.modalTransitionStyle = .coverVertical
        imagePickerController.didMove(toParent: self)
        self.view.addSubview(imagePickerController.view)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePickerController.view.removeFromSuperview()
        imagePickerController.removeFromParent()
    }
    
    //ImageView
    @IBOutlet weak var imagePicked: UIImageView!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        imagePicked.image = selectedImage
        imagePickerController.view.removeFromSuperview()
        imagePickerController.removeFromParent()
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
            let newFarm : Mahi = Mahi(name: mahiName, address: mahiAddress, yearApplied: Int(mahiYear) ?? 2018, image: imagePicked.image ?? UIImage(named: "no_photo")!)
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
