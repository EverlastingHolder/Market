import Combine
import Foundation

protocol ServiceProtocol {
    func getMainInfo() async throws -> MainModel
    func getDetailInfo() async throws -> CarouselModel
    func getCartInfo() async throws -> CartModel
}

class Service: ServiceProtocol, HTTPClient {
    
    func getMainInfo() async throws -> MainModel {
        return try await sendRequest(endpoint: MainEndpoints(), responseModel: MainModel.self)
    }
    
    func getDetailInfo() async throws -> CarouselModel {
        return try await sendRequest(endpoint: CarouselEndpoints(), responseModel: CarouselModel.self)
    }
    
    func getCartInfo() async throws -> CartModel {
        return try await sendRequest(endpoint: CartEndpoint(), responseModel: CartModel.self)
    }
}

