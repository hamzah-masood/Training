//
//  ViewController.swift
//  pixabayProject
//
//  Created by MCS on 8/30/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let apiKey = "13466062-6ac6987f27cfb51eb71fee381"
  var imagesArray: [Image] = []
  
  @IBOutlet weak var mainTable: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.mainTable.dataSource = self
    self.mainTable.delegate = self
    self.mainTable.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    
    URLSession.shared.dataTask(with: URL(string: "https://pixabay.com/api/?key=\(apiKey)&q=sunset&image_type=photo&pretty=true")!) { (data, response, _) in
      guard let data = data else { return }
      let imagesContainer = try? JSONDecoder().decode(ImageContainer.self, from: data)
      guard let newImagesContainer = imagesContainer else {
        print("Something went wrong")
        return
      }
      self.imagesArray = newImagesContainer.image

      print(self.imagesArray)
      
      do {
        try CoreDataManager.shared.context.save()
      } catch {
        print(error.localizedDescription)
      }
      DispatchQueue.main.async {
        self.mainTable.reloadData()
      }
      
      }.resume()
    
      //var offlinesImages = CoreDataManager.shared.getAllImages()
      //print(offlinesImages.self)
    // Do any additional setup after loading the view.
  }


}

struct ImageContainer: Decodable {
  let image: [Image]
  
  
  enum CodingKeys: String, CodingKey {
    case dictionary = "hits"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    //let imageContainer = try topContainer.nestedContainer(keyedBy: Image.ImageCodingKeys.self, forKey: .dictionary)
    image = try container.decode([Image].self, forKey: .dictionary)
    
    //************************************
    
    }
  }


extension UIViewController: UITableViewDataSource {
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
    
    return cell
  }
  
  
}

extension UIViewController: UITableViewDelegate {
  
}

