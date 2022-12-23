import SwiftUI

struct CustomToolBarModifier: ViewModifier {
    @Environment(\.presentationMode) var isPresented
    var titleText: String
    var imageName: String
    var trailingButtonText: String
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(titleText)
                        .foregroundColor(.darkBlue)
                        .customFont(fontSize: 18, fontWeight: .medium)
                }
                ToolbarItem {
                    HStack {
                        Text(trailingButtonText)
                            .customFont(fontSize: 15, fontWeight: .medium)
                            .foregroundColor(.darkBlue)
                        Button(action: {}) {
                            Image(imageName)
                                .resizable()
                                .frame(width: 13, height: 14)
                                .padding(EdgeInsets(top: 6, leading: 4, bottom: 6, trailing: 12))
                        }
                        .backgroundColor(.darkOrange)
                        .cornerRadius(10)
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.isPresented.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 7, height: 14)
                            .padding(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 6))
                            .foregroundColor(.white)
                    }
                    .backgroundColor(.darkBlue)
                    .cornerRadius(10)
                }
            }
    }
}

