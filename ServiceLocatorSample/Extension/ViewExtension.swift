//
//  ViewExtension.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 24.03.2021.
//
import SwiftUI

extension View {
  @ViewBuilder
  func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform)
  -> some View {
    if condition {
      transform(self)
    } else {
      self
    }
  }
}
