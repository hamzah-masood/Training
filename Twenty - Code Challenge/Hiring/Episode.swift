import Foundation

struct Episode: Codable {
    let id: Int
    let number: Int
    let season: Int
    let image: Image
    let name: String

    struct Image: Codable {
        let medium: URL
        let original: URL
    }
}
