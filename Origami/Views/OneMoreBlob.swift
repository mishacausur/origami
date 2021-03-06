//
//  OneMoreBlob.swift
//  Origami
//
//  Created by Misha Causur on 02.01.2022.
//

import SwiftUI

struct OneMoreBlob: View {
    @State var appear = false
    var body: some View {
        TimelineView(.animation) { timeline in
            let now = timeline.date.timeIntervalSinceReferenceDate
            let angle = Angle.degrees(now.remainder(dividingBy: 3) * 30)
            let x = cos(angle.radians)
            let angle2 = Angle.degrees(now.remainder(dividingBy: 4) * 10)
            let x2 = cos(angle2.radians)
            Canvas { context, size in
                context.fill(path(in: CGRect(x: 0, y: 0, width: size.width, height: size.height), x: x, x2: x2), with: .linearGradient(Gradient(colors: [.purple, .blue, .teal]), startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 400, y: 400)))
            }
            .frame(width: 350, height: 366)
            .rotationEffect(.degrees(appear ? 360 : 0))
            .padding()
        }
        .onAppear {
            withAnimation(.linear(duration: 20).repeatForever(autoreverses: true) ) {
                appear = true
            }
        }
        
    }
    
    func path(in rect: CGRect, x: Double, x2: Double) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.9923*width, y: 0.42593*height))
        path.addCurve(to: CGPoint(x: 0.6355*width*x, y: height), control1: CGPoint(x: 0.92554*width*x2, y: 0.77749*height*x2), control2: CGPoint(x: 0.91864*width*x2, y: height))
        path.addCurve(to: CGPoint(x: 0.08995*width, y: 0.60171*height), control1: CGPoint(x: 0.35237*width*x2, y: height), control2: CGPoint(x: 0.2695*width, y: 0.77304*height))
        path.addCurve(to: CGPoint(x: 0.34086*width, y: 0.06324*height*x), control1: CGPoint(x: -0.0896*width, y: 0.43038*height), control2: CGPoint(x: 0.00248*width, y: 0.23012*height*x))
        path.addCurve(to: CGPoint(x: 0.9923*width, y: 0.42593*height), control1: CGPoint(x: 0.67924*width, y: -0.10364*height*x2), control2: CGPoint(x: 1.05906*width, y: 0.07436*height*x))

        path.closeSubpath()
        return path
    }
}

struct OneMoreBlob_Previews: PreviewProvider {
    static var previews: some View {
        OneMoreBlob()
    }
}

struct OneMoreBlobShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: width, y: 0.52015*height))
        path.addCurve(to: CGPoint(x: 0.36458*width, y: 0.97733*height), control1: CGPoint(x: width, y: 0.85894*height), control2: CGPoint(x: 0.72917*width, y: 1.07053*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.36902*height), control1: CGPoint(x: 0, y: 0.88413*height), control2: CGPoint(x: 0, y: 0.61664*height))
        path.addCurve(to: CGPoint(x: 0.47917*width, y: 0.01008*height), control1: CGPoint(x: 0, y: 0.17129*height), control2: CGPoint(x: 0.14931*width, y: -0.04156*height))
        path.addCurve(to: CGPoint(x: width, y: 0.52015*height), control1: CGPoint(x: 0.80903*width, y: 0.06172*height), control2: CGPoint(x: width, y: 0.27253*height))
        path.closeSubpath()
        return path
    }
}

