import SwiftUI

struct FiltersView: View {
    @Binding
    var isShow: Bool
    
    @State
    var model: MainModel
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack(spacing: 14) {
                HStack {
                    Button(action: {
                        isShow = false
                    }) {
                        Image(systemName: "xmark")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                    }
                    .padding(9.5)
                    .backgroundColor(.darkBlue)
                    .cornerRadius(10)
                    
                    Spacer(minLength: 0)
                    
                    Text("Filter options")
                        .customFont(fontSize: 18, fontWeight: .medium)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        isShow = false
                    }) {
                        Text("Done")
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 7)
                    .padding(.horizontal, 10)
                    .backgroundColor(.darkOrange)
                    .cornerRadius(10)
                }
                .padding(.bottom, 45)
                
                ScrollView(showsIndicators: false) {
                    FilterFieldView(fieldName: "Brand", selectedItem: model.bestSeller[0].title, data: model.bestSeller.map { $0.title })
                    FilterFieldView(isPrice: true, fieldName: "Price")
                    FilterFieldView(fieldName: "Size", selectedItem: "4.5 to 5.5 inches")
                }
                
                Spacer(minLength: 0)
                
            }
                .padding(EdgeInsets(top: 24, leading: 44, bottom: 0, trailing: 20))
        }
    }
}
