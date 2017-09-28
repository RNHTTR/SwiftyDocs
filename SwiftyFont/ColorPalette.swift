//
//  ColorPalette.swift
//  SwiftyFont
//
//  Created by Ryan Hatter on 6/4/17.
//  Copyright © 2017 Ryan Hatter. All rights reserved.
//  :)

import UIKit

class ColorPalette {
    
    enum ColorPaletteType: Int {
        case bold      = 0
        case bright    = 1
        case light     = 2
        case grayScale = 3
    }
    
    /*
     Color Source:
     http://materialuicolors.co/?ref=flatuicolors.com
    */
    
    struct GrayScale {
        static let black  = UIColor.black
        static let color2 = UIColor.black.withAlphaComponent(0.125 * 1)
        static let color3 = UIColor.black.withAlphaComponent(0.125 * 2)
        static let color4 = UIColor.black.withAlphaComponent(0.125 * 3)
        static let color5 = UIColor.black.withAlphaComponent(0.125 * 4)
        static let color6 = UIColor.black.withAlphaComponent(0.125 * 5)
        static let color7 = UIColor.black.withAlphaComponent(0.125 * 6)
        static let white  = UIColor.white
    }
    
    struct Bold {
        static let black  = UIColor.black
        static let indigo = UIColor(hex: 0x34495e) // Indigo
        static let purple = UIColor(hex: 0x6a1b9a) // Purple
        static let blue   = UIColor(hex: 0x0277bd) // Blue
        static let red    = UIColor(hex: 0xc62828) // Red
        static let green  = UIColor(hex: 0x2e7d32) // Green
        static let yellow = UIColor(hex: 0xff8f00) // Yellow  0xf9a825
        static let white  = UIColor.white
    }
    
    struct Bright {
        static let black  = UIColor.black
        static let indigo = UIColor(hex: 0x283593) // Indigo
        static let purple = UIColor(hex: 0x9b59b6) // Purple
        static let blue   = UIColor(hex: 0x3498db) // Blue
        static let red    = UIColor(hex: 0xe74c3c) // Red
        static let green  = UIColor(hex: 0x2ecc71) // Green
        static let yellow = UIColor(hex: 0xf1c40f) // Yellow
        static let white  = UIColor.white
    }
    
    struct Light {
        static let black  = UIColor.black
        static let indigo = UIColor(hex: 0x9fa8da) // Indigo
        static let purple = UIColor(hex: 0xce93d8) // Purple
        static let blue   = UIColor(hex: 0x81d4fa) // Blue
        static let red    = UIColor(hex: 0xef9a9a) // Red
        static let green  = UIColor(hex: 0xa5d6a7) // Green
        static let yellow = UIColor(hex: 0xfff59d) // Yellow
        static let white  = UIColor.white
    }
    
}

class Gradient: ColorPalette {
    
    let boldGradientLayer:      CAGradientLayer!
    let brightGradientLayer:    CAGradientLayer!
    let lightGradientLayer:     CAGradientLayer!
    let grayScaleGradientLayer: CAGradientLayer!
    
    override init() {
        self.boldGradientLayer = CAGradientLayer()
        self.boldGradientLayer.colors = [Bold.indigo, Bold.yellow]
        self.boldGradientLayer.locations = [0.0, 1.0]
        
        self.brightGradientLayer = CAGradientLayer()
        self.brightGradientLayer.colors = [Bright.indigo, Bright.yellow]
        self.brightGradientLayer.locations = [0.0, 1.0]
        
        self.lightGradientLayer = CAGradientLayer()
        self.lightGradientLayer.colors = [Light.indigo, Light.yellow]
        self.lightGradientLayer.locations = [0.0, 1.0]
        
        self.grayScaleGradientLayer = CAGradientLayer()
        self.grayScaleGradientLayer.colors = [GrayScale.color2, GrayScale.color7]
        self.grayScaleGradientLayer.locations = [0.0, 1.0]
    }
    
}

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hex: Int) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF
        )
    }
    
}

extension UIColor {
    var isLight: Bool {
        var white: CGFloat = 0
        getWhite(&white, alpha: nil)
        return white > 0.69
    }
}
