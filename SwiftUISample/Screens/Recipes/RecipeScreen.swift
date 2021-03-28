//
//  SwiftUIView.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 28.03.2021.
//

import SwiftUI
import SwiftUIComponents
import Networking

struct RecipeCell: View {
    
    @EnvironmentObject var recipePuppyViewModel: RecipePuppyViewModel
    
    var item: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Text( item.title.asStringOrEmpty.trim())
                .font(.headline)
            Text(item.ingredients.asStringOrEmpty.trim())
                .font(.callout)
                .foregroundColor(.gray)
            if recipePuppyViewModel.isPageLoading && recipePuppyViewModel.items.isLast(item) {
                Divider()
                HStack {
                    Spacer()
                    ActivityIndicatorView()
                    Spacer()
                }
                
            }
        }
    }
    
}

struct RecipeScreen: View {
    
    @StateObject var recipePuppyViewModel: RecipePuppyViewModel = .init()
    
    var body: some View {
        NavigationView {
            List(recipePuppyViewModel.items) { item in
                
                    NavigationLink(destination: RecipeDetailScreen()) {
                        RecipeCell(item: item)
                            .environmentObject(recipePuppyViewModel)
                            .onAppear() {
                                if recipePuppyViewModel.items.isLast(item) {
                                    recipePuppyViewModel.loadPage()
                                }
                            }
                    }//NavigationLink
                    

            } // List
            .navigationTitle("Recipes")
            .onAppear() {
                recipePuppyViewModel.loadPage()
            }
        }
    }
}

struct RecipeDetailScreen: View {
 
    var body: some View {
        Text("🥗")
            .font(Font.system(size: 200))
    }
    
}

struct RecipeScreen_Previews: PreviewProvider {
    static var previews: some View {
        RecipeScreen()
    }
}
