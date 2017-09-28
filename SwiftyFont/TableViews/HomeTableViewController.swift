//
//  HomeTableViewController.swift
//  SwiftyFont
//
//  Created by Ryan Hatter on 8/30/17.
//  Copyright © 2017 Wift, LLC. All rights reserved.
//

import UIKit

class HomeTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = ColorPalette.Bright.green
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
    }
}

// MARK: - Table View Delegate
extension HomeTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "toDelegate", sender: nil)
        case 1:
            self.performSegue(withIdentifier: "toDataSource", sender: nil)
        default:
            print("Out of index")
        }
        
    }
    
}

// MARK: - Table View Data Source
extension HomeTableViewController: UITableViewDataSource {

    var dataSource: [String: String] {
        return ["UITableViewDataSource": "Configure a table view",
                "UITableViewDelegate": "Configure rows, manage selections, and handle swipe actions"]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        
        var titles = Array(dataSource.keys)
        var details = Array(dataSource.values)
        
        cell.title.text = titles[indexPath.row]
        cell.title.textColor = ColorPalette.Bright.green
        cell.detail.text = details[indexPath.row]
        cell.detail.textColor = ColorPalette.Bright.green
        
        return cell
    }
}
