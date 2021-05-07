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
                    CustomActivityIndicatorView()
                    Spacer()
                }
                
            }
        }
    }
    
}

struct RecipeButtonView: View {
    let text: String
    let onTapGesture: () -> Void
    var body: some View {
        Text(text)
            .padding()
            .background(Color.orange)
            .foregroundColor(Color.white)
            .onTapGesture {
                onTapGesture()
            }
    }
}


struct RecipeScreen: View {
    private var pickerElements = ["salad",
                                  "soup",
                                  "baking"]
    @State private var selectedCategoryIndex = 0
    @StateObject var recipePuppyViewModel: RecipePuppyViewModel = .init()

    var body: some View {
        NavigationView {
            VStack {
                Picker("Favorite Color", selection: $selectedCategoryIndex, content: {
                    ForEach(0..<pickerElements.count) { i in
                        Text(pickerElements[i]).tag(i)
                    }
                })
                .pickerStyle(SegmentedPickerStyle())
                .onAppear(){
                    recipePuppyViewModel.loadRecipes(category: pickerElements[selectedCategoryIndex])
                }
                .onChange(of: selectedCategoryIndex, perform: { (value) in
                    recipePuppyViewModel.loadRecipes(category: pickerElements[value])
                })
                if (recipePuppyViewModel.isPageLoading){
                    CustomActivityIndicatorView()
                } 
                List(recipePuppyViewModel.items) { item in
                    
                        NavigationLink(destination: RecipeDetailScreen()) {
                            RecipeCell(item: item)
                                .environmentObject(recipePuppyViewModel)
                                .onAppear() {
                                    if recipePuppyViewModel.items.isLast(item) {
                                        recipePuppyViewModel.loadNextPage()
                                    }
                                }
                        }//NavigationLink
                        

                } // List
                .navigationBarTitle("Recipes")
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
