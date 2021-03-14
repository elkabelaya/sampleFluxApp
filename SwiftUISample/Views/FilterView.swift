//
//  FilterView.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 14.03.2021.
//
import SwiftUI
struct FilterView: View {
    @Binding var filterValue:Bool
    var filterText:String
    var body:some View{
        Toggle(isOn: $filterValue) {
            Text(filterText)
        }
    }
}
