//
//  AddMahiPopUpController.swift
//  MAHI_SPRAY_APP
//
//  Created by Jaron Schreiber on 11/4/18.
//  Copyright © 2018 HACC. All rights reserved.
//

import UIKit

var navBarheight : CGFloat = 0


class AddMahiPopUpController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var dateAppliedPicker: UIDatePicker!
    @IBOutlet weak var mahiNameTextField: UITextField!
    @IBOutlet weak var mahiAddressTextField: UITextField!
    @IBOutlet var outsideView: UIStackView!
    @IBOutlet weak var addMahiCard: UIView!
    @IBOutlet var pesticidePicker: UIPickerView!
    
    //ImageView
    @IBOutlet var imagePickerContainerView: UIView!
    @IBOutlet weak var imagePicked: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    weak var delegate: addMahiDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pesticidePicker.delegate = self
        pesticidePicker.dataSource = self
        
        imagePicked.image = UIImage(named: "no_photo")
        imagePicked.contentMode = .scaleAspectFill
        imagePicked.layer.cornerRadius = 20.0
        imagePickerContainerView.layer.shadowRadius = 5
        imagePickerContainerView.layer.shadowOpacity = 0.2
        imagePickerContainerView.layer.shadowOffset = CGSize(width: 1, height: 5)
        
        mahiNameTextField.layer.shadowRadius = 5
        mahiNameTextField.layer.shadowOpacity = 0.2
        mahiNameTextField.layer.shadowOffset = CGSize(width: 1, height: 5)
        
        mahiAddressTextField.layer.shadowRadius = 5
        mahiAddressTextField.layer.shadowOpacity = 0.2
        mahiAddressTextField.layer.shadowOffset = CGSize(width: 1, height: 5)
        
        //Insetting scrollview content
        scrollView.contentInset.top = navBarheight
        
        //Card with Container View for Shadow Effect
        outsideView.layer.shadowRadius = 5.0
        outsideView.layer.shadowOpacity = 0.3
        addMahiCard.layer.cornerRadius = 40.0
        
        mahiNameTextField.delegate = self
        mahiAddressTextField.delegate = self
    }
    
    //Pesticide List
    let pesticideList : [String] = ["None", "Cyanide", "Bolstrum", "Helium"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pesticideList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pesticideList[row]
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
        delegate?.hideToolbar(isHidden: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func done(_ sender: UIButton) {
        if mahiNameTextField.text == "" {
            mahiNameTextField.text = "No Name"
        }
        
        if mahiAddressTextField.text == "" {
            mahiAddressTextField.text = "No Address"
        }
        
        let newFarm : Mahi = Mahi(name: mahiNameTextField.text ?? "No Name" , address: mahiAddressTextField.text ?? "No Address", dateApplied: dateAppliedPicker.date, image: imagePicked.image ?? UIImage(named: "no_photo")!, pesticides: [pesticide(pesticideName: pesticideList[pesticidePicker.selectedRow(inComponent: 0)])])
        
        farms.append(newFarm)
        
        dismiss(animated: true, completion: nil)
        delegate?.hideToolbar(isHidden: true)
        
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
