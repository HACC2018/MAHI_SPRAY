//
//  farmsDataStruct.swift
//  MAHI_SPRAY_APP
//
//  Created by Jaron Schreiber on 11/5/18.
//  Copyright © 2018 HACC. All rights reserved.
//

import Foundation
import UIKit

class Mahi {
    // Properties
    var name: String
    var dateApplied: Date
    var address: String
    var image: UIImage
    
    init(name: String, address: String, dateApplied: Date, image: UIImage) {
        // Initialize stored properties
        self.name = name
        self.address = address
        self.dateApplied = dateApplied
        self.image = image
    }
    
}
