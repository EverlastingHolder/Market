import SwiftUI

struct HotSalesView: View {
    @ObservedObject
    var viewModel: MainViewModel
    var body: some View {
        VStack {
            TitleView(title: "Hot salse", detail: "see more")
                .padding(.leading, 17)
                .padding(.trailing, 27)
            TabView {
                if viewModel.mainModel.homeStore.isEmpty {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.chevron)
                } else {
                    ForEach(viewModel.mainModel.homeStore, id: \.id) { item in
                        HotCardView(model: item)
                    }
                }
            }
            .padding(.leading, 15)
            .padding(.trailing, 21)
            .frame(height: 182)
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

