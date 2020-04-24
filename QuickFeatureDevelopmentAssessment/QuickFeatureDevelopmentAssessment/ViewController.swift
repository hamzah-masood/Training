//
//  ViewController.swift
//  QuickFeatureDevelopmentAssessment
//
//  Created by MAC on 6/6/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

  private let viewModel = FriendsViewModel()

  @IBOutlet weak var episodeTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.episodeTableView.dataSource = self
    self.episodeTableView.delegate = self
    //self.episodeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    self.episodeTableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")

    
    self.viewModel.getData {
      DispatchQueue.main.async {
        self.episodeTableView.reloadData()
      }
    }
  }
}



extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.viewModel.numberOfEpisodes()
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell

    let episode = self.viewModel.episode(for: indexPath.row)
    cell.detailLabel?.text = episode.name

    let secondDateFormatterGet = DateFormatter()
    secondDateFormatterGet.dateFormat = "yyyy-MM-dd"
    let secondDateFormatterPrint = DateFormatter()
    secondDateFormatterPrint.dateFormat = "MMMM d, yyyy"
    let airDate = secondDateFormatterGet.date(from: episode.airDate )
    let newAirDate = (secondDateFormatterPrint.string(from: airDate!))
    cell.subtitleLabel?.text = newAirDate

    DispatchQueue.main.async {
      let cellImage = try! UIImage(data: NSData(contentsOf: NSURL(string:episode.image)! as URL) as Data)
      cell.cellImage.image = cellImage
    }


    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let episode = self.viewModel.episode(for: indexPath.row)
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
    detailVC.episode = episode
    self.episodeTableView.deselectRow(at: indexPath, animated: true)
    self.navigationController?.pushViewController(detailVC, animated: true)
  }
}
