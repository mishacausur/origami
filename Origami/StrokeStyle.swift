//
//  StrokeStyle.swift
//  Origami
//
//  Created by Misha Causur on 25.12.2021.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
    @Environment (\.colorScheme) var colorScheme
    func body(content: Content) -> some View {
        content.overlay {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .stroke(
                    .linearGradient(
                        colors: [
                            .white.opacity(colorScheme == .dark ? 0.4 : 0.5),
                            .black.opacity(colorScheme == .dark ? 0.3 : 0.1)
                        ], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .blendMode(.overlay)
        }
    }
}

extension View {
    func strokeStyle() -> some View {
        modifier(StrokeStyle())
    }
}
