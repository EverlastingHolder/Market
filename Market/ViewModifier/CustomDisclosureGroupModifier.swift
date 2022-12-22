import SwiftUI

struct CustomDisclosureGroupModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .disclosureGroupStyle(CustomDisclosureGroupStyle())
            .padding(7)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.chevron)
            )
    }
}
