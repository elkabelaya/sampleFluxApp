//
//  CatalogScreen.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 16.03.2021.
//

import SwiftUI
import UIComponents

struct CatalogScreen: View {
    
    var body: some View {
        CustomButton (action:{
            print("custom button")
        }){
            Text("custom button")
        }
    }
}

struct CatalogScreen_Previews: PreviewProvider {
    static var previews: some View {
        CatalogScreen()
    }
}
