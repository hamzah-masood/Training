//
//  nextViewController.swift
//  firstTest
//
//  Created by MCS on 8/16/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class nextViewController: UIViewController {
  
  @IBOutlet weak var seasonLabel: UILabel!
  
  @IBOutlet weak var episodeNumberLabel: UILabel!
  @IBOutlet weak var episodeNameLabel: UILabel!
  @IBOutlet weak var premierDateLabel: UILabel!
  @IBOutlet weak var airTimeLabel: UILabel!
  @IBOutlet weak var summaryLabel: UILabel!
  
  
  @IBAction func `return`(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
  
  var updatedSeason: Int?
  var updatedEpisodeNumber: Int?
  var updatedEpisodeName: String?
  var updatedPremierDate: String?
  var updatedAirTime: String?
  var updatedSummary: String?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    var updatedString = updatedSummary?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    
    seasonLabel.text = "Season: \(updatedSeason ?? 0)"
    episodeNumberLabel.text = "Episode Number: \(updatedEpisodeNumber ?? 0)"
    episodeNameLabel.text = "Episode Name: \(updatedEpisodeName ?? "")"
    premierDateLabel.text = "Premier Date: \(updatedPremierDate ?? "")"
    airTimeLabel.text = "Air Time: \(updatedAirTime ?? "")"
    summaryLabel.text = "Summary: \(updatedString ?? "")"
    
    
    
  }
  
  
  
}
