import SwiftUI

struct CarouselModel: Codable {
    var CPU: String
    var camera: String
    var capacity: [String]
    var color: [String]
    var id: String
    var images: [String]
    var isFavorites: Bool
    var price: Int
    var rating: Float
    var sd: String
    var ssd: String
    var title: String
    
    var links: [URL] { self.images.map { URL(string: $0)! } }
}
