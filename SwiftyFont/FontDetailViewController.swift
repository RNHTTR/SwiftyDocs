//
//  FontDetailViewController.swift
//  SwiftyFont
//
//  Created by Ryan Hatter on 6/4/17.
//  Copyright © 2017 Ryan Hatter. All rights reserved.
//  :)

import UIKit

class FontDetailViewController: UIViewController, SideBarDelegate {

    @IBOutlet weak var titleContainerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textContainerView: UIView!
    @IBOutlet weak var textView: UITextView!
    
    var sideBar: SideBar = SideBar()
    var numberOfButtons: Int = 8
    var titleString: String!
    var colorPalette: ColorPalette.ColorPaletteType!
    let colorOptions: [String] = ["Bold", "Bright", "Light", "Gray Scale"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideBar = SideBar(sourceView: view, menuItems: colorOptions)
        sideBar.delegate = self
        
        self.title = "Select Background Color"
        
        let palettePickerButton = UIBarButtonItem(title: "🎨", style: .plain, target: self, action: #selector(selectPalette))
        let palettePickerAttributes = [NSFontAttributeName: UIFont(name: "AppleColorEmoji", size: 25) as Any]
        
        palettePickerButton.setTitleTextAttributes(palettePickerAttributes, for: .normal)
        self.navigationItem.setRightBarButton(palettePickerButton, animated: true)
        
        titleLabel.text = titleString
        titleLabel.font = UIFont(name: titleString, size: 30)
        
        titleContainerView.layer.cornerRadius = 4
        textContainerView.layer.cornerRadius  = 4
        
        textView.backgroundColor = .clear
        textView.text = "Wikipedia says: Lorem ipsum is a filler text commonly used to demonstrate the graphic elements of a document or visual presentation. Replacing meaningful content with placeholder text allows designers to design the form of the content before the content itself has been produced.\n\nThe lorem ipsum text is typically a scrambled section of De finibus bonorum et malorum, a 1st-century BC Latin text by Cicero, with words altered, added, and removed to make it nonsensical, improper Latin.\n\nA variation of the ordinary lorem ipsum text has been used in typesetting since the 1960s or earlier, when it was popularized by advertisements for Letraset transfer sheets. It was introduced to the Information Age in the mid-1980s by Aldus Corporation, which employed it in graphics and word-processing templates for its desktop publishing program PageMaker.\n\nLorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        
        textView.font = UIFont(name: titleString, size: 17)
        
        setNew(palette: .bold)
        setUpColorViews()
        
    }

}

//MARK: - Creating buttons from UIViews to select color scheme
extension FontDetailViewController {
    func selectPalette() {
        
        if sideBar.isSideBarOpen {
                sideBar.showSideBar(shouldOpen: false)
                sideBar.delegate?.sideBarWillClose?()
        } else {
                sideBar.showSideBar(shouldOpen: true)
                sideBar.delegate?.sideBarWillOpen?()
        }
    }
    
    func setUpColorViews() {
        for index in 1...numberOfButtons {
            
            let colorButtonView = view.viewWithTag(index)
            
            colorButtonView?.layer.cornerRadius = (colorButtonView?.frame.size.width)!/2
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            colorButtonView?.addGestureRecognizer(tap)
            colorButtonView?.isUserInteractionEnabled = true
            
        }
    }
    
    func handleTap(_ sender: UITapGestureRecognizer) {
        
        for index in 1...numberOfButtons {
            let colorButtonView = view.viewWithTag(index)
            colorButtonView?.layer.borderWidth = 0
        }
        
        if let colorButtonView = sender.view {
            colorButtonView.layer.borderColor = UIColor.lightGray.cgColor
            colorButtonView.layer.borderWidth = 3
            
            if colorButtonView.backgroundColor == .white {
                titleContainerView.backgroundColor = .darkText
            } else {
                titleContainerView.backgroundColor = .white
            }
            
            textContainerView.backgroundColor = colorButtonView.backgroundColor
            titleLabel.textColor              = colorButtonView.backgroundColor
            
            if colorButtonView.backgroundColor!.isLight {
                textView.textColor = .black
            } else {
                textView.textColor = .white
            }
        }
    }
}

//MARK: - Update Color Palette
extension FontDetailViewController {
    
    func setNew(palette: ColorPalette.ColorPaletteType) {

        let blackButton = view.viewWithTag(1)
        let button2     = view.viewWithTag(2)
        let button3     = view.viewWithTag(3)
        let button4     = view.viewWithTag(4)
        let button5     = view.viewWithTag(5)
        let button6     = view.viewWithTag(6)
        let button7     = view.viewWithTag(7)
        let whiteButton = view.viewWithTag(8)
        
        switch palette {
        case .bold:
            blackButton?.backgroundColor     = ColorPalette.Bold.black
            button2?.backgroundColor         = ColorPalette.Bold.color2
            button3?.backgroundColor         = ColorPalette.Bold.color3
            button4?.backgroundColor         = ColorPalette.Bold.color4
            button5?.backgroundColor         = ColorPalette.Bold.color5
            button6?.backgroundColor         = ColorPalette.Bold.color6
            button7?.backgroundColor         = ColorPalette.Bold.color7
            whiteButton?.backgroundColor     = ColorPalette.Bold.white
        case .bright:
            blackButton?.backgroundColor     = ColorPalette.Bright.black
            button2?.backgroundColor         = ColorPalette.Bright.color2
            button3?.backgroundColor         = ColorPalette.Bright.color3
            button4?.backgroundColor         = ColorPalette.Bright.color4
            button5?.backgroundColor         = ColorPalette.Bright.color5
            button6?.backgroundColor         = ColorPalette.Bright.color6
            button7?.backgroundColor         = ColorPalette.Bright.color7
            whiteButton?.backgroundColor     = ColorPalette.Bright.white
        case .light:
            blackButton?.backgroundColor     = ColorPalette.Light.black
            button2?.backgroundColor         = ColorPalette.Light.color2
            button3?.backgroundColor         = ColorPalette.Light.color3
            button4?.backgroundColor         = ColorPalette.Light.color4
            button5?.backgroundColor         = ColorPalette.Light.color5
            button6?.backgroundColor         = ColorPalette.Light.color6
            button7?.backgroundColor         = ColorPalette.Light.color7
            whiteButton?.backgroundColor     = ColorPalette.Light.white
        case .grayScale:
            blackButton?.backgroundColor     = ColorPalette.GrayScale.black
            button2?.backgroundColor         = ColorPalette.GrayScale.color2
            button3?.backgroundColor         = ColorPalette.GrayScale.color3
            button4?.backgroundColor         = ColorPalette.GrayScale.color4
            button5?.backgroundColor         = ColorPalette.GrayScale.color5
            button6?.backgroundColor         = ColorPalette.GrayScale.color6
            button7?.backgroundColor         = ColorPalette.GrayScale.color7
            whiteButton?.backgroundColor     = ColorPalette.GrayScale.white
        }
        
    }
    
}

//MARK: - Handle menu
extension FontDetailViewController {
    func sideBarDidSelectButtonAtIndex(index: Int) {
        print("index: \(index)")
        switch index {
        case 0:
            setNew(palette: .bold)
        case 1:
            setNew(palette: .bright)
        case 2:
            setNew(palette: .light)
        case 3:
            setNew(palette: .grayScale)
        default:
            break
        }
    }
}
