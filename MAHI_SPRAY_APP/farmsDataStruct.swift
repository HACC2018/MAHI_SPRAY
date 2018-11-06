//
//  farmsDataStruct.swift
//  MAHI_SPRAY_APP
//
//  Created by Jaron Schreiber on 11/5/18.
//  Copyright © 2018 HACC. All rights reserved.
//

import Foundation
import UIKit

struct pesticide {
    var pesticideName: String
    init(pesticideName: String) {
        self.pesticideName = pesticideName
    }
}

class Mahi {
    // Properties
    var name: String
    var dateApplied: Date
    var address: String
    var image: UIImage
    var pesticides : [pesticide]
    
    init(name: String, address: String, dateApplied: Date, image: UIImage, pesticides: [pesticide]) {
        // Initialize stored properties
        self.name = name
        self.address = address
        self.dateApplied = dateApplied
        self.image = image
        self.pesticides = pesticides
    }
    
}
