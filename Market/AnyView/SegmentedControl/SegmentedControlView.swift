import SwiftUI

struct SegmentedControlView: View {
    @Binding
    private var selectedIndex: Int
    
    @State
    private var frames: Array<CGRect>
    @State
    private var backgroundFrame = CGRect.zero
    
    private let titles: [String]
    
    init(selectedIndex: Binding<Int>, titles: [String]) {
        self._selectedIndex = selectedIndex
        self.titles = titles
        frames = Array<CGRect>(repeating: .zero, count: titles.count)
    }
    
    var body: some View {
        VStack {
            SegmentedControlButtonView(
                selectedIndex: $selectedIndex,
                frames: $frames,
                backgroundFrame: $backgroundFrame,
                titles: titles
            )
        }
        .background(
            GeometryReader { geoReader in
                Color.clear.preference(
                    key: RectPreferenceKey.self,
                    value: geoReader.frame(in: .global)
                )
                .onPreferenceChange(RectPreferenceKey.self) {
                    self.setBackgroundFrame(frame: $0)
                }
            }
        )
    }
    
    private func setBackgroundFrame(frame: CGRect) {
        backgroundFrame = frame
    }
}
