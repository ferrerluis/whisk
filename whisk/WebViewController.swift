//
//  WebViewController.swift
//  whisk
//
//  Created by Luis Ferrer Labarca on 10/17/15.
//  Copyright © 2015 Whisk. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let recipeURL = NSURL(string: url!)!
        
        webView.loadRequest(NSURLRequest(URL: recipeURL))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
