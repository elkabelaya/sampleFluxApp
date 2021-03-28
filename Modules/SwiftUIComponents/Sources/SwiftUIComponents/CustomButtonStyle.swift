//
//  CustomButtonStyle.swift
//  
//
//  Created by Elka Belaya on 28.03.2021.
//
import SwiftUI
public struct WhiteButton: ButtonStyle {
    public init() {}
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title3)
            .padding()
            .frame(width: 140)
            .background(Color.white)
            .foregroundColor(.gray)
            .compositingGroup()
            .shadow(color: .black, radius: 3)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
    
}
