//
//  ContentView.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 12.03.2021.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        TabView() {
            MainScreen()
                .tabItem {
                    Text("Main")
                    Image(systemName: "house.circle.fill")
                }
            RecipeScreen()
                .tabItem {
                    Text("Recipe")
                    Image(systemName:"book.circle.fill")
                }
            AboutScreen()
                .tabItem {
                    Text("About")
                    Image(systemName:"questionmark.circle.fill")
                }
            
            
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

