import SwiftUI

struct CustomTabBarView: View {
    let name: [String] = ["EmptyHeart", "Person"]
    @Binding
    var countCartItem: Int
    @Binding
    var model: CartModel
    var body: some View {
        HStack(spacing: 42) {
            Spacer(minLength: 0)
            HStack {
                Circle()
                    .frame(width: 8)
                    .foregroundColor(.white)
                Text("Explore")
                    .customFont(fontSize: 15, fontWeight: .bold)
                    .foregroundColor(.white)
            }
            HStack() {
                Spacer(minLength: 0)
                NavigationLink(destination: CartView(model: $model)) {
                    Image("Bug")
                        .overlay {
                            overlay(count: countCartItem)
                        }
                }
                Spacer(minLength: 0)
                ForEach(name, id: \.self) { item in
                    Spacer(minLength: 0)
                    Button(action: {}) {
                        Image(item)
                    }
                    Spacer(minLength: 0)
                }
            }
            Spacer(minLength: 0)
        }
        .padding(.vertical, 25)
        .backgroundColor(.darkBlue)
        .cornerRadius(30)
        .padding(.bottom,
                 UIApplication.safeAreaInsets.bottom == 0 ?
                 15
                 :
                 UIApplication.safeAreaInsets.bottom
        )
    }
    @ViewBuilder
    private func overlay(count: Int) -> some View {
        Text("\(count)")
            .padding(4)
            .customFont(fontSize: 11, fontWeight: .regular)
            .foregroundColor(.white)
            .background(Circle().foregroundColor(.red))
            .offset(x: 10, y: -11)
            .opacity(count > 0 ? 1 : 0)
    }
}
