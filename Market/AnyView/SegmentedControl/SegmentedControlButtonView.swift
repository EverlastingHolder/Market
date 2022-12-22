import SwiftUI

struct SegmentedControlButtonView: View {
    @Binding
    private var selectedIndex: Int
    @Binding
    private var frames: [CGRect]
    @Binding
    private var backgroundFrame: CGRect
    
    private let titles: [String]
    
    init(
        selectedIndex: Binding<Int>,
        frames: Binding<[CGRect]>,
        backgroundFrame: Binding<CGRect>,
        titles: [String]
    ) {
        _selectedIndex = selectedIndex
        _frames = frames
        _backgroundFrame = backgroundFrame
        
        self.titles = titles
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(titles.indices, id: \.self) { index in
                Button(action:{
                    withAnimation {
                        selectedIndex = index
                    }
                }) {
                    HStack {
                        Text(titles[index])
                    }
                }
                .buttonStyle(CustomSegmentButtonStyle())
                .background(
                    GeometryReader { geoReader in
                        Color.clear.preference(key: RectPreferenceKey.self, value: geoReader.frame(in: .global))
                            .onPreferenceChange(RectPreferenceKey.self) {
                                self.setFrame(index: index, frame: $0)
                            }
                    }
                )
            }
        }
        .modifier(UnderlineModifier(selectedIndex: selectedIndex, frames: frames))
    }
    
    private func setFrame(index: Int, frame: CGRect) {
        self.frames[index] = frame
    }
}

struct RectPreferenceKey: PreferenceKey {
    typealias Value = CGRect
    
    static var defaultValue = CGRect.zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
