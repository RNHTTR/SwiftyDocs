//
//  SideBarTableViewController.swift
//  SwiftyFont
//
//  Created by Ryan Hatter on 6/10/17.
//  Copyright © 2017 Ryan Hatter. All rights reserved.
//  :)

import UIKit


protocol SidebarTableViewControllerDelegate {
    func sideBarControlDidSelectRow(indexPath: IndexPath)
}

class SideBarTableViewController: UITableViewController {
    
    var delegate: SidebarTableViewControllerDelegate?
    var dataSource: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        let paletteType = ColorPalette.ColorPaletteType.self
        let bold        = ColorPalette.Bold.self
        let bright      = ColorPalette.Bright.self
        let light       = ColorPalette.Light.self
        let grayScale   = ColorPalette.GrayScale.self

        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
            
            switch indexPath.row {
            case paletteType.bold.rawValue:
                cell?.backgroundColor = bold.color7
                cell!.textLabel?.textColor = .white
            case paletteType.bright.rawValue:
                cell?.backgroundColor = bright.color7
                cell!.textLabel?.textColor = .darkText
            case paletteType.light.rawValue:
                cell?.backgroundColor = light.color7
                cell!.textLabel?.textColor = .darkText
            case paletteType.grayScale.rawValue:
                cell?.backgroundColor = grayScale.color7
                cell!.textLabel?.textColor = .white
            default: break
            }
            
            let selectedView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: cell!.frame.size.width, height: cell!.frame.size.height))
            
            selectedView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            
            cell!.selectedBackgroundView = selectedView
        }
        
        cell!.textLabel?.text = dataSource[indexPath.row]
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.sideBarControlDidSelectRow(indexPath: indexPath)
    }
 

}
