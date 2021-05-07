//
//  CoctailsScreen.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 12.03.2021.
//

import SwiftUI
import Combine


struct FoodScreen: View {
    
    @StateObject var viewModel: FoodScreenViewModel = .init()
    @EnvironmentObject var tabRouter: TabRouter
    
    @State var favesShowed: Bool = false
    
    
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Buttons"), footer: Text("Open Me!")) {
                    QuickButtons()
                    HStack {
                        Button(action: { print("Button 1")}) {
                            Text("Button 1")
                        }
                        Button(action: { print("Button 2")}) {
                            Text("Button 2")
                        }
                        Button(action: { print("Button 3")}) {
                            Text("Button 3")
                        }
                    }
                }
                Section(header: Text("Foods")) {
                    FilterView(favesShowed: $favesShowed)
                    ForEach(viewModel.foods) { item in
                        if !favesShowed || item.isFave {
                            FoodListCell(food: item)
                        }
                    }
                }
            } // List
            .navigationTitle("Buttons and Foods")
            .navigationBarTitleDisplayMode(.inline)
            .overlay(NavigationLink(destination: FoodView(emoji: "🥜"),
                                    isActive: $tabRouter.isSuperFoodShowed) {
                EmptyView().hidden()
            })
            .listStyle(SidebarListStyle())
        }
        
    }
    
}

struct QuickButtons: View {
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "function")
                .font(.title3)
                .padding()
                .frame(width: 50, height: 50)
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(8)
                .onTapGesture {
                    print("function")
                }
            Spacer()
            Image(systemName: "airplane")
                .padding()
                .frame(width: 50, height: 50)
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(8)
                .onTapGesture {
                    print("airplane")
                }
            Spacer()
            Image(systemName: "ipod")
                .padding()
                .frame(width: 50, height: 50)
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(8)
                .onTapGesture {
                    print("ipod")
                }
            Spacer()
        }
    }
}

struct FoodListCell: View {
    
    let food: Food
    
    var body: some View {
        NavigationLink(destination: FoodView(emoji: food.emoji)) {
            Text(food.name)
        }
    }
}

struct FoodView: View {
    
    let emoji: String
    
    var body: some View {
        Text(emoji)
            .font(Font.system(size: 200))
    }
}

struct FilterView: View {
    
    @Binding var favesShowed: Bool
    
    var body: some View {
        Toggle(isOn: $favesShowed) {
            Text("Favorites")
        }
    }
    
}

struct FoodScreen_Previews: PreviewProvider {
    static var previews: some View {
        FoodScreen(viewModel: FoodScreenViewModel())
    }
}
