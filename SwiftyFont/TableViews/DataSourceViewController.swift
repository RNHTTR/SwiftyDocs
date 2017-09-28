//
//  DataSourceViewController.swift
//  SwiftyFont
//
//  Created by Ryan Hatter on 9/16/17.
//  Copyright © 2017 Wift, LLC. All rights reserved.
//

import UIKit

class DataSourceViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160
        
    }

}

// MARK: - Table View Delegate
extension DataSourceViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "toNumberOfRowsInSection", sender: nil)
        case 1:
            self.performSegue(withIdentifier: "toCellForRowAt", sender: nil)
        case 2:
            self.performSegue(withIdentifier: "toTitleForHeaderInSection", sender: nil)
        default:
            print("Out of index")
        }
        
    }

}

// MARK: - Table View Data Source
extension DataSourceViewController: UITableViewDataSource {
    
    var dataSource: [String: String] {
        return ["cellForRowAt: indexPath": "Update cell information based on the data source\nReturns a UITableViewCell.",
                "numberOfRowsInSection: Int": "Determine the number of rows needed for each section of the tableView\nReturns an Int",
                "titleForHeaderInSection: Int": "Set the title for a particular section of your tableView\nReturns a String"]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Configuring a Table View"
        default:
            print("out of index")
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataSourceTableViewCell") as! DataSourceTableViewCell
        
        var titles = Array(dataSource.keys)
        var details = Array(dataSource.values)
        
        cell.title.text = titles[indexPath.row]
        cell.title.textColor = ColorPalette.Bright.green
        cell.detail.text = details[indexPath.row]
        cell.detail.textColor = ColorPalette.Bright.green
        
        return cell
    }
}
