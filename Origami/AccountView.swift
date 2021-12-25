//
//  AccountView.swift
//  Origami
//
//  Created by Misha Causur on 25.12.2021.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            List {
                VStack(spacing: 10) {
                    Image(systemName: "person.crop.circle.badge.checkmark")
                        .symbolVariant(.circle.fill)
                        .font(.system(size: 32))
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.blue, .blue.opacity(0.6))
                        .padding()
                        .background(Circle().fill(.ultraThinMaterial))
                        .background(
                            Image(systemName: "hexagon")
                                .font(.system(size: 200))
                                .symbolVariant(.fill)
                                .foregroundColor(.blue)
                                .offset(x: -50, y: -100)
                        )
                        .background(
                            Image(systemName: "hexagon")
                                .font(.system(size: 200))
                                .symbolVariant(.circle)
                                .foregroundColor(.blue)
                                .offset(x: 130, y: 150)
                        )
                    Text("Миша Козырь")
                        .font(.headline.weight(.black))
                    Text("Эксперт")
                        .foregroundColor(.secondary)
                        .font(.footnote.weight(.regular))
                }
                .frame(maxWidth: .infinity)
                .padding()
                Section {
                    NavigationLink(destination: ContentView()) {
                        Label("Настройки", systemImage: "gear")
                    }
                    NavigationLink { ContentView() } label: {
                        Label("Баланс", systemImage: "creditcard")
                    }
                    NavigationLink { Text("Страница в разработке") } label: {
                        Label("Управление профилем", systemImage: "questionmark")
                    }
                }
                .accentColor(.secondary)
                .listRowSeparator(.hidden)
                Section {
                    HStack {
                        Link(destination: URL(string: "https://apple.com")!) {
                            Label("Перейти на сайт", systemImage: "house")
                        }
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
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
                Text("Выйти")
            }
            .navigationTitle("Профиль")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
