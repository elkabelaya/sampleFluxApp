//
//  RecipePuppyViewModel.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 28.03.2021.
//
import Networking
import SwiftUI

final class RecipePuppyViewModel: ObservableObject {
    
    @Published private(set) var items: [Recipe] = .init()
    @Published private(set) var page: Int = 0
    @Published private(set) var isPageLoading: Bool = false
    
    func loadPage() {
        guard isPageLoading == false else {
            return
        }
        isPageLoading = true
        page += 1
        RecipeAPI.getRecipe(i: "potato", q: "salad", p: page) { response, error in
            if let results = response?.results {
                print(results)
                self.items.append(contentsOf: results)
                self.isPageLoading = false
            }
            
        }
    }
    
}
extension Recipe:Identifiable {
    public var id: String {
        href
    }
}
