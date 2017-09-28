//
//  ARTableViewCell.swift
//  SwiftyFont
//
//  Created by Ryan Hatter on 9/14/17.
//  Copyright © 2017 Wift, LLC. All rights reserved.
//

import UIKit

class ARTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var detail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
