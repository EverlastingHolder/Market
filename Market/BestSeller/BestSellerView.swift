import SwiftUI

struct BestSellerView: View {
    @ObservedObject
    var viewModel: MainViewModel
    private let collumns = [
        GridItem(.flexible(), spacing: 14),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            TitleView(title: "Best Seller", detail: "see more")
            
            LazyVGrid(columns: collumns, spacing: 12) {
                if viewModel.mainModel.bestSeller.isEmpty {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.chevron)
                        .frame(height: 230)
                } else {
                    ForEach(viewModel.mainModel.bestSeller, id: \.id) { item in
                        NavigationLink(destination: CarouselView()) {
                            BestCardView(model: item)
                        }
                    }
                }
            }
        }
        .padding(.leading, 17)
        .padding(.trailing, 27)
    }
}
