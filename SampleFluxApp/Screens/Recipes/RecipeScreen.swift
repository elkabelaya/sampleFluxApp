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
    var item: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Text( item.title.trim())
                .font(.headline)
            Text(item.ingredients.asStringOrEmpty.trim())
                .font(.callout)
                .foregroundColor(.gray)
            /*if recipePuppyViewModel.isPageLoading && recipePuppyViewModel.items.isLast(item) {
                Divider()
                HStack {
                    Spacer()
                    CustomActivityIndicatorView()
                    Spacer()
                }
                
            }*/
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
    @State private var firstAppear = true;
    @State private var selectedCategoryIndex = 0
    @State private var navigationLinkSelection:String? = nil
    @EnvironmentObject var recipeStore:RecipeStore

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
                    if (firstAppear){
                        firstAppear = false
                        recipeStore.dispatch(action: .load(pickerElements[selectedCategoryIndex]))
                    }
                }
                .onChange(of: selectedCategoryIndex, perform: { (value) in
                    recipeStore.dispatch(action: .load(pickerElements[value]))
                })
                if (recipeStore.state.loading){
                    CustomActivityIndicatorView()
                } 
                List(recipeStore.state.recipes) { item in
                    
                    NavigationLink(destination: RecipeDetailScreen(recipe: item),
                                   tag: item.id,
                                   selection:$navigationLinkSelection)
                    {
                        RecipeCell(item: item)
                            .onAppear() {
                                if recipeStore.state.recipes.isLast(item) {
                                    recipeStore.dispatch(action: .loadNext)
                                }
                            }
                            .onTapGesture {
                                navigationLinkSelection = item.id
                            }
                    }//NavigationLink
                        

                } // List
                .navigationBarTitle("Recipes")
            }
        }
    }
}

struct RecipeDetailScreen: View {
    let recipe: Recipe
    var body: some View {
        Text(recipe.title)
            .font(Font.system(size: 20))
        Text(recipe.ingredients ?? "")
            .font(Font.system(size: 10))
    }
    
}

struct RecipeScreen_Previews: PreviewProvider {
    static var previews: some View {
        RecipeScreen()
    }
}
