//
//  HexagonView.swift
//  Origami
//
//  Created by Misha Causur on 26.12.2021.
//

import SwiftUI

struct HexagonView: View {
    @State var appear = false
    var body: some View {
        ScrollView {
            VStack {
                Canvas { context, size in
                    context.draw(Image(systemName: "hexagon.fill"), in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
                }
                .rotationEffect(.degrees(appear ? 360 : 0))
                .frame(width: 200, height: 212)
                .foregroundStyle(LinearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
            }
            .frame(maxWidth: .infinity)
            .onAppear {
                withAnimation(.linear(duration: 20).repeatForever(autoreverses: true) ) {
                    appear = true
                }
        }
        }
    }
    
}

struct HexagonView_Previews: PreviewProvider {
    static var previews: some View {
        HexagonView()
    }
}
