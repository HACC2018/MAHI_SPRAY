//
//  MahiLotDetailViewController.swift
//  MAHI_SPRAY_APP
//
//  Created by Jaron Schreiber on 11/6/18.
//  Copyright © 2018 HACC. All rights reserved.
//

import UIKit

protocol mahiDetailDelegate: class {
    var mahiLotNameVar: String { get set }
    var mahiLotAddVar: String { get set }
    var mahiBGImage: UIImage { get set }
}

class MahiLotDetailViewController: UIViewController, UINavigationControllerDelegate {
    
    weak var delegate: mahiDetailDelegate?
    weak var delegate2: addMahiDelegate?

    @IBOutlet var mahiLotName: UILabel!
    @IBOutlet var mahiAddressLabel: UILabel!
    @IBOutlet var cardView: UIView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var imageChoice: UIImageView!
    @IBOutlet var scrollView: UIScrollView!
    
    //Pesticide Images
    @IBOutlet var pestAImage: UIImageView!
    @IBOutlet var pestBImage: UIImageView!
    @IBOutlet var pestCImage: UIImageView!
    @IBOutlet var pestDImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pestAImage.layer.cornerRadius = 37.5
        pestBImage.layer.cornerRadius = 37.5
        pestCImage.layer.cornerRadius = 37.5
        pestDImage.layer.cornerRadius = 37.5
        
        cardView.layer.cornerRadius = 40.0
        
        imageChoice.image = delegate?.mahiBGImage
        mahiLotName.text = delegate?.mahiLotNameVar
        mahiAddressLabel.text = delegate?.mahiLotAddVar
        imageChoice.layer.cornerRadius = 20.0
        containerView.layer.shadowRadius = 5.0
        containerView.layer.shadowOpacity = 0.3

        imageChoice.layer.shadowRadius = 5.0
        imageChoice.layer.shadowOpacity = 0.3
        imageChoice.layer.shadowOffset = CGSize(width: 1, height: 5)
        
        scrollView.contentInset.top = navBarheight
        //scrollView.contentOffset.y = navBarheight
    }
    
    @IBAction func goBackButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        delegate2?.hideToolbar(isHidden: true)
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
