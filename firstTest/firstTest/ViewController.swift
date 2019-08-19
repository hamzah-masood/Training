//
//  ViewController.swift
//  firstTest
//
//  Created by MCS on 8/16/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var episodes: UITableView!
  
  var gameOfThronesArray: [Episode] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    episodes.dataSource = self
    episodes.delegate = self
    episodes.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
    URLSession.shared.dataTask(with: URL(string: "https://api.tvmaze.com/shows/82?embed=seasons&embed=episodes")!) { (data, response, _) in
      guard let data = data else { return }
      let gameOfThrones = try? JSONDecoder().decode(GameOfThrones.self, from: data)
      self.gameOfThronesArray = (gameOfThrones?.embedded.episodes)!
      
      DispatchQueue.main.async {
        self.episodes.reloadData()
      }
      }.resume()
    
  }
}

// struct GameOfThrones: Codable{
//   let embedded: Embedded
  
//   enum CodingKeys: String, CodingKey{
//     case embedded = "_embedded"
//   }
// }

// struct Embedded: Codable{
//   let episodes: [Episode]
// }

// struct Episode: Codable{
//   let season: Int
//   let episodeNumber: Int
//   let episodeName: String
//   let premierDate: String
//   let airTime: String
//   let summary: String
  
//   enum CodingKeys: String, CodingKey {
//     case season
//     case episodeNumber = "number"
//     case episodeName = "name"
//     case premierDate = "airdate"
//     case airTime = "airtime"
//     case summary
//   }
// }



struct Episodes: Codable {

 let season:Int?

 let episodeNumber: Int?

 let episodeName: String?

 let premierDate: String?

 let airTime: String?

 let summary: String?



 enum CodingKeys: String, CodingKey {

   case season

   case episodeNumber = "number"

   case episodeName = "name"

   case premierDate = "airdate"

   case airTime = "airtime"

   case summary

 }





 init(from decoder: Decoder) throws {

   let container = try decoder.container(keyedBy: CodingKeys.self)

   season = try container.decode(Int.self, forKey: .season)

   episodeNumber = try container.decode(Int.self, forKey: .episodeNumber)

   episodeName = try container.decode(String.self, forKey: .episodeName)

   premierDate = try container.decode(String.self, forKey: .premierDate)

   airTime = try container.decode(String.self, forKey: .airTime)

   summary = try container.decode(String.self, forKey: .summary)



 }

}



struct GameofThrones: Codable {



 let embedded:String

 let episodes: [Episodes]





 enum CodingKeys: String, CodingKey {

   case embedded =  "_embedded"



 }



 enum embeddedCodingKeys: String, CodingKey{

   case episodes

 }





 init(from decoder: Decoder) throws {

   let container = try decoder.container(keyedBy: CodingKeys.self)

   let episodeContainer = try container.nestedContainer(keyedBy: embeddedCodingKeys.self, forKey: .embedded)

   episodes = try episodeContainer.decode([Episodes].self, forKey: .episodes)





 }

}



extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return gameOfThronesArray.count //count of episodes
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    cell.textLabel?.numberOfLines = 0
    cell.textLabel?.text = "Season: " + "\(gameOfThronesArray[indexPath.row].season)" + " / Episode Number: " + "\(gameOfThronesArray[indexPath.row].episodeNumber)" + " /Episode Name: " + gameOfThronesArray[indexPath.row].episodeName
    
    return cell
  }
  
}

extension ViewController: UITableViewDelegate{
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //main storyboard
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //assigning next screen
    let nextViewController = storyboard.instantiateViewController(withIdentifier: "nextViewController") as! nextViewController
    
    
    nextViewController.updatedSeason = gameOfThronesArray[indexPath.row].season
    nextViewController.updatedEpisodeNumber = gameOfThronesArray[indexPath.row].episodeNumber
    nextViewController.updatedEpisodeName = gameOfThronesArray[indexPath.row].episodeName
    nextViewController.updatedPremierDate = gameOfThronesArray[indexPath.row].premierDate
    nextViewController.updatedAirTime = gameOfThronesArray[indexPath.row].airTime
    nextViewController.updatedSummary = gameOfThronesArray[indexPath.row].summary
    
    
    if let index = self.episodes.indexPathForSelectedRow {
      self.episodes.deselectRow(at: index, animated: true)
    }
    
    navigationController?.pushViewController(nextViewController, animated: true)
    
  }
}


