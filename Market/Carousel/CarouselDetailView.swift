import SwiftUI

struct CarouselDetailView: View {
    @State
    private var snappedItem = 0.0
    @State
    private var draggingItem = 0.0
    
    let links: [URL]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ForEach(links.indices, id: \.self) { item in
                ZStack {
                    AsyncImage(url: links[item]) { image in
                        image
                            .resizable()
                            .cornerRadius(10)
                            .frame(maxWidth: 200, maxHeight: 300)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 260, height: 305)
                                    .foregroundColor(.white)
                            )
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 260, height: 305)
                            .foregroundColor(.chevron)
                    }
                }
                .scaleEffect(1.0 - abs(distance(item)) * 0.2 )
                .opacity(1.0 - abs(distance(item)) * 0.3 )
                .offset(x: myXOffset(item), y: 0)
                .zIndex(1.0 - abs(distance(item)) * 0.1)
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        draggingItem = snappedItem + value.translation.width / 100
                    }
                    .onEnded { value in
                        withAnimation {
                            draggingItem = snappedItem + value.predictedEndTranslation.width / 100
                            draggingItem = round(draggingItem).remainder(dividingBy: Double(links.count))
                            snappedItem = draggingItem
                        }
                    }
            )
        }
    }
    
    private func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(links.count))
    }
    
    private func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(links.count) * distance(item)
        return sin(angle) * 200
    }
}
