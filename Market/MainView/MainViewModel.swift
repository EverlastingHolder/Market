import Combine

class MainViewModel: ObservableObject {
    private let service: Service = .init()
    
    @Published
    var mainModel: MainModel = .init(homeStore: [], bestSeller: [])
    @Published
    var cartModel: CartModel = .init(basket: [], delivery: "", id: "", total: 0)
    @Published
    var counterCart: Int = 0
    
    init() {
        Task {
            await getMainInfo()
            await getCartInfo()
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
    
    @MainActor
    func getCartInfo() async {
        do {
            let cart = try await service.getCartInfo()
            cartModel = cart
            counterCart = cart.basket.count
        } catch {
            print(error.localizedDescription)
        }
    }
}
