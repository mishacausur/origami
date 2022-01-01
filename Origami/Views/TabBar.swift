//
//  TabBar.swift
//  Origami
//
//  Created by Misha Causur on 26.12.2021.
//

import SwiftUI

struct TabBar: View {
    @State var selectedItem: TabItems = .home
    @State var color: Color = .teal
    @State var width: CGFloat = 0
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedItem {
                case .home:
                    ContentView()
                case .search:
                    AccountView()
                       
                case .favourite:
                    CardView()
                case .profile:
                    HexagonView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            HStack {
                ForEach(tabItems) { item in
                    Button {
                        withAnimation(.spring(response: 0.2, dampingFraction: 0.7)) {
                            selectedItem = item.tabItem
                            color = item.color
                        }
                    } label: {
                        VStack(spacing: 0) {
                            Image(systemName: item.image)
                                .symbolVariant(selectedItem == item.tabItem ? .fill : .none)
                                .font(.body.bold())
                                .frame(width: 44, height: 29)
                            Text(item.text)
                                .font(.caption2)
                                .lineLimit(1)
                        }
                        .frame(maxWidth: .infinity)
                       
                    }
                    .foregroundStyle(selectedItem == item.tabItem ? .primary : .secondary)
                    .blendMode(selectedItem == item.tabItem ? .overlay : .normal)
                    .overlay(
                        GeometryReader{ proxy in
                            Color.clear.preference(key: TabWidth.self, value: proxy.size.width)
                        }
                    )
                    .onPreferenceChange(TabWidth.self) { value in
                        width = value
                    }
                }
            }
            .padding(.top, 14)
            .padding(.horizontal, 8)
            .frame(height: 88, alignment: .top)
            .background(.ultraThinMaterial, in:
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
            )
            .background(
                HStack {
                    if selectedItem == .profile { Spacer() }
                    if selectedItem ==  .search { Spacer() }
                    if selectedItem == .favourite {
                        Spacer()
                        Spacer()
                    }
                    Circle().fill(color).frame(width: width)
                    if selectedItem == .home {
                        Spacer()
                    }
                    if selectedItem == .search {
                        Spacer()
                        Spacer()
                    }
                    if selectedItem == .favourite {
                        Spacer()
                    }
                }
                    .padding(.horizontal, 8)
            )
            .overlay(
                HStack {
                    if selectedItem == .profile { Spacer() }
                    if selectedItem ==  .search { Spacer() }
                    if selectedItem == .favourite {
                        Spacer()
                        Spacer()
                    }
                    RoundedRectangle(cornerRadius: 30, style: .continuous).fill(color).frame(width: 28, height: 3)
                        .frame(width: width)
                        .frame(maxHeight: .infinity, alignment: .top)
                    if selectedItem == .home {
                        Spacer()
                    }
                    if selectedItem == .search {
                        Spacer()
                        Spacer()
                    }
                    if selectedItem == .favourite {
                        Spacer()
                    }
                }
                    .padding(.horizontal, 8)
            )
            .strokeStyle()
            .shadow(radius: 8)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
.previewInterfaceOrientation(.portrait)
    }
}
