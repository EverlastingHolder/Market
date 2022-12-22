import SwiftUI

extension View {
    func backgroundColor(_ color: Color) -> some View {
        background(color)
    }
    
    func customFont(fontSize: CGFloat, fontWeight: Font.Weight) -> some View {
        modifier(CustomFontModifier(fontSize: fontSize, fontWeight: fontWeight))
    }
    
    func systemFont(fontSize: CGFloat, fontWeight: Font.Weight = .bold, color: Color = .white) -> some View {
        modifier(SystemFontModifier(fontSize: fontSize, fontWeight: fontWeight, color: color))
    }
}

extension TextField {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View
    {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
