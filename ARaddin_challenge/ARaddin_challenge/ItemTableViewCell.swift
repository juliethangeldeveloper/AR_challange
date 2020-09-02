//
//  ItemTableViewCell.swift
//  ARaddin_challenge
//
//  Created by Julieth Angel on 9/1/20.
//  Copyright © 2020 ARaddin. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
