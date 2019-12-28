//
//  DetailViewController.swift
//  BookSearch
//
//  Created by mcs on 12/18/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var publishYearLabel: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    
    var bookTitle: String?
    var authorName: [String]?
    var publishYear: Int?
    var publishDate: [String]?
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    let joined = authorName?.joined(separator: ", ")
    let secondJoined = publishDate?.joined(separator: ", ")
    
    titleLabel.text = "Title: \(bookTitle ?? "")"
    authorNameLabel.text = "Author Name: \(joined ?? "" )"
    publishYearLabel.text = "Publish Year: \(publishYear ?? 0)"
    publishYearLabel.numberOfLines = 0
    publishDateLabel.text = "Publish Date: \(secondJoined ?? "")"
    
    
  }


}

