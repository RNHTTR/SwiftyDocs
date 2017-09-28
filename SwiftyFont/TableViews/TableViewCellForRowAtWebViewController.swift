//
//  TableViewCellForRowAtWebViewController.swift
//  SwiftyFont
//
//  Created by Ryan Hatter on 9/24/17.
//  Copyright © 2017 Wift, LLC. All rights reserved.
//

import UIKit
import WebKit

class TableViewCellForRowAtWebViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "https://gist.github.com/RNHTTR/ac6731c6dbfd1794b79ba5597c90d964")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        // Do any additional setup after loading the view.
    }
    
}

