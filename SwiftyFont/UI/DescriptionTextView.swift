//
//  DescriptionTextView.swift
//  SwiftyFont
//
//  Created by Ryan Hatter on 9/20/17.
//  Copyright © 2017 Wift, LLC. All rights reserved.
//

import UIKit

class DescriptionTextView: UITextView {
    
    override func awakeFromNib() {
        self.font = UIFont(name: "Courier New", size: 14)
        self.textColor = .darkGray
        self.textAlignment = .justified
//        self.frame = CGRect(x: 8, y: 8, width: (self.superview?.bounds.width)! - 16, height: (self.superview?.bounds.height)! - 8)
    }
    
}
