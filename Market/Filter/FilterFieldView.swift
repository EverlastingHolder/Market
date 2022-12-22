import SwiftUI

struct FilterFieldView: View {
    @State
    var isPrice: Bool = false
    @State
    var isShow: Bool = false
    let fieldName: String
    @State
    private var range: ClosedRange<Int> = 0...10000
    @State
    var selectedItem: String?
    @State
    var data: [String]?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(fieldName)
                .customFont(fontSize: 18, fontWeight: .medium)
            DisclosureGroup(isExpanded: $isShow) {
                Divider()
                VStack(alignment: .leading, spacing: 0) {
                    if isPrice {
                        RangedSliderView(value: $range, bounds: 0...10000)
                            .padding(24)
                    } else {
                        ForEach(data ?? [], id: \.self) { item in
                            Button(action: {
                                withAnimation {
                                    isShow = false
                                }
                                selectedItem = item
                            }) {
                                HStack {
                                    Text(item)
                                        .customFont(fontSize: 18, fontWeight: .regular)
                                        .foregroundColor(.darkBlue)
                                    Spacer(minLength: 0)
                                }
                                .padding(.vertical, 7)
                            }
                        }
                    }
                }
            } label: {
                Text(isPrice ? "$\(range.lowerBound)-$\(range.upperBound)" : selectedItem!)
            }
            .customDisclosureGroupStyle()
        }
    }
}
