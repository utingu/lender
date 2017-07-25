//
//  RequestCell.swift
//  Lender
//
//  Created by Alex Chen on 4/3/17.
//  Copyright © 2017 Alex Chen. All rights reserved.
//

import UIKit
import AFNetworking

class RequestCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    var request: Request! {
        didSet{
            titleLabel.text = request.title
            usernameLabel.text = request.user.name
            priceLabel.text = "$\(request.price)"
            dateLabel.text = request.dateNeededString
            infoLabel.text = request.info ?? " "
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
