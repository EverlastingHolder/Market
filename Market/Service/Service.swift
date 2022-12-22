import Combine
import Foundation

protocol MainServiceProtocol {
    func getMainInfo() async throws -> MainModel
    func getDetailInfo() async throws -> CarouselModel
}

class MainService: MainServiceProtocol, HTTPClient {
    
    func getMainInfo() async throws -> MainModel {
        return try await sendRequest(endpoint: MainEndpoints(), responseModel: MainModel.self)
    }
    
    func getDetailInfo() async throws -> CarouselModel {
        return try await sendRequest(endpoint: CarouselEndpoints(), responseModel: CarouselModel.self)
    }
}

