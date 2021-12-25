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
                    Spacer()
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Иванов Иван Иванович")
                            .font(.headline)
                            .matchedGeometryEffect(id: "subject", in: namespace)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("66:41:0205009:1393 ")
                            .matchedGeometryEffect(id: "object", in: namespace)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Рисков нет")
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
                    Image("back")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: "color", in: namespace))
                .mask {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .matchedGeometryEffect(id: "mask", in: namespace)
                }
                .frame(height: 300)
                .padding(20)
            } else {
                ScrollView {
                    VStack {
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 500)
                    .background(
                        Image("back")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .matchedGeometryEffect(id: "color", in: namespace))
                    .mask {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .matchedGeometryEffect(id: "mask", in: namespace)
                    }
                    .overlay(
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Дата проверки: 20 декабря 2021 года")
                                .font(.footnote)
                            Text("Иванов Иван Иванович")
                                .font(.headline)
                                .matchedGeometryEffect(id: "subject", in: namespace)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("66:41:0205009:1393 ")
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
                                Text("Рисков нет")
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
                }
                .ignoresSafeArea()
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
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
