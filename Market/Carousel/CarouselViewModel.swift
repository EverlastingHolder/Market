import SwiftUI

class CarouselViewModel: ObservableObject {
    
    @Published
    var model: CarouselModel?
    
    private let service: MainService = .init()
    
    @MainActor
    init() {
        Task {
            do {
                let main = try await service.getDetailInfo()
                model = main
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
//    @MainActor
//    func getDetailInfo() async {
//        do {
//            let main = try await service.getDetailInfo()
//            model = main
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
}
