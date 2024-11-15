//
//  Usen.swift
//  Origami
//
//  Created by Misha Causur on 01.01.2022.
//

import SwiftUI

struct Usen: View {
    @State var isTepped = false
    @State private var showingCredits = false
    @Namespace var namespace
    var body: some View {
        VStack(alignment: .leading) {
            if !isTepped {
                HStack {
                    Text("Hello, Misha!")
                        .matchedGeometryEffect(id: "text", in: namespace)
                    Spacer()
                    RoundedRectangle(cornerRadius: 30).fill(Color.red)
                        .frame(width: 22, height: 22)
                        .matchedGeometryEffect(id: "shape", in: namespace)
                }
                .padding()
            } else {
                HStack {
                    RoundedRectangle(cornerRadius: 30).fill(Color.red)
                        .frame(width: 22, height: 22)
                        .matchedGeometryEffect(id: "shape", in: namespace)
                    Spacer()
                    Text("Hello, Misha")
                        .matchedGeometryEffect(id: "text", in: namespace)
                }
                .padding()
            }
            Spacer()
            
            Button(action: { showingCredits.toggle() }) {
                RoundedRectangle(cornerRadius: 34, style: .continuous)
                    .frame(height: 66)
                    .padding()
            }
        }
        .sheet(isPresented: $showingCredits) {
            AllView()
                       // .presentationDetents([.medium, .large])
                }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                isTepped.toggle()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    
      
    }
}

struct Usen_Previews: PreviewProvider {
    static var previews: some View {
        Usen()
    }
}

struct AllView: View {
    var body: some View {
        VStack {
            Color.clear.frame(height: 100)
            Spacer()
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.red)
        }
        .background(.clear)
    }
}
