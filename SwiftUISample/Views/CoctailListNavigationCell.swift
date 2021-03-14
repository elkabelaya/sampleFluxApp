//
//  CoctailListNavigationCell.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 14.03.2021.
//
import SwiftUI
struct CoctailListNavigationCell: View {
    var coctailModel: CoctailModel
    var body: some View {
        
        NavigationLink(
            destination: CoctailView(coctailModel: coctailModel),
            label: {
                Text(coctailModel.name)
            })
    }
}
