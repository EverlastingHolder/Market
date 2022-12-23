import SwiftUI

struct SearchBarView: View {
    @Binding
    var text: String
    @FocusState
    var focus: Bool
    
    var body: some View {
        HStack(spacing: 11) {
            TextField("", text: $text)
                .placeholder(when: text.isEmpty) {
                    Text("Search")
                        .font(.custom("MarkPro", size: 12))
                        .fontWeight(.regular)
                        .foregroundColor(.darkBlue)
                        .opacity(0.5)
                }
                .padding(8)
                .padding(.leading, 56)
                .background(Color.white)
                .cornerRadius(50)
                .padding(.leading, 32)
                .focused($focus)
            
            Button(action: {}) {
                Image("Qrcode")
                    .padding()
                    .frame(minWidth: 34, minHeight: 34)
                    .background(Color.darkOrange)
                    .clipShape(Circle())
            }
        }
        .padding(.trailing, 37)
        .overlay(
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.darkOrange)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 56)
            }
        )
    }
}
