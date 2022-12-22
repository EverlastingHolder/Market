import SwiftUI

struct SelectCategoryView: View {
    @State
    var isTap: Bool = false
    
    @State
    var image: [SelectCategoryModel] = [
        SelectCategoryModel(id: 0, name: "Phone"),
        SelectCategoryModel(id: 1, name: "Computer"),
        SelectCategoryModel(id: 2, name: "Health"),
        SelectCategoryModel(id: 3, name: "Book")
    ]
    
    var body: some View {
        VStack {
            TitleView(title: "Select Category", detail: "view all")
                .padding(.leading, 17)
                .padding(.trailing, 33)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(image, id: \.id) { item in
                        SelectCategoryIconView(isTap: $isTap, name: item.name, id: item.id)
                    }
                }.padding(.leading, 4)
            }
        }
    }
}
