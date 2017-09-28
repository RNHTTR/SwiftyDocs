//
//  ARTextWebViewController.swift
//  SwiftyFont
//
//  Created by Ryan Hatter on 9/21/17.
//  Copyright © 2017 Wift, LLC. All rights reserved.
//

import UIKit
import WebKit

class ARTextWebViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "https://gist.github.com/RNHTTR/2061df49d3a7f856e5c047cd096c468d")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
    }
    
}

