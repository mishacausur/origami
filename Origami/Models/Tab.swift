//
//  Tab.swift
//  Origami
//
//  Created by Misha Causur on 26.12.2021.
//

import Foundation
import SwiftUI

struct Tab: Identifiable {
    var id: UUID = UUID()
    var image: String
    var text: String
    var tabItem: TabItems
    var color: Color
}

var tabItems = [
    Tab(image: "house", text: "Главная", tabItem: .home, color: .teal),
    Tab(image: "magnifyingglass", text: "Поиск", tabItem: .search, color: .blue),
    Tab(image: "heart", text: "Избранное", tabItem: .favourite, color: .orange),
    Tab(image: "person", text: "Профиль", tabItem: .profile, color: .pink)]

enum TabItems: String {
    case home
    case search
    case favourite
    case profile
}

struct TabWidth: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct ScrollHeight: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
