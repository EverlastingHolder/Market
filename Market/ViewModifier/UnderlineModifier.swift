import SwiftUI

struct UnderlineModifier: ViewModifier {
    var selectedIndex: Int
    let frames: [CGRect]
    
    func body(content: Content) -> some View {
        content
            .background(
                Rectangle()
                    .fill(Color.red)
                    .frame(width: frames[selectedIndex].width, height: 2)
                    .offset(x: frames[selectedIndex].minX - frames[0].minX),
                alignment: .bottomLeading
            )
    }
}
