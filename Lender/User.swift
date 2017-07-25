
//
//  User.swift
//  Lender
//
//  Created by Alex Chen on 4/3/17.
//  Copyright © 2017 Alex Chen. All rights reserved.
//

import UIKit

class User: NSObject {
    var name: String
    var imageURL: URL?
    var rating: Decimal?
    var listings: [Listing]?
    var requests: [Request]?
    
    var dictionary: NSDictionary
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        name = dictionary["name"] as! String
        imageURL = dictionary["image_url"] as? URL
        rating = dictionary["rating"] as? Decimal
        listings = dictionary["listings"] as? [Listing]
        requests = dictionary["requests"] as? [Request]
    }
}
