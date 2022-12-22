import SwiftUI

struct SelectCategoryIconView: View {
    @Binding var isTap: Bool
    let name: String
    let id: Int
    var body: some View {
        VStack {
            Image(name)
                .renderingMode(isTap ? .template : .original)
                .foregroundColor(isTap ? .white : .none)
                .padding()
                .frame(minWidth: 71, minHeight: 71)
            
                .backgroundColor(isTap ? .darkOrange : .white)
                .clipShape(Circle())
            
            Text(name)
                .foregroundColor(isTap ? .darkOrange : .darkBlue)
                .font(.custom("MarkPro", size: 12))
                .fontWeight(.medium)
        }.padding(.leading, 23)
    }
}
