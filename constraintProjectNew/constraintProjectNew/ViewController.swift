//
//  ViewController.swift
//  constraintProjectNew
//
//  Created by MCS on 8/8/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addRedView()
        addBlueView()
    }
    
    func addRedView() {
        let redView = UIView()
        redView.backgroundColor = .red
        view.addSubview(redView)
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        redView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
        
        redView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        
        redView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        redView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        
    }
    
    func addBlueView(){
        let blueView = UIView()
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [NSLayoutConstraint(item: blueView,
                                              attribute: .height,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .height,
                                              multiplier: 1,
                                              constant: 0),
        
                          NSLayoutConstraint(item: blueView,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.5,
                                              constant: 0),
                          NSLayoutConstraint(item: blueView,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: view,
                                             attribute: .top,
                                             multiplier: 1,
                                             constant: 0),
                         NSLayoutConstraint(item: blueView,
                                            attribute: .trailing,
                                            relatedBy: .equal,
                                            toItem: view,
                                            attribute: .trailing,
                                            multiplier: 1,
                                            constant: 0),]
        NSLayoutConstraint.activate(constraints)
        
    }
    
    


}

