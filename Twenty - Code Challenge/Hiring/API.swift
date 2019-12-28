import Foundation

protocol Request {
    var urlRequest: URLRequest { get }
}

enum Result<T> {
    case success(T)
    case error(Error)
}

final class API {
    func fetch<T: Decodable>(request: Request, completion: @escaping ((Result<T>) -> Void)) {
        URLSession.shared.dataTask(with: request.urlRequest) { data, response, error in
            if let data = data {
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(model))
                } catch {
                    completion(.error(error))
                }
            } else {
                completion(.error(error ?? Error.unknownError))
            }
        }.resume()
    }

    enum Error: Swift.Error {
        case unknownError
    }
}
