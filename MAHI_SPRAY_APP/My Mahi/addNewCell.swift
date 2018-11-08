//
//  addNewCell.swift
//  MAHI_SPRAY_APP
//
//  Created by Jaron Schreiber on 11/7/18.
//  Copyright © 2018 HACC. All rights reserved.
//

import UIKit

class addNewCell: UITableViewCell {

    @IBOutlet var shadowRad: UIView!
    @IBOutlet var cornerRad: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        cornerRad.layer.cornerRadius = 20.0
        shadowRad.layer.shadowRadius = 5
        shadowRad.layer.shadowOpacity = 0.2
        shadowRad.layer.shadowOffset = CGSize(width: 1, height: 5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
