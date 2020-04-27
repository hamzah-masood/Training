//
//  ViewModel.swift
//  NetworkLayerProject
//
//  Created by mcs on 4/16/20.
//  Copyright © 2020 mcs. All rights reserved.
//

import Foundation

//protocol Session {
//  func getData(from url: URL, completion: ((Data?, Error?) -> Void)?)
//}
//extension URLSession: Session {
//  func getData(from url: URL, completion: ((Data?, Error?) -> Void)?) {
//    dataTask(with: url) { (data, _, error) in
//      completion?(data, error)
//    }.resume()
//  }
//}
//


protocol FeedProviding {
  var network: Networking { get }

  func getFeed(_ completion: @escaping (Result<Feed, Error>) -> Void)
}

enum Endpoint {
    case feed
}

//implenting extension of getFeed as it is what we want, other users can change it how they want
extension FeedProviding {
//    func getFeed(_completion: @escaping (Result<Feed, Error) -> Void) {
//        network.fetch(.feed, completeion: completion)
//        }
    func getFeed(_ completion: @escaping (Result<Feed, Error>) -> Void) {
        network.execute(Endpoint.feed, completion: completion)
    }
}

//implementing networking object that takes some kind of endpoint and the fetch object should be able to decode data into the right model
//fetch method can define what the networking object will decode its data into by infering T based on completion, also Fetch method accepts endpoint parameter that can be enum or struct
protocol Networking {
//    func fetch<T: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<T, Error) -> Void)
    func execute<T: Decodable>(_ requestProvider: RequestProviding, completion: @escaping (Result<T, Error>) -> Void)
}

extension Networking {
    func execute<T: Decodable>(_ requestProvider: RequestProviding, completion: @escaping (Result<T, Error>) -> Void) {
        let urlRequest = requestProvider.urlRequest

        URLSession.shared.dataTask(with: urlRequest){ data, response, error in
            do {
                if let error = error {
                    completion(.failure(error))
                    return
                }

                guard let data = data else {
                    preconditionFailure("No error, also no Data")
                }

                let decodeObject = try JSONDecoder().decode(T.self, from: data)

                completion(.success(decodeObject))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
//    func fetch<T: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
//    let urlRequest = endpoint.urlRequest
//
//    URLSession.shared.dataTask(with: urlRequest){ data, response, error in
//        do {
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            guard let data = data else {
//                preconditionFailure("No error, also no Data")
//            }
//
//            let decodeObject = try JSONDecoder().decode(T.self, from: data)
//
//            completion(.success(decodeObject))
//        } catch {
//            completion(.failure(error))
//        }
//    }.resume()
//
//    }
}

protocol RequestProviding {
    var urlRequest: URLRequest { get }
}

//by conforming Endpoint enum to RequestProviding we still have abilitiy to define endpoints nut also free to configure our requests and endpoints how we want
extension Endpoint: RequestProviding {
    var urlRequest: URLRequest {
        switch self {
        case .feed:
            guard let url = URL(string: "https://mydomain.com/feed") else {
                preconditionFailure("Invalid URL used")
            }

            return URLRequest(url: url)
        }
    }
}

class ViewModel {

    let service: FeedProviding
    
    //Feed object needs to be built
    var feed: Feed?
    var onFeedUpdate: () -> Void = {}

    init(service: FeedProviding) {
        self.service = service
    }

    func fetch() {
        service.getFeed { result in
            do {
                self.feed = try result.get()
                self.onFeedUpdate()
            } catch {
                //handle error
            }
        }
    }
}


//class ViewModel {
//
//  private let myURL = "https://api.tvmaze.com/shows/431?embed=episodes"
//  private var episodes = [Episode]()
//
//  func getData(session: Session = URLSession.shared, _ completion: (() -> Void)?) {
//    guard let myUrl = URL(string: self.myURL) else {
//      completion?()
//      return
//    }
//    session.getData(from: myUrl) { [weak self] (data, error) in
//      defer { completion?() }
//      guard let data = data,
//        error == nil,
//        let episodeContainer = try? JSONDecoder().decode(EpisodeContainer.self, from: data) else { return }
//      self?.episodes = episodeContainer.episodes
//      }
//  }
//
//}
    

    

    
//    URLSession.shared.dataTask(with: URL(string: "https://api.tvmaze.com/shows/82?embed=seasons&embed=episodes")!) { (data, response, _) in
//      guard let data = data else { return }
//      let gameOfThrones = try? JSONDecoder().decode(GameofThrones.self, from: data)
//      self.gameOfThronesArray = (gameOfThrones?.episodes)!
//
//      DispatchQueue.main.async {
//        self.episodes.reloadData()
//      }
//      }.resume()
    
    
    

