//
//  ViewController.swift
//  SwiftyFont
//
//  Created by Ryan Hatter on 6/4/17.
//  Copyright © 2017 Ryan Hatter. All rights reserved.
//  :)

import UIKit

class FontsCollectionViewController: UIViewController {
    
    fileprivate let itemsPerRow: CGFloat = 3
    fileprivate let sectionInsets = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 8.0, right: 8)
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let reuseIdentifier = "FontCell"
    var fontFamilies: [String]!
    var selectedRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = .white
        
        self.edgesForExtendedLayout = UIRectEdge.bottom
        
        fontFamilies = getSwiftFonts()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = ColorPalette.Bright.blue
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFontDetail" {
            let vc = segue.destination as! FontDetailViewController
            
            if let row = selectedRow {
                vc.titleString = fontFamilies[row]
            }
        }
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        navigationItem.backBarButtonItem = backItem
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        self.performSegue(withIdentifier: "toFontDetail", sender: nil)
    }
    
    func getSwiftFonts() -> [String] {
        let fontFamilyNames = UIFont.familyNames
        var fontFamilyArray: [String] = []
        
        for familyName in fontFamilyNames {
            fontFamilyArray.append(familyName)
        }
        
        fontFamilyArray.sort()
        
        return fontFamilyArray
    }
}

//Mark: - DataSource
extension FontsCollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return fontFamilies.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! FontCollectionViewCell
        cell.fontLabel.text = fontFamilies[indexPath.row]
        cell.fontLabel.font = UIFont(name: fontFamilies[indexPath.row], size: 15)
        
        return cell
    }
}

//Mark: - DelegateFlowLayout
extension FontsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem - 2, height: widthPerItem - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left + 10
    }
}




