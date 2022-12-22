import Combine

class MainViewModel: ObservableObject {
    private let service: MainService = .init()
    
    @Published
    var mainModel: MainModel = .init(homeStore: [], bestSeller: [])
    
    init() {
        Task {
            await getMainInfo()
        }
    }
    
    @MainActor
    func getMainInfo() async {
        do {
            let main = try await service.getMainInfo()
            mainModel = main
        } catch {
            print(error.localizedDescription)
        }
    }
}
