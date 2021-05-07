//
//  AnimationModalScreen.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 28.03.2021.
//

import SwiftUI

struct AnimationModal: View {
    
    @State var airplaneScale: Bool = false
    @State var airplaneColor: Bool = false
    
    var body: some View {
        VStack {
            
            Image(systemName: "airplane")
                .font(Font.system(size: 100))
                .scaleEffect(airplaneScale ? 3.0 : 1.0)
                .animatingForegroundColor(from: .blue, to: .yellow, percentToColor: airplaneColor ? 1 : 0)
                .animation(.easeInOut(duration: 1.0), value: airplaneColor)
                .animation(.easeInOut(duration: 1.0), value: airplaneScale)
                .onTapGesture {
                    airplaneScale.toggle()
                    airplaneColor.toggle()
                }
            
        }
    }
}

extension View {
    func animatingForegroundColor(from: Color, to: Color, percentToColor: Double) -> some View {
        return self
            .modifier(ColorAnimation(from: from, to: to, percentToColor: percentToColor))
    }
}

private struct ColorAnimation: AnimatableModifier {
    
    var animatableData: Double
    private let rgbaPair: [(Double, Double)]

    init(from: Color, to: Color, percentToColor: Double) {
        animatableData = percentToColor
        let fromComponents = UIColor(from).cgColor.components!
        let toComponents = UIColor(to).cgColor.components!
        rgbaPair = Array(zip(fromComponents.map(Double.init), toComponents.map(Double.init)))
    }

    func body(content: Content) -> some View {
        content
            .foregroundColor(mixedColor)
    }

    // This is a very basic implementation of a color interpolation between two values.
    private var mixedColor: Color {
        let rgba = rgbaPair.map { $0.0 + ($0.1 - $0.0) * animatableData }
        return Color(red: rgba[0], green: rgba[1], blue: rgba[2], opacity: rgba[3])
    }
}

struct AnimationModal_Previews: PreviewProvider {
    static var previews: some View {
        AnimationModal()
    }
}
