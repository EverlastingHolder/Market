import SwiftUI

class CarouselViewModel: ObservableObject {
    
    @Published
    var model: CarouselModel?
    
    private let service: Service = .init()
    
    init() {
        Task {
            await getDetailInfo()
        }
    }
    
    @MainActor
    func getDetailInfo() async {
        do {
            let main = try await service.getDetailInfo()
            model = main
        } catch {
            print(error.localizedDescription)
        }
    }
}
