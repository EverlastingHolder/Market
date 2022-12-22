import SwiftUI
import Combine

struct CarouselView: View {
    @StateObject
    var viewModel: CarouselViewModel = .init()
    @State
    private var selectedIndex = 0
    @State
    private var selectedColorIndex = 0
    
    private let titles: [String] = ["Shop", "Details", "Features"]
    private var specifications: [String: String] {
        [
            "CPU": viewModel.model?.CPU ?? "",
            "Camera": viewModel.model?.camera ?? "",
            "Memory": viewModel.model?.sd ?? "",
            "SSD": viewModel.model?.ssd ?? ""
        ]
    }
    
    private var colors: [SelectedColorModel] {
        var arr: [SelectedColorModel] = []
        for i in 0..<viewModel.model!.color.count {
            arr.append(
                .init(
                    color: Color.init(
                        hex: viewModel.model?.color[i] ?? ""
                    )!,
                    id: i
                )
            )
        }
        return arr
    }
    
    private var capacity: [SelectedButtonModel] {
        var arr: [SelectedButtonModel] = []
        for i in 0..<viewModel.model!.capacity.count {
            arr.append(
                .init(
                    id: i,
                    textButton: viewModel.model?.capacity[i] ?? ""
                )
            )
        }
        return arr
    }
    
    @State
    private var selectedButton: SelectedButtonModel = .init(id: 0, textButton: "")
    
    @State
    private var selectedColor: SelectedColorModel = .init(color: .darkBlue, id: 0)
    
    var body: some View {
        ZStack {
            Color.backgorund
                .ignoresSafeArea()
            if viewModel.model == nil {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                VStack(spacing: 0) {
                    CarouselDetailView(links: viewModel.model!.links)
                        .padding(.bottom, 14)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(alignment: .center) {
                            Text(viewModel.model!.title)
                                .customFont(fontSize: 24, fontWeight: .medium)
                                .foregroundColor(.darkBlue)
                            
                            Spacer(minLength: 0)
                            
                            Image(viewModel.model!.isFavorites ? "FillHeart" : "Heart")
                                .padding(10)
                                .frame(minWidth: 11, minHeight: 11)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.darkBlue)
                                )
                                .onTapGesture {
                                    viewModel.model?.isFavorites.toggle()
                                }
                                .padding([.top, .trailing], 8)
                            
                        }
                        .padding(.horizontal, 38)
                        
                        HStack {
                            StarsView(rating: viewModel.model!.rating)
                            Spacer()
                        }
                        .padding(.horizontal, 38)
                        
                        SegmentedControlView(selectedIndex: $selectedIndex, titles: titles)
                            .padding(.horizontal, 30)
                        
                        HStack {
                            ForEach(specifications.sorted(by: <), id: \.key) { (key, value) in
                                Spacer()
                                VStack {
                                    Image(key)
                                    Text(value)
                                        .foregroundColor(.subtitleText)
                                        .customFont(fontSize: 11, fontWeight: .regular)
                                }
                                Spacer()
                            }
                        }
                        .padding(EdgeInsets(top: 25, leading: 30, bottom: 0, trailing: 40))
                        
                        VStack(alignment: .leading) {
                            Text("Select color and capacity")
                                .foregroundColor(.darkBlue)
                                .customFont(fontSize: 16, fontWeight: .medium)
                            
                            HStack {
                                selectedColorView(selectedColor: $selectedColor, colors: colors)
                                Spacer(minLength: 0)
                                selectedMemoryButtonView(selectedButton: $selectedButton, item: capacity)
                            }
                            
                        }
                        .padding(EdgeInsets(top: 25, leading: 0, bottom: 0, trailing: 0))
                        
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                    )
                    Spacer()
                }
            }
        }
    }
    
    private struct SelectedButtonModel: Hashable {
        var id: Int
        var textButton: String
    }
    
    private struct SelectedColorModel: Hashable {
        var color: Color
        var id: Int
    }
    
    @ViewBuilder
    private func selectedMemoryButtonView(
        selectedButton: Binding<SelectedButtonModel>,
        item: [SelectedButtonModel]
    ) -> some View {
        HStack {
            ForEach(item, id: \.self) { item in
                Button(action: {
                    withAnimation {
                        self.selectedButton.id = item.id
                    }
                }) {
                    Text(item.textButton)
                        .foregroundColor(
                            item.id == self.selectedButton.id ?
                            .white
                            :
                            .init(hex: "#8D8D8D")
                        )
                        .customFont(fontSize: 13, fontWeight: .bold)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 8)
                }
                .backgroundColor(
                    item.id == self.selectedButton.id ?
                    .darkOrange
                    :
                    .clear
                )
                .cornerRadius(10)
            }
        }
    }
    
    @ViewBuilder
    private func selectedColorView(
        selectedColor: Binding<SelectedColorModel>,
        colors: [SelectedColorModel]
    ) -> some View {
        HStack(spacing: 0) {
            ForEach(colors, id: \.self) { item in
                Circle()
                    .frame(maxWidth: 40)
                    .overlay {
                        overlayView(item: item)
                    }
                    .foregroundColor(item.color)
                    .onTapGesture {
                        self.selectedColor.id = item.id
                    }
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    private func overlayView(item: SelectedColorModel) -> some View {
        if item.id != self.selectedColor.id {
            EmptyView()
        } else {
            Image("Checkmark")
                .foregroundColor(.white)
        }
    }
}
