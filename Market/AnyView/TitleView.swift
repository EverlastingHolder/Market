import SwiftUI

struct TitleView: View {
    let title: String
    let detail: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.darkBlue)
                .font(.custom("MarkPro", size: 25))
                .fontWeight(.bold)
            
            Spacer()
            Text(detail)
                .foregroundColor(.darkOrange)
                .font(.custom("MarkPro", size: 15))
                .fontWeight(.regular)
        }
    }
}
