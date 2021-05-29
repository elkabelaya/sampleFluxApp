//
//  ContentView.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 12.03.2021.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var tabRouter:TabRouter = ServiceLocator.assembly.inject()
    
    var body: some View {
        TabView(selection: $tabRouter.currentTab){
            MainScreen()
                .tabItem {
                    Text("Main")
                    Image(systemName: "house.circle.fill")
                }.tag(TabRoute.main)
            RecipeScreen()
                .tabItem {
                    Text("Recipe")
                    Image(systemName:"book.circle.fill")
                }.tag(TabRoute.recipe)
            AboutScreen()
                .tabItem {
                    Text("About")
                    Image(systemName:"questionmark.circle.fill")
                }.tag(TabRoute.about)
            
            
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(TabRouter())
    }
}
#endif

