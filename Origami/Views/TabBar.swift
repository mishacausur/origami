//
//  TabBar.swift
//  Origami
//
//  Created by Misha Causur on 26.12.2021.
//

import SwiftUI

struct TabBar: View {
    @State var selectedItem: TabItems = .home
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
                        selectedItem = item.tabItem
                    } label: {
                        VStack(spacing: 0.0) {
                            Image(systemName: item.image)
                                .symbolVariant(selectedItem == item.tabItem ? .fill : .none)
                                .font(.body.bold())
                                .frame(width: 80, height: 29)
                            Text(item.text)
                                .font(.caption2)
                                .lineLimit(1)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .foregroundStyle(selectedItem == item.tabItem ? .primary : .secondary)
                    .foregroundColor(.purple)
                }
            }
            .padding(.top, 14)
            .padding(.horizontal, 8)
            .frame(height: 88, alignment: .top)
            .background(.ultraThinMaterial, in:
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
            )
            .background(
                Circle().fill(.pink)).frame(width: 80)
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
    }
}
