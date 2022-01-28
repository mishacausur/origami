//
//  Card.swift
//  Origami
//
//  Created by Misha Causur on 02.01.2022.
//

import SwiftUI

struct Card: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    @State var appear = [false, false, false]
    var body: some View {
        ZStack {
            ScrollView {
                ZStack {
                    cover
                        .onTapGesture {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                show.toggle()
                            }
                        }
                    button
                }
            }
            .background(Color("Background"))
            .ignoresSafeArea()
        }
        .onAppear {
            appear[0] = true
            appear[1] = true
            appear[2] = true
        }
    }
    
    var cover: some View {
        VStack {
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .background(
            Image("foreground1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "color", in: namespace))
        .mask {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        }
        .overlay(
            VStack(alignment: .leading, spacing: 12) {
                Text("Когда-то давно ипотеку боялись все...")
                    .font(.footnote)
                Text("Когда кончится ипотека?")
                    .font(.title.weight(.bold))
                    .matchedGeometryEffect(id: "subject", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Аналитический разбор")
                    .matchedGeometryEffect(id: "object", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                HStack {
                    Image("ok")
                        .resizable()
                        .frame(width: 26, height: 25)
                        .padding(4)
                        .background(.ultraThinMaterial, in:
                                        RoundedRectangle(cornerRadius: 10, style: .continuous))
                    Text("Автор: И. Иванов")
                        .font(.headline.weight(.semibold))
                        .matchedGeometryEffect(id: "riscs", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
            }
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .mask {
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                        }
                        .matchedGeometryEffect(id: "blur", in: namespace)
                )
                .offset(y: 250)
                .padding(20)
        )
        .shadow(radius: /*@START_MENU_TOKEN@*/30/*@END_MENU_TOKEN@*/)
    }
    
    
    var button: some View {
        Button {
            withAnimation(.closeCard) {
                show.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(.top, 60)
        .padding(.trailing, 20)
    }
}

struct OpenCardView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        Card(namespace: namespace, show: .constant(true))
    }
}
