//
//  nextViewController.swift
//  firstProject
//
//  Created by MCS on 8/9/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit


protocol NextViewControllerDelegate {
    func updateElements(with value: Elements)
}


class nextViewController: UIViewController {
    
    @IBAction func switchOn(_ sender: UISwitch) {
        elementsStates.switchValue = sender.isOn
    }

    @IBOutlet unowned var label: UILabel!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myStepper: UIStepper!
    @IBOutlet weak var myControl: UISegmentedControl!
    @IBOutlet weak var mySwitch: UISwitch!

    var updatedLabel: String?

    
    var switchView: Bool = true
    var sliderView: Bool = true
    var TextFieldView: Bool = true
    var StepperView: Bool = true
    var ControlView: Bool = true

    
    var elementsStates = Elements()
    var delegate: NextViewControllerDelegate?
    
    
    @IBAction func submit(_ sender: Any) {
     
        elementsStates.switchValue = mySwitch.isOn
        elementsStates.sliderValue = mySlider.value
        elementsStates.myTextFieldValue = myTextField.text ?? ""
        elementsStates.stepperValue = myStepper.value
        elementsStates.controlValue = myControl.selectedSegmentIndex
        
         delegate?.updateElements(with: elementsStates)
        
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //delegate?.self = self 
        mySwitch.isHidden = true
        mySlider.isHidden = true
        myTextField.isHidden = true
        myStepper.isHidden = true
        myControl.isHidden = true
        
      
        mySwitch.isHidden = switchView
        mySlider.isHidden = sliderView
        myTextField.isHidden = TextFieldView
        myStepper.isHidden = StepperView
        myControl.isHidden = ControlView
    
        label.text = updatedLabel
        // Do any additional setup after loading the view.
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        mySwitch.isOn = elementsStates.switchValue
        mySlider.value = elementsStates.sliderValue
        myTextField.text = elementsStates.myTextFieldValue
        myStepper.value = elementsStates.stepperValue
        myControl.selectedSegmentIndex = elementsStates.controlValue
        
    }

}

