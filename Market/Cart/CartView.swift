import SwiftUI

struct CartView: View {
    @Binding
    var model: CartModel
    @State
    var counter: Int = 1
    
    var body: some View {
        ZStack {
            Color.backgorund
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                Text("My Cart")
                    .foregroundColor(.darkBlue)
                    .customFont(fontSize: 35, fontWeight: .bold)
                    .padding(.vertical, 50)
                    .padding(.leading, 42)
                VStack {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 45) {
                            ForEach(model.basket, id: \.id) { item in
                                HStack(spacing: 17) {
                                    AsyncImage(url: item.link) { image in
                                        image
                                            .resizable()
                                            .frame(maxWidth: 88, maxHeight: 88)
                                            .cornerRadius(10)
                                    } placeholder: {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: 88, height: 88)
                                            .foregroundColor(.chevron)
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text(item.title)
                                            .foregroundColor(.white)
                                            .customFont(fontSize: 20, fontWeight: .medium)
                                            .lineLimit(nil)
                                        Spacer()
                                        Text("$\(item.price)")
                                            .foregroundColor(.darkOrange)
                                            .customFont(fontSize: 20, fontWeight: .medium)
                                    }
                                    
                                    Spacer()
                                    
                                    HStack {
                                        CounterView(counter: counter)
                                        Image(systemName: "trash")
                                            .foregroundColor(Color.init(hex: "#36364D"))
                                    }
                                    .padding(.trailing, 32)
                                }
                                .padding(.leading, 23)
                                
                            }
                        }
                        .padding(.top, 80)
                    }
                    
                    VStack {
                        Divider()
                            .backgroundColor(.white.opacity(0.25))
                        HStack{
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Total")
                                    .foregroundColor(.white)
                                    .customFont(fontSize: 15, fontWeight: .regular)
                                Text("Delivery")
                                    .foregroundColor(.white)
                                    .customFont(fontSize: 15, fontWeight: .regular)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 12) {
                                Text("$\(model.total) us")
                                    .foregroundColor(.white)
                                    .customFont(fontSize: 15, fontWeight: .bold)
                                Text(model.delivery)
                                    .foregroundColor(.white)
                                    .customFont(fontSize: 15, fontWeight: .bold)
                            }
                        }
                        .padding(.horizontal, 55)
                        Divider()
                            .backgroundColor(.white.opacity(0.20))
                    }
                    Button(action: {}) {
                        HStack {
                            Spacer()
                            Text("Checkout")
                                .foregroundColor(.white)
                                .customFont(fontSize: 20, fontWeight: .bold)
                            Spacer()
                        }.padding(.vertical, 15)
                    }
                    .backgroundColor(.darkOrange)
                    .cornerRadius(10)
                    .padding([.bottom, .horizontal], 44)
                    .padding(.top, 30)
                }
                .backgroundColor(.darkBlue)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .shadow(color: Color(hex:"#4C5F8F1A")!, radius: 20, x: 0, y: -5)
                .ignoresSafeArea()
            }
        }
        .customToolBar(imageName: "Mapping", trailingButtonText: "Add addres")
        .navigationBarBackButtonHidden(true)
    }
}
