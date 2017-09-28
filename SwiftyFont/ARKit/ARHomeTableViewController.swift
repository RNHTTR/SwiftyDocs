//
//  ARHomeTableViewController.swift
//  SwiftyFont
//
//  Created by Ryan Hatter on 8/30/17.
//  Copyright © 2017 Wift, LLC. All rights reserved.
//

import UIKit

// MARK:- TODO : Set tableview delegate and datasource
class ARHomeTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = ColorPalette.Bright.purple
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
    }
}

// MARK: - Table View Delegate
extension ARHomeTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "toBasicAR", sender: nil)
        case 1:
            self.performSegue(withIdentifier: "toTextAR", sender: nil)
        case 2:
            self.performSegue(withIdentifier: "toMultipleAR", sender: nil)
        case 3:
            self.performSegue(withIdentifier: "toTouchAR", sender: nil)
        case 4:
            self.performSegue(withIdentifier: "toPlaneAR", sender: nil)
        default:
            print("Out of index")
        }
        
    }
    
}

// MARK: - Table View Data Source
extension ARHomeTableViewController: UITableViewDataSource {
    
    var dataSource: [Int: [String: String]] {
        return [0: ["Basic AR Object": "View a simple object in augmented reality"],
                1: ["Text in AR": "Place 3D text in augmented reality"],
                2: ["Multiple AR Objects": "Add a second augmented reality object"],
                3: ["Interact with an AR Object": "Add a touch gesture recognizer to an AR object"],
                4: ["Plane Detection": "Detect horizontal planes"]]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ARTableViewCell") as! ARTableViewCell
        
        var titles = Array(dataSource[indexPath.row]!.keys)
        var details = Array(dataSource[indexPath.row]!.values)
        
        cell.title.text = titles[0]
        cell.title.textColor = ColorPalette.Bright.purple
        cell.detail.text = details[0]
        cell.detail.textColor = ColorPalette.Bright.purple
        
        return cell
    }
}
