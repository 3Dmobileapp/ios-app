//
//  ViewController.swift
//  test3
//
//  Created by Alex Liu on 9/9/17.
//  Copyright © 2017 Alex Liu. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var feild: UITextField!
    @IBOutlet weak var web_display: WKWebView!
    @IBOutlet weak var progressbar: UIProgressView!
    
    @IBOutlet weak var indactor: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        web_display.uiDelegate = self
        web_display.navigationDelegate = self
        progressbar.progress=0.0
      
    web_display.configuration.preferences.javaScriptEnabled = true
      
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
      label.text="finished"
       progressbar.progress=Float(web_display.estimatedProgress)
       indactor.stopAnimating()
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        label.text="start"
        progressbar.progress=Float(web_display.estimatedProgress)
        indactor.startAnimating()
    }
  
    @IBOutlet weak var foward: UIButton!
    @IBOutlet weak var back: UIButton!
    
    @IBAction func foward(_ sender: UIButton) {
        
       
        web_display.goForward()
    }
    
    @IBAction func back(_ sender: UIButton) {
        web_display.goBack()
    }
    
    @IBAction func go(_ sender: UIButton) {
        
        let myURL = URL(string: feild.text!)
        let myRequest = URLRequest(url: myURL!)
        web_display.load(myRequest)
        
        
        
        
    }
}
