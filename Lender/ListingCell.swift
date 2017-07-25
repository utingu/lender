//
//  ListingCell.swift
//  Lender
//
//  Created by Alex Chen on 4/3/17.
//  Copyright © 2017 Alex Chen. All rights reserved.
//

import UIKit
import AFNetworking

class ListingCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    var listing: Listing! {
        didSet {
            titleLabel.text = listing.title
            usernameLabel.text = listing.user.name
            priceLabel.text = "$\(listing.price)"
            itemImageView.setImageWith(listing.imageURL)
            dateLabel.text = listing.dateAvailableString
            infoLabel.text = listing.info ?? " "
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
