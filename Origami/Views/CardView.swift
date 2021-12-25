//
//  CardView.swift
//  Origami
//
//  Created by Misha Causur on 25.12.2021.
//

import SwiftUI

struct CardView: View {
    @Namespace var namespace
    @State var show = false
    var body: some View {
        ZStack {
            if !show {
                Text("Иванов Иван Иванович")
                    .matchedGeometryEffect(id: "user", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
            } else {
                Text("Иванов Иван Иванович")
                    .matchedGeometryEffect(id: "user", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .onTapGesture {
            withAnimation {
                show.toggle()
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
