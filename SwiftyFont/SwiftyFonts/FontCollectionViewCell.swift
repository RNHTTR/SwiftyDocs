//
//  FontCollectionViewself.swift
//  SwiftyFont
//
//  Created by Ryan Hatter on 6/4/17.
//  Copyright © 2017 Ryan Hatter. All rights reserved.
//  :)

import UIKit

class FontCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var fontLabel: UILabel!
    
    override func awakeFromNib() {
        
        self.contentView.layer.cornerRadius = 5.0
        self.contentView.layer.borderWidth = 0.1
        self.contentView.layer.borderColor = UIColor.white.cgColor
        self.contentView.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false

    }
    
}
