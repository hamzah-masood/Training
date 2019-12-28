import UIKit

extension UIImageView {
    func load(url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            DispatchQueue.main.async {
                self?.image = data.flatMap(UIImage.init(data:))
            }
        }.resume()
    }
}
