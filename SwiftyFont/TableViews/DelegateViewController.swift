//
//  DelegateViewController.swift
//  SwiftyFont
//
//  Created by Ryan Hatter on 9/16/17.
//  Copyright © 2017 Wift, LLC. All rights reserved.
//

import UIKit

class DelegateViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 110
        
    }
    
}

// MARK: - Table View Delegate
extension DelegateViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            self.performSegue(withIdentifier: "toHeightForRowAt", sender: nil)
        case 1:
            
            let alert = UIAlertController(title: "Alert", message: "This alert is fired when you select the didSelectRowAt cell.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Continue to GitHub to see how this is done.", style: .default, handler: { _ in
                self.performSegue(withIdentifier: "toDidSelectRowAt", sender: nil)
            }))
            self.present(alert, animated: true, completion: nil)
            
        case 2:
            self.performSegue(withIdentifier: "toEditActionsForRowAt", sender: nil)            
        default:
            print("Out of index")
        }
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let sectionHeaderView = tableView.headerView(forSection: indexPath.section)
        let sectionTitle = sectionHeaderView?.textLabel?.text
        
        let firstBox = UITableViewRowAction(style: .normal, title: "First") { action, index in
            
            let alert = UIAlertController(title: "Alert", message: "You tapped the \"First\" box from the \(sectionTitle!) section.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        firstBox.backgroundColor = ColorPalette.Bold.green
        
        let secondBox = UITableViewRowAction(style: .normal, title: "Second") { action, index in
            
            let alert = UIAlertController(title: "Alert", message: "You tapped the \"Second\" box from the \(sectionTitle!) section.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        secondBox.backgroundColor = ColorPalette.Bright.green
        
        return [secondBox, firstBox]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}

// MARK: - Table View Data Source
extension DelegateViewController: UITableViewDataSource {
    
    var dataSource: [[String: String]] {
        return [["heightForRowAt: indexPath": "Determine the height of a given cell\nReturns a CGFloat"],
                ["didSelectRowAt: indexPath": "Handle what happens when a user taps a particular cell"],
                ["editActionsForRowAt: indexPath": "Handle swipe actions\nReturns an array of UITableViewRowAction"]]
    }
    
    var sections: [String] {
        return ["Configuring Rows", "Managing Selections", "Handling Swipe Actions"]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Configuring Rows"
        case 1:
            return "Managing Selections"
        case 2:
            return "Handling Swipe Actions"
        default:
            print("out of index")
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dataSource[0].count
        case 1:
            return dataSource[1].count
        case 2:
            return dataSource[2].count
        default:
            print("out of index")
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DelegateTableViewCell") as! DelegateTableViewCell
        
        var titles = Array(dataSource[indexPath.section].keys)
        var details = Array(dataSource[indexPath.section].values)
        
        print("index path row: \(indexPath.row)")
        
        print("titles: \(titles)")
        print("details: \(details)")
        
        cell.title.text = titles[indexPath.row]
        cell.title.textColor = ColorPalette.Bright.green
        cell.detail.text = details[indexPath.row]
        cell.detail.textColor = ColorPalette.Bright.green
        
        return cell
    }
}

