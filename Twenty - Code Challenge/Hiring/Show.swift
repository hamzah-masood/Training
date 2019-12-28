import Foundation
import RxSwift

struct Show: Codable {
    let name: String
    private let _embedded: Embedded
    var seasons: [Season] {
        return _embedded.seasons
    }
}

private struct Embedded: Codable {
    let seasons: [Season]
}

struct Season: Codable {
    let id: Int
    let name: String
    let number: Int
}

extension Show: ReactiveCompatible {
    
}

extension Show: Request {
    var urlRequest: URLRequest {
        return URLRequest(url: URL(string: "string")!)
    }
    
    
}
