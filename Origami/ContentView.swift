//
//  ContentView.swift
//  Origami
//
//  Created by Misha Causur on 25.12.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                Spacer()
                Text("Войти")
                    .font(.largeTitle.weight(.black))
                    .foregroundStyle(.linearGradient(colors: [.pink, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(20)
        .frame(height: 300)
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle()
        .padding(.horizontal, 20)
        .background(Image("Blob 1").offset(x: 150, y: -200))
        .overlay {
            Image("Illustration 3")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 230)
                .offset(x: 30, y: -80)
        }
       
    }
       
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
