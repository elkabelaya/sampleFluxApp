//
//  Image.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 28.03.2021.
//
import SwiftUI
extension Image {
    func imageFill() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}
