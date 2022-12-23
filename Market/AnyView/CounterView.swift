import SwiftUI

struct CounterView: View {
    @State
    var counter: Int
    
    var body: some View {
        VStack(spacing: 6) {
            Button(action: {
                if counter > 0 {
                    counter -= 1
                }
            }) {
                Image(systemName: "minus")
                    .foregroundColor(.white)
            }
            Text("\(counter)")
                .foregroundColor(.white)
                .customFont(fontSize: 20, fontWeight: .medium)
            Button(action: {
                counter += 1
            }) {
                Image(systemName: "plus")
                    .foregroundColor(.white)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 8)
        .background(
            RoundedRectangle(cornerRadius: 26)
                .foregroundColor(Color.init(hex: "#282843"))
        )
        
    }
}
