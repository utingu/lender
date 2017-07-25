//
//  Listing.swift
//  Lender
//
//  Created by Alex Chen on 4/3/17.
//  Copyright © 2017 Alex Chen. All rights reserved.
//

import UIKit

class Listing: NSObject {
    var title: String
    var user: User
    var price: Int
    var imageURL: URL
    var dateAvailable: Date?
    var dateAvailableString: String {
        get{
            return Listing.formatDate(date: dateAvailable!)
        }
    }
    var info: String?
    
    var dictionary: NSDictionary
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        title = dictionary["title"] as! String
        user = dictionary["user"] as! User
        price = dictionary["price"] as! Int
        imageURL = dictionary["image_url"] as! URL
        dateAvailable = dictionary["date_available"] as? Date
        info = dictionary["info"] as? String
    }
    
    class func formatDate(date: Date) -> String {
        let calendar = Calendar.current
        let TSYear = calendar.component(.year, from: date)
        let TSMonth = calendar.component(.month, from: date)
        let TSDay = calendar.component(.day, from: date)
        let TSHour = calendar.component(.hour, from: date)
        let TSMinute = calendar.component(.minute, from: date)
        
        let date = Date()
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        
        if TSYear != year {
            return "\(TSMonth)/\(TSDay)/\(TSYear)"
        } else {
            if TSMonth != month {
                return "\(TSMonth)/\(TSDay)/\(TSYear)"
            } else {
                if TSDay != day {
                    if day - TSDay < 7 {
                        return "\(day - TSDay)d"
                    } else {
                        return "\(TSMonth)/\(TSDay)/\(TSYear)"
                    }
                } else {
                    if TSHour != hour {
                        return "\(hour - TSHour)h"
                    } else {
                        if minute - TSMinute == 0 {
                            return "Now"
                        }
                        return "\(minute - TSMinute)m"
                    }
                }
            }
        }
    }
}
