//
//  ARInteractionWebViewController.swift
//  SwiftyFont
//
//  Created by Ryan Hatter on 9/22/17.
//  Copyright © 2017 Wift, LLC. All rights reserved.
//

import UIKit
import WebKit

class ARInteractionWebViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "https://gist.github.com/RNHTTR/2bc350983a602bab46d5490e7be67ebc")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        // Do any additional setup after loading the view.
    }
    
}

