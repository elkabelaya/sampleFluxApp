//
//  AnyTransition.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 27.03.2021.
//

import SwiftUI

extension AnyTransition {
    
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading).combined(with: .opacity)
        let removal = AnyTransition.scale.combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
}
