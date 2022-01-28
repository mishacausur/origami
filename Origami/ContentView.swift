//
//  ContentView.swift
//  Origami
//
//  Created by Misha Causur on 25.12.2021.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedItem") var selectedItem: TabItems = .home
    var body: some View {
        ZStack(alignment: .bottom) {
                switch selectedItem {
                case .home:
                    HomeView()
                case .search:
                    AccountView()
                case .favourite:
                    AccountView()
                case .profile:
                    HexagonView()
                }
            TabBar()
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear
                .frame(height: 44)
        }
        
    }
       
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
