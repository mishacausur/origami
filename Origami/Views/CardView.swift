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
                VStack {
                    Text("Иванов Иван Иванович")
                        .font(.headline)
                        .matchedGeometryEffect(id: "subject", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Text("66:41:0205009:1393 ")
                        .matchedGeometryEffect(id: "object", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .foregroundStyle(.white)
                .background(
                    Color.blue.matchedGeometryEffect(id: "color", in: namespace))
            } else {
                VStack {
                    Spacer()
                    Text("Иванов Иван Иванович")
                        .font(.headline)
                        .matchedGeometryEffect(id: "subject", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Text("66:41:0205009:1393 ")
                        .matchedGeometryEffect(id: "object", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .foregroundStyle(.black)
                .background(
                    Color.gray.matchedGeometryEffect(id: "color", in: namespace))
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
