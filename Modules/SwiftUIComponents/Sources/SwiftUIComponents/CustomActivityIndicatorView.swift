//
//  ActivityIndicatorView.swift
//  SwiftUIAppNav
//
//  Created by Elka Belaya on 28.03.2021.
//

import UIKit
import SwiftUI

public struct CustomActivityIndicatorView: UIViewRepresentable {
    
    public init() {}
    
    public func makeUIView(context: UIViewRepresentableContext<CustomActivityIndicatorView>) -> UIActivityIndicatorView {
        UIActivityIndicatorView(style: .large)
    }
    
    public func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<CustomActivityIndicatorView>) {
        uiView.startAnimating()
    }
}


struct ActivityIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Preview")
            CustomActivityIndicatorView()
        }
    }
}

