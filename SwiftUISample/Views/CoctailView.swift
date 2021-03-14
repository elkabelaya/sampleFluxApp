//
//  CoctailView.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 14.03.2021.
//
import SwiftUI

struct CoctailView: View {
    let coctailModel: CoctailModel
    var body: some View {
        VStack(spacing:100){
            Text(coctailModel.name).font(.largeTitle)
            Text(coctailModel.description)
        }
    }
}
