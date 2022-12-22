import Foundation

struct MainModel: Codable, Hashable {
    var homeStore: [HomeStoreModel]
    var bestSeller: [BestSellerModel]
    
    enum CodingKeys: String, CodingKey {
        case homeStore = "home_store"
        case bestSeller = "best_seller"
    }
}

struct HomeStoreModel: Codable, Hashable {
    var id: Int
    var isNew: Bool?
    var title: String
    var subtitle: String
    var picture: String
    var isBuy: Bool
    var link: URL { URL(string: self.picture)! }
    
    enum CodingKeys: String, CodingKey {
        case id
        case isNew = "is_new"
        case title
        case picture
        case subtitle
        case isBuy = "is_buy"
    }
}

struct BestSellerModel: Codable, Hashable {
    var id: Int
    var isFavorites: Bool
    var title: String
    var priceWithoutDiscount: Int
    var discountPrice: Int
    var picture: String
    var link: URL { URL(string: self.picture)! }
    
    enum CodingKeys: String, CodingKey {
        case priceWithoutDiscount = "price_without_discount"
        case discountPrice = "discount_price"
        case isFavorites = "is_favorites"
        case id, title, picture
    }
}
