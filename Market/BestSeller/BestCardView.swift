import SwiftUI

struct BestCardView: View {
    @State
    var isTap: Bool = false
    @State
    var model: BestSellerModel
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading) {
                AsyncImage(url: model.link) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .frame(maxHeight: 170)
                            .cornerRadius(10)
                    } else if phase.error != nil {
                        Text("Error")
                            
                    } else {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 170)
                            .foregroundColor(.chevron)
                    }
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("$\(model.discountPrice)")
                            .customFont(fontSize: 16, fontWeight: .bold)
                            .foregroundColor(.darkBlue)
                        
                        Text("~~$\(model.priceWithoutDiscount)~~")
                            .customFont(fontSize: 10, fontWeight: .medium)
                            .foregroundColor(.grey)
                    }
                    
                    Text(model.title)
                        .customFont(fontSize: 10, fontWeight: .regular)
                        .foregroundColor(.darkBlue)
                    
                }.padding(.leading, 20)
            }
            .padding(.top, 5)
            .padding(.bottom, 15)
            
            Image(isTap ? "FillHeart" : "Heart")
                .padding(10)
                .frame(minWidth: 11, minHeight: 11)
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.15), radius: 1)
                .onTapGesture {
                    isTap.toggle()
                }
                .padding([.top, .trailing], 8)
            
        }
        .background(.white)
        .cornerRadius(10)
    }
}
