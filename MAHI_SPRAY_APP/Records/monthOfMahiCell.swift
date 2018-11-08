//
//  monthOfMahiCell.swift
//  MAHI_SPRAY_APP
//
//  Created by Jaron Schreiber on 11/6/18.
//  Copyright © 2018 HACC. All rights reserved.
//

import UIKit

class monthOfMahiCell: UITableViewCell {

    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.cornerRadius = 22.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
