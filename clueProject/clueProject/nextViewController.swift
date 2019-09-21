//
//  nextViewController.swift
//  clueProject
//
//  Created by MCS on 8/15/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class nextViewController: UIViewController {
  
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var answerLabel: UILabel!
  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet weak var valueLabel: UILabel!
  @IBOutlet weak var airDateLabel: UILabel!
  @IBOutlet weak var creationDateLabel: UILabel!
  
  var updatedQuestion: String?
  var updatedAnswer: String?
  var updatedCategory: String?
  var updatedValue: Int?
  var updatedAirDate: String?
  var updatedCreationDate: String?
  
  @IBAction func submit(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    
    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "MM-dd-yyyy"
    
    guard let airDate = dateFormatterGet.date(from: updatedAirDate ?? "") else {return}
    let newAirDate = (dateFormatterPrint.string(from: airDate))
    
    guard let creationDate = dateFormatterGet.date(from: updatedCreationDate ?? "") else {return}
    let newCreationDate = (dateFormatterPrint.string(from: creationDate))
    
    // Do any additional setup after loading the view.
    questionLabel.text = "Question: \(updatedQuestion ?? "")"
    answerLabel.text = "Answer: \(updatedAnswer ?? "")"
    categoryLabel.text = "Category: \(updatedCategory ?? "")"
    valueLabel.text = "Value: \(updatedValue ?? 0)"
    airDateLabel.text = "Air Date: \(newAirDate)"
    creationDateLabel.text = "Creation Date: \(newCreationDate)"
    
    
  }
}


