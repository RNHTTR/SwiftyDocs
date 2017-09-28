//
//  TableViewNumberOfRowsInSectionWebViewController.swift
//  SwiftyFont
//
//  Created by Ryan Hatter on 9/24/17.
//  Copyright © 2017 Wift, LLC. All rights reserved.
//

import UIKit
import WebKit

class TableViewNumberOfRowsInSectionWebViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "https://gist.github.com/RNHTTR/e702d9a07ba2b02f6ca669a295ac8c30")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        // Do any additional setup after loading the view.
    }
    
}


