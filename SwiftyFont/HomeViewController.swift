//
//  HomeViewController.swift
//  SwiftyFont
//
//  Created by Ryan Hatter on 9/13/17.
//  Copyright © 2017 Wift, LLC. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var ARView: UIView!
    @IBOutlet weak var swiftyFontsView: UIView!
    @IBOutlet weak var tableViewView: UIView!
    @IBOutlet weak var collectionViewView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ARView.backgroundColor = ColorPalette.Bright.purple
        swiftyFontsView.backgroundColor = ColorPalette.Bright.blue
        tableViewView.backgroundColor = ColorPalette.Bright.green
        collectionViewView.backgroundColor = ColorPalette.Bright.yellow.withAlphaComponent(0.8)
        
        let ARGestureRecognizer = UITapGestureRecognizer(target: self, action:  #selector(handleARTap(_:)))
        ARView.addGestureRecognizer(ARGestureRecognizer)
        ARView.isUserInteractionEnabled = true
        
        let swiftyFontsGestureRecognizer = UITapGestureRecognizer(target: self, action:  #selector(handleSwiftyFontsTap(_:)))
        swiftyFontsView.addGestureRecognizer(swiftyFontsGestureRecognizer)
        swiftyFontsView.isUserInteractionEnabled = true
        
        let tableViewGestureRecognizer = UITapGestureRecognizer(target: self, action:  #selector(handleTableViewTap(_:)))
        tableViewView.addGestureRecognizer(tableViewGestureRecognizer)
        tableViewView.isUserInteractionEnabled = true
        
        let collectionViewGestureRecognizer = UITapGestureRecognizer(target: self, action:  #selector(handleCollectionViewTap(_:)))
        collectionViewView.addGestureRecognizer(collectionViewGestureRecognizer)
        collectionViewView.isUserInteractionEnabled = true

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
        navigationController?.navigationBar.tintColor = UIColor.black
    }

    @objc func handleARTap(_ sender: UITapGestureRecognizer) {
        print("ARTap")
        self.performSegue(withIdentifier: "toAR", sender: nil)
    }
    
    @objc func handleSwiftyFontsTap(_ sender: UITapGestureRecognizer) {
        print("Swifty Fonts")
        self.performSegue(withIdentifier: "toSwiftyFonts", sender: nil)
    }
    
    @objc func handleTableViewTap(_ sender: UITapGestureRecognizer) {
        print("Table View")
        self.performSegue(withIdentifier: "toTableViews", sender: nil)
    }
    
    @objc func handleCollectionViewTap(_ sender: UITapGestureRecognizer) {
        print("Collection View")
    }

}
