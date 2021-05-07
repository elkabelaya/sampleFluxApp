//
//  GeometryFXModalView.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 28.03.2021.
//

import SwiftUI

struct GeometryFXModal: View {
    
    @State var isGeometryAnimated: Bool = false
    
    func configureEffect(diameter: CGFloat) -> some GeometryEffect {
        OrbitEffect(percent: isGeometryAnimated ? 1 : 0.0, radius: diameter / 2)
    }
    
    var card: some View {
        VStack {
            Text("How to present a\u{00a0}full\nscreen modal view\nusing fullScreenCover()")
                .frame(minHeight: 100)
                .lineLimit(3)
                .multilineTextAlignment(.center)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                
        }
    }
    
    var body: some View {
        card
            .modifier(configureEffect(diameter: 100))
            .onTapGesture {
                withAnimation(Animation.linear(duration: 1).repeatCount(3, autoreverses: true)) {
                    isGeometryAnimated.toggle()
                }
            }
    }
}

struct OrbitEffect: GeometryEffect {
    
    let initialAngle: CGFloat = 0
    
    var percent: CGFloat = 0
    let radius: CGFloat
    
    var animatableData: CGFloat {
        get { return percent }
        set { percent = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let angle = 2 * .pi * percent + initialAngle
        let pt = CGPoint(
            x: cos(angle) * radius,
            y: sin(angle) * radius)
        return ProjectionTransform(CGAffineTransform(translationX: pt.x, y: pt.y))
    }
}

struct GeometryFXModal_Previews: PreviewProvider {
    static var previews: some View {
        GeometryFXModal()
    }
}

