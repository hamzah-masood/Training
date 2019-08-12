//
//  NextViewController.swift
//  tableViews
//
//  Created by MCS on 8/8/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

protocol NextViewControllerDelegate {
    func updateString(with value: String)
}

class NextViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    
    var editString: String?
    var delegate: NextViewControllerDelegate?
    
    @IBAction func submit(_ sender: Any) {
        //update String through delegate
        delegate?.updateString(with: textField.text ?? "")
        
        navigationController?.popViewController(animated: true)
        //go back to very first screen
        //navigationController?.popToRootViewController(animated:  true )
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = editString
        

    }
    
    
    
    
}
