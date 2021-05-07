//
//  FilterView.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 14.03.2021.
//
import SwiftUI
public struct CustomFilterView: View {
    @Binding var filterValue:Bool
    private var filterText:String
    
    public init(filterValue:Binding<Bool>, filterText:String){
        self._filterValue = filterValue
        self.filterText = filterText
    }
    
    public var body:some View{
        Toggle(isOn: $filterValue) {
            Text(filterText)
        }
    }
}
