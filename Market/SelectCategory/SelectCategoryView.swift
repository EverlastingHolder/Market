import SwiftUI

struct SelectCategoryView: View {
    private var item: [SelectCategoryModel] = [
        SelectCategoryModel(id: 0, name: "Phone"),
        SelectCategoryModel(id: 1, name: "Computer"),
        SelectCategoryModel(id: 2, name: "Health"),
        SelectCategoryModel(id: 3, name: "Book")
    ]
    
    @State
    private var selectedCategory: SelectCategoryModel = .init(id: 0, name: "")
    
    var body: some View {
        VStack {
            TitleView(title: "Select Category", detail: "view all")
                .padding(.leading, 17)
                .padding(.trailing, 33)
            
            ScrollView(.horizontal, showsIndicators: false) {
                selectCategoryIconView(selectedItem: $selectedCategory, items: item)
            }
        }
    }
    
    @ViewBuilder
    private func selectCategoryIconView(
        selectedItem: Binding<SelectCategoryModel>,
        items: [SelectCategoryModel]
    ) -> some View {
        HStack {
            ForEach(item, id: \.id) { item in
                Button(action: {
                    withAnimation {
                        self.selectedCategory.id = item.id
                    }
                }) {
                    VStack {
                        Image(item.name)
                            .renderingMode(item.id == self.selectedCategory.id ? .template : .original)
                            .foregroundColor(item.id == self.selectedCategory.id ? .white : .none)
                            .padding()
                            .frame(minWidth: 71, minHeight: 71)
                            .backgroundColor(item.id == self.selectedCategory.id ? .darkOrange : .white)
                            .clipShape(Circle())
                        
                        Text(item.name)
                            .foregroundColor(item.id == self.selectedCategory.id ? .darkOrange : .darkBlue)
                            .customFont(fontSize: 12, fontWeight: .medium)
                    }.padding(.leading, 23)
                }
            }
        }.padding(.leading, 4)
    }
}
