import SwiftUI

struct CustomFontModifier: ViewModifier {
    var fontSize: CGFloat
    var fontWeight: Font.Weight
    
    func body(content: Content) -> some View {
        content
            .font(.custom("MarkPro", size: fontSize))
            .fontWeight(fontWeight)
    }
}
