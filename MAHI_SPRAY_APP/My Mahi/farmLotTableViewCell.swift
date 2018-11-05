//
//  farmLotTableViewCell.swift
//  MAHI_SPRAY_APP
//
//  Created by Jaron Schreiber on 11/4/18.
//  Copyright © 2018 HACC. All rights reserved.
//

import UIKit

class farmLotTableViewCell: UITableViewCell {

    @IBOutlet weak var farmLotNameLabel: UILabel!
    @IBOutlet weak var farmLotAddressLabel: UILabel!
    @IBOutlet weak var farmCardView: UIView!
    @IBOutlet weak var outsideContentView: UIView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        outsideContentView.layer.shadowRadius = 4.0
        outsideContentView.layer.shadowOpacity = 0.5
        farmCardView.layer.cornerRadius = 10.0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
