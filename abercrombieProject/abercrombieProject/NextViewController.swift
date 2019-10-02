//
//  NextViewController.swift
//  abercrombieProject
//
//  Created by mcs on 9/30/19.
//  Copyright © 2019 mcs. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class NextViewController: UIViewController {

    
    @IBOutlet weak var contentPage: WKWebView!
    var url: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        //contentPage.navigationDelegate? = self

//        //let request = URLRequest(url: URL(string: url) ?? "")
//        let request = URLRequest(url: URL(string: url)!)
//        contentPage.loadRequest(request)
//
        let request = URLRequest(url: URL(string: url)!)
        contentPage.load(request)
        
    }
}

