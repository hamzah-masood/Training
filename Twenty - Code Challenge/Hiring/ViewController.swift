import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    var episodes: [Episode] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        getShows()
        setupTableView()
    }
    func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview().inset(16)
        }
        tableView.dataSource = self
        tableView.register(EpisodeCell.self, forCellReuseIdentifier: "EpisodeCell")
    }
    
    func getShows() {
        let request = APIRequest(id: String.westworldID, preIDURL: String.showPreIDURLComponent, postIDURL: String.showPostIDURLComponent)
        let completion: ((Result<Show>) -> Void) = { [weak self] (result) in
            switch result {
            case .success(let val):
                let seasons = val.seasons
                for season in seasons {
                    self?.getSeason(id: String(season.id))
                }
            case .error:
                print("There was an error getting the seasons")
            }
        }
        API().fetch(request: request, completion: completion)
        
    }
    
    func getSeason(id: String) {
        let request = APIRequest(id: id, preIDURL: String.seasonPreIDURLComponent, postIDURL: String.seassonPostIDURLComponent)
        let completion: ((Result<[Episode]>) -> Void) = { [weak self] (result) in
            switch result {
            case .success(let episodes):
                self?.episodes += episodes
            case .error:
                print("Unable to get episodes")
            }
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        API().fetch(request: request, completion: completion)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell") as? EpisodeCell else { return UITableViewCell() }
        cell.nameLabel.text = episodes[indexPath.row].name
        cell.numberLabel.text = String(episodes[indexPath.row].number)
        cell.previewImageView.load(url: episodes[indexPath.row].image.medium)
        return cell
    }
}
