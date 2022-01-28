//
//  AccountView.swift
//  Origami
//
//  Created by Misha Causur on 25.12.2021.
//

import SwiftUI

struct AccountView: View {
    @State var isPinned = false
    var body: some View {
        NavigationView {
            List {
                profile
                menu
                links
                Text("Выйти")
            }
            .navigationTitle("Профиль")
        }
    }
    
    var profile: some View {
        VStack(spacing: 10) {
            Image(systemName: "person.crop.circle.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .white.opacity(0.5))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
//                .background(
//                    HexagonView()
//                        .offset(x: -50, y: -100)
//                )
//                .background(
//                    HexagonView()
//                        .offset(x: 130, y: 150)
//                )
                .background(
                    BlobView()
                        .offset(x: 60, y: 120)
                        .frame(width: 100, height: 100)
                        .padding()
                    )
            Text("Миша Козырь")
                .font(.headline.weight(.black))
            Text("Эксперт")
                .foregroundColor(.secondary)
                .font(.footnote.weight(.regular))
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    var menu: some View {
        Section {
            NavigationLink(destination: ContentView()) {
                Label("Настройки", systemImage: "gear")
            }
            NavigationLink {  } label: {
                Label("Баланс", systemImage: "creditcard")
            }
            NavigationLink { Text("Страница в разработке") } label: {
                Label("Управление профилем", systemImage: "questionmark")
            }
        }
        .accentColor(.secondary)
        .listRowSeparator(.hidden)
    }
    
    var links: some View {
        Section {
            HStack {
                Link(destination: URL(string: "https://apple.com")!) {
                    Label("Перейти на сайт", systemImage: "house")
                }
                Spacer()
                Image(systemName: "link")
                    .foregroundColor(.secondary)
            }
            .swipeActions {
                Button { } label: {
                    Label("Спрятать", systemImage: "eye.slash.fill")
                }
                .tint(.blue)
                Button { isPinned.toggle() } label: {
                    if isPinned {
                        Label("Открепить", systemImage: "pin.slash")
                    }
                    Label("Закрепить", systemImage: "pin")
                }
                .tint(isPinned ? .yellow : .green)
                
            }
            HStack {
                Link(destination: URL(string: "https://apple.com")!) {
                    Label("Перейти в блог", systemImage: "tv")
                }
                Spacer()
                Image(systemName: "link")
                    .foregroundColor(.secondary)
            }
        }
        .listRowSeparator(.hidden)
        .foregroundColor(.primary)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
