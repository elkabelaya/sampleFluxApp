//
//  CoctailListNavigationCell.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 14.03.2021.
//
import SwiftUI
struct CoctailListNavigationCell: View {
    let coctailModel: CoctailModel
    @State var selected: Int? = 0
    
    var body: some View {
        NavigationLink(
            destination: CoctailView(coctailModel: coctailModel),
            tag: 1,
            selection: $selected,
            label: {
                Text(coctailModel.name)
            }
        )
    }
}
