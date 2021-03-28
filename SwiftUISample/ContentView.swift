//
//  ContentView.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 12.03.2021.
//

import SwiftUI


struct ContentView: View {
    
    @EnvironmentObject var tabRouter:TabRouter
    var body: some View {
        TabView(selection: $tabRouter.currentTab){
            MainScreen()
                .tabItem {
                    Text("Main")
                    Image(systemName: "house.circle.fill")
                }.tag(TabRoute.main)
            CoctailsScreen()
                .tabItem {
                    Text("Coctail")
                    Image(systemName:"magnifyingglass.circle.fill")
                }.tag(TabRoute.coctail)
            CatalogScreen()
                .tabItem {
                    Text("Catalog")
                    Image(systemName:"folder.circle.fill")
                }.tag(TabRoute.catalog)
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

