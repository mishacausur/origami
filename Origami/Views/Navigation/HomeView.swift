//
//  HomeView.swift
//  Origami
//
//  Created by Misha Causur on 01.01.2022.
//

import SwiftUI

struct HomeView: View {
    @Namespace var namespace
    @State var show = false
    @State var isScrolled = false
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {
                scrollDetection
                featured()
                Text("Интересное".uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 26)
                if !show {
                    CardItem(namespace: namespace, show: $show)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                                show.toggle()
                            }
                        }
                }
                Color.clear.frame(height: 1000)
            }
            .background(
                BlobView()
                    .offset(x: 250, y: -220)
                    .frame(width: 100, height: 100)
                    .padding()
                )
            .background(
                OneMoreBlob()
                    .offset(x: -300, y: 20)
                    .frame(width: 100, height: 100)
                    .padding()
                )
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear
                    .frame(height: 70)
            })
            .overlay(
                NavigationBar(isScrolled: $isScrolled, title: "Featured")
            )
            if show {
                OpenCardView(namespace: namespace, show: $show)
            }
            
        }
    
    }
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: ScrollHeight.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .onPreferenceChange(ScrollHeight.self) { value in
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                if value < 0 {
                    isScrolled = true
                } else {
                    isScrolled = false
                }
            }
        }
        .frame(height: 0)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct featured: View {
    var body: some View {
        TabView {
            ForEach(modules) { item in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    FeaturedView(section: item)
                        .padding(.vertical, 40)
                        .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                        .shadow(radius: 10)
                        .blur(radius: abs(minX) / 40)
                        .overlay {
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 230)
                                .offset(x: 30, y: -80)
                                .offset(x: minX / 2)
                                .blur(radius: abs(minX) / 80)
                        }
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 370)
        //        .background(Image("Blob 1").offset(x: 250, y: -100))
    }
}