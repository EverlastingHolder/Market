import SwiftUI

extension DisclosureGroup {
    func customDisclosureGroupStyle() -> some View {
        modifier(CustomDisclosureGroupModifier())
    }
}
