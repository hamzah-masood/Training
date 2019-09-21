//
//  ViewController.swift
//  firstProject
//
<<<<<<< HEAD
//  Created by mcs on 9/20/19.
//  Copyright © 2019 mcs. All rights reserved.
=======
//  Created by MCS on 8/9/19.
//  Copyright © 2019 MCS. All rights reserved.
>>>>>>> e04a1522a1809d5ee6611df04304365daf2b0396
//

import UIKit

<<<<<<< HEAD
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

=======


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    

    var arrayUIViews = ["UISwitch", "UISlider", "UITextfield", "UIStepper", "UISegmentedControl"]
    
    var elementsStates = Elements()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
    }
}


extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayUIViews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = arrayUIViews[indexPath.row]
        if indexPath.row == 0 {
            cell.textLabel?.text = String(elementsStates.switchValue) + " " + arrayUIViews[indexPath.row]
            
        }
        else if indexPath.row == 1 {
            cell.textLabel?.text = String(elementsStates.sliderValue) + " " + arrayUIViews[indexPath.row]
            
        }
        else if indexPath.row == 2 {
            cell.textLabel?.text = elementsStates.myTextFieldValue + " " + arrayUIViews[indexPath.row]
            
        }
        else if indexPath.row == 3 {
            cell.textLabel?.text = String(elementsStates.stepperValue) + " " + arrayUIViews[indexPath.row]
            
        }
        else if indexPath.row == 4 {
            cell.textLabel?.text = String(elementsStates.controlValue) + " " + arrayUIViews[indexPath.row]
            
        }
        return cell
    }
    
}



extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //main storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //assigning next screen
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "nextViewController") as! nextViewController
        
        let tappedRow = arrayUIViews[indexPath.row]
        nextViewController.updatedLabel = tappedRow
        nextViewController.delegate = self
        nextViewController.elementsStates = elementsStates
        
        if indexPath.row == 0
        {
            nextViewController.switchView = false
            nextViewController.updatedLabel =  String(self.elementsStates.switchValue)  + " " +  tappedRow
           
        }
        else if indexPath.row == 1{
            nextViewController.sliderView = false
            //nextViewController.mySwitch.isHidden = false
            nextViewController.updatedLabel =  String(self.elementsStates.sliderValue)  + " " +  tappedRow
        }
        else if indexPath.row == 2{
            nextViewController.TextFieldView = false
            nextViewController.updatedLabel = self.elementsStates.myTextFieldValue  + " " + tappedRow
        }
        else if indexPath.row == 3{
            nextViewController.StepperView = false
            nextViewController.updatedLabel = String(self.elementsStates.stepperValue)  + " " +  tappedRow
        }
        else if indexPath.row == 4{
            nextViewController.ControlView = false
            nextViewController.updatedLabel = String(self.elementsStates.controlValue)  + " " +  tappedRow
        }
        
        
        
        //nextViewController.delegate = self
        if let index = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: index, animated: true)
        }
        
        navigationController?.pushViewController(nextViewController, animated: true)
        
    }
    
}

extension ViewController: NextViewControllerDelegate {
    func updateElements(with value: Elements) {
        self.elementsStates = value
        //guard let selectedRow = tableView.indexPathForSelectedRow?.row else {return}
        tableView.reloadData()
        
    
    }
}


>>>>>>> e04a1522a1809d5ee6611df04304365daf2b0396
