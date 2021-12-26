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
}

var tabItems = [
    Tab(image: "house", text: "Главная", tabItem: .home),
    Tab(image: "magnifyingglass", text: "Поиск", tabItem: .search),
    Tab(image: "heart", text: "Избранное", tabItem: .favourite),
    Tab(image: "person", text: "Профиль", tabItem: .profile)]

enum TabItems {
    case home
    case search
    case favourite
    case profile
}
