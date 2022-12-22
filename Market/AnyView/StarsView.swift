import SwiftUI

struct StarsView: View {
    private let maxRating: Float = 5
    private let color = Color.yellow
    
    let rating: Float
    private let fullCount: Int
    private let emptyCount: Int
    private let halfFullCount: Int
    
    init(rating: Float) {
        self.rating = rating
        fullCount = Int(rating)
        emptyCount = Int(maxRating - rating)
        halfFullCount = (Float(fullCount + emptyCount) < maxRating) ? 1 : 0
    }
    
    var body: some View {
        HStack {
            ForEach(0..<fullCount, id: \.self) { _ in
                star(starName: "star.fill")
            }
            ForEach(0..<halfFullCount, id: \.self) { _ in
                star(starName: "star.lefthalf.fill")
            }
            ForEach(0..<emptyCount, id: \.self) { _ in
                star(starName: "star")
            }
        }
    }
    
    @ViewBuilder
    private func star(starName: String) -> some View {
        Image(systemName: starName)
            .resizable()
            .foregroundColor(color)
            .frame(width: 18, height: 18)
    }
}
