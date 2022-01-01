//
//  CardItem.swift
//  Origami
//
//  Created by Misha Causur on 02.01.2022.
//

import SwiftUI

struct CardItem: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 12) {
                Text("Когда кончится ипотека?")
                    .font(.title.weight(.bold))
                    .matchedGeometryEffect(id: "subject", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Аналитический разбор")
                    .matchedGeometryEffect(id: "object", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Автор: И. Иванов")
                    .font(.headline.weight(.semibold))
                    .matchedGeometryEffect(id: "riscs", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                    }
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "blur", in: namespace)
            )
            
        }
        .foregroundStyle(.white)
        .background(
            Image("foreground1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "color", in: namespace))
        .mask {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        }
        .frame(height: 300)
        .padding(20)
        .shadow(radius: 10)
    }
}

struct CardItem_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CardItem(namespace: namespace, show: .constant(false))
    }
}
