import SwiftUI

struct CustomTabBarView: View {
    let name: [String] = ["Bug", "EmptyHeart", "Person"]
    var body: some View {
        HStack(spacing: 42) {
            Spacer(minLength: 0)
            HStack {
                Circle()
                    .frame(width: 8)
                    .foregroundColor(.white)
                Text("Explore")
                    .font(.custom("MarkPro", size: 15))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            HStack() {
                ForEach(name, id: \.self) {
                    Spacer(minLength: 0)
                    Image($0)
                    Spacer(minLength: 0)
                }
            }
            Spacer(minLength: 0)
        }
        .padding(.vertical, 25)
        .backgroundColor(.darkBlue)
        .cornerRadius(30)
        .padding(.bottom, UIApplication.safeAreaInsets.bottom == 0 ? 15 : UIApplication.safeAreaInsets.bottom)
    }
}
