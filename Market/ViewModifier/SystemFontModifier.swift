import SwiftUI

struct SystemFontModifier: ViewModifier {
    var fontSize: CGFloat
    var fontWeight: Font.Weight
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(color)
            .font(.system(size: fontSize))
            .fontWeight(fontWeight)
    }
}
