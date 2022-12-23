import SwiftUI

struct MainView: View {
    @State
    private var text: String = ""
    @FocusState
    private var focus: Bool
    @StateObject
    var viewModel: MainViewModel = .init()
    @State
    private var isShow: Bool = false
    
    
    var body: some View {
        NavigationStack {
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
                                SearchBarView(text: $text, focus: _focus)
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
                    CustomTabBarView(countCartItem: $viewModel.counterCart, model: $viewModel.cartModel)
                }.ignoresSafeArea(.all, edges: .bottom)
            }
            .sheet(isPresented: $isShow) {
                FiltersView(isShow: $isShow, model: viewModel.mainModel)
                    .presentationDetents([.medium])
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    toolBar()
                }
                ToolbarItem {
                    Button(action: {
                        isShow = true
                    }) {
                        Image("Filter")
                    }
                }
            }
        }
    }
    @ViewBuilder
    private func toolBar() -> some View {
        HStack {
            Image("Mapping")
                .renderingMode(.template)
                .foregroundColor(.darkOrange)
            Text("Zihuatanejo, Gro")
                .customFont(fontSize: 15, fontWeight: .medium)
                .foregroundColor(.darkBlue)
            Image(systemName: "chevron.down")
                .foregroundColor(.chevron)
        }
    }
}








