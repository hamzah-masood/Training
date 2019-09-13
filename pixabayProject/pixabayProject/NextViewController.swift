//
//  NextViewController.swift
//  pixabayProject
//
//  Created by MCS on 9/9/19.
//  Copyright © 2019 MCS. All rights reserved.
//
import UIKit
import Foundation

class NextViewController: UIViewController {

  @IBOutlet weak var detailImage: UIImageView!
  @IBOutlet weak var userLabel: UILabel!
  @IBOutlet weak var likesLabel: UILabel!
  @IBOutlet weak var commentsLabel: UILabel!
  @IBOutlet weak var viewsLabel: UILabel!
  
  var updatedUser: String?
  var updatedLikes: Int?
  var updatedComments: Int?
  var updatedViews: Int?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    //detailImage = "Question: \(updatedQuestion ?? "")"
    userLabel.text = "User: \(updatedUser ?? "")"
    likesLabel.text = "Likes: \(updatedLikes ?? 0)"
    commentsLabel.text = "Comments: \(updatedComments ?? 0)"
    viewsLabel.text = "Views: \(updatedViews ?? 0)"
    
    
    
  }
  
}

