import SwiftUI

struct HotCardView: View {
    @State
    var model: HomeStoreModel
    
    var body: some View {
        ZStack(alignment: .leading) {
            AsyncImage(url: model.link) { image in
                image
                    .resizable()
                    .cornerRadius(10)
            } placeholder: {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.chevron)
            }
                
            
            VStack(alignment: .leading, spacing: 18) {
                if model.isNew == true {
                    Text("New")
                        .padding(9)
                        .systemFont(fontSize: 10)
                        .backgroundColor(.darkOrange)
                        .clipShape(Circle())
                        .padding(-9)
                }
                
                VStack(alignment: .leading) {
                    Text(model.title)
                        .systemFont(fontSize: 25)
                    
                    Text(model.subtitle)
                        .systemFont(fontSize: 11, fontWeight: .regular)
                }
                
                if model.isBuy {
                    Button(action: {}) {
                        Text("Buy now!")
                            .systemFont(fontSize: 11, color: .darkBlue)
                    }
                    .frame(width: 100, height: 25)
                    .background(.white)
                    .cornerRadius(5)
                }
            }
            .padding(.leading, 32)
        }
    }
}

