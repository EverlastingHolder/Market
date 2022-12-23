import Foundation

struct CartModel: Codable, Hashable {
    var basket: [Basket]
    var delivery: String
    var id: String
    var total: Int
    
    struct Basket: Codable, Hashable {
        var id: Int
        var images: String
        var price: Int
        var title: String
        var link: URL { URL(string: self.images)! }
    }
}
