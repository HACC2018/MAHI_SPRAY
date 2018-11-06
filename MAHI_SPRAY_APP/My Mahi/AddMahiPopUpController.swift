//
//  AddMahiPopUpController.swift
//  MAHI_SPRAY_APP
//
//  Created by Jaron Schreiber on 11/4/18.
//  Copyright © 2018 HACC. All rights reserved.
//

import UIKit

var navBarheight : CGFloat = 0


class AddMahiPopUpController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var dateAppliedPicker: UIDatePicker!
    @IBOutlet weak var mahiNameTextField: UITextField!
    @IBOutlet weak var mahiAddressTextField: UITextField!
    @IBOutlet var outsideView: UIStackView!
    @IBOutlet weak var addMahiCard: UIView!
        
    @IBOutlet weak var scrollView: UIScrollView!
    
    weak var delegate: addMahiDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mahiNameTextField.layer.shadowRadius = 5
        mahiNameTextField.layer.shadowOpacity = 0.2
        mahiNameTextField.layer.shadowOffset = CGSize(width: 1, height: 5)
        mahiAddressTextField.layer.shadowRadius = 5
        mahiAddressTextField.layer.shadowOpacity = 0.2
        mahiAddressTextField.layer.shadowOffset = CGSize(width: 1, height: 5)
        
        //scrollView.bottomAnchor(equalTo: UIScreen.)
        
        scrollView.contentInset.top = navBarheight
        
        scrollView.contentOffset.y = navBarheight
        
//        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 200)
        
        outsideView.layer.shadowRadius = 5.0
        outsideView.layer.shadowOpacity = 0.3
        addMahiCard.layer.cornerRadius = 40.0
        
        mahiNameTextField.delegate = self
        mahiAddressTextField.delegate = self
    }
    
    //Image Picker
    let imagePickerController = UIImagePickerController()
    
    @IBAction func addImageTapped(_ sender: UITapGestureRecognizer) {
        mahiNameTextField.resignFirstResponder()
        mahiAddressTextField.resignFirstResponder()        
        
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
        delegate?.hideToolbar(isHidden: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    //Date Picker Format
    //let formatter = DateFormatter()
    
    @IBAction func done(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        delegate?.hideToolbar(isHidden: true)
        
        if let mahiName = mahiNameTextField.text, let mahiAddress = mahiAddressTextField.text {
            let newFarm : Mahi = Mahi(name: mahiName, address: mahiAddress, dateApplied: dateAppliedPicker.date, image: imagePicked.image ?? UIImage(named: "no_photo")!, pesticides: [pesticide(pesticideName: "Cyanide2")])
                
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
