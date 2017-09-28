//
//  ARBasicWebkitViewController.swift
//  SwiftyFont
//
//  Created by Ryan Hatter on 9/20/17.
//  Copyright © 2017 Wift, LLC. All rights reserved.
//

import UIKit
import WebKit

class ARBasicWebkitViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let myURL = URL(string: "https://gist.github.com/RNHTTR/c4f823499e9fb4337b796593d26135d9")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        // Do any additional setup after loading the view.
    }

}
