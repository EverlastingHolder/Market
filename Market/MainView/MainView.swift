import SwiftUI

struct MainView: View {
    @State
    private var text: String = ""
    @FocusState
    private var focus: Bool
    @StateObject
    var viewModel: MainViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.backgorund
                .ignoresSafeArea()
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 35) {
                        VStack {
                            SelectCategoryView()
                        }
                        VStack {
                            SearchBarView(text: $text, focus: _focus, viewModel: viewModel)
                        }
                        VStack {
                            HotSalesView(viewModel: viewModel)
                        }
                        VStack {
                            BestSellerView(viewModel: viewModel)
                        }
                    }.padding(.bottom, 4)
                }
                .onTapGesture {
                    focus = false
                }
                CustomTabBarView()
            }.ignoresSafeArea(.all, edges: .bottom)
        }
    }
}








