//
//  BindingExtension.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 13.03.2021.
//
import SwiftUI

#if DEBUG
extension Binding {
    static func mock(_ value: Value) -> Self {
        var value = value
        return Binding(get: { value }, set: { value = $0 })
    }
}
#endif
