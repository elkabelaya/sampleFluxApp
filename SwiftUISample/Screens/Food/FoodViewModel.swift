//
//  CoctailListViewModel.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 14.03.2021.
//
import SwiftUI
import Combine

final class FoodScreenViewModel: ObservableObject {
    
    @Published private(set) var foods = [
        Food(name: "Strawberry", emoji: "🍓", isFave: false),
        Food(name: "Apple", emoji: "🍏", isFave: true),
        Food(name: "Cheese", emoji: "🧀", isFave: false),
        Food(name: "Tomato", emoji: "🍅", isFave: true),
    ]
    
}

struct Food {
    let name: String
    let emoji: String
    let isFave: Bool
}

extension Food: Identifiable {
    var id: String {
        name
    }
}

