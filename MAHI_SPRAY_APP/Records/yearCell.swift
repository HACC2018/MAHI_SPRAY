//
//  yearCell.swift
//  MAHI_SPRAY_APP
//
//  Created by Jaron Schreiber on 11/6/18.
//  Copyright © 2018 HACC. All rights reserved.
//

import UIKit

class yearCell: UITableViewCell {

    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var yearCard: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        yearCard.layer.cornerRadius = 22.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
