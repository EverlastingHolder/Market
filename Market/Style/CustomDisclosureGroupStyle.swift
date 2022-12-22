import SwiftUI

struct CustomDisclosureGroupStyle: DisclosureGroupStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            Button {
                withAnimation {
                    configuration.isExpanded.toggle()
                }
            } label: {
                HStack(alignment: .firstTextBaseline) {
                    configuration.label
                        .customFont(fontSize: 18, fontWeight: .medium)
                        .foregroundColor(.darkBlue)
                    Spacer()
                    withAnimation {
                        Image(systemName: "chevron.down")
                            .renderingMode(.template)
                            .foregroundColor(.chevron)
                            .rotationEffect(.degrees(configuration.isExpanded ? 0 : 180))
                    }
                }
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            if configuration.isExpanded {
                configuration.content
            }
        }
    }
}
