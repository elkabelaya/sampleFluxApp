//
//  RecipeStore.swift
//  SampleFluxApp
//
//  Created by Elka Belaya on 31.05.2021.
//
import Networking
import Combine

enum RecipeAction {
    case load(String)
    case loadNext
    case setRecipes([Recipe])
}

struct RecipeState {
    var loading: Bool
    var page: Int
    var category: String
    var recipes: [Recipe] = []
}

func recipeReducer( state: inout RecipeState, action: RecipeAction ) -> PassthroughSubject<RecipeAction, Never>? {
    
    switch action {
        case let .setRecipes(recipes):
            state.recipes.append(contentsOf: recipes)
            state.loading = false
        case let .load(category):
            state.category = category
            state.recipes = []
            state.loading = true
            state.page = 0
            fallthrough
        case .loadNext:
            state.page += 1
            let passthrough = PassthroughSubject<RecipeAction, Never>()
            RecipeAPI.getRecipe(i: "", q: state.category, p: state.page) { response, error in
                if let results = response?.results {
                    passthrough.send(RecipeAction.setRecipes(results))
                }
                
            }
            return passthrough
            
    }
    return nil
}

func recipeAnalyticsReducer( state: inout RecipeState, action: RecipeAction ) -> PassthroughSubject<RecipeAction, Never>? {
    switch action {
        case .setRecipes(_):
            let analytics: Analytics = .init()
            analytics.event(AnalyticsEvent.recipesLoaded, ["category": state.category,"page":state.page])
        default:
            return nil
    }
    return nil
}

typealias RecipeStore = Store<RecipeState, RecipeAction>

func generateRecipeStore() -> RecipeStore {
    return RecipeStore (
        firstState: .init(loading: false,
                          page: 0,
                          category: ""),
        reducers: [recipeReducer, recipeAnalyticsReducer])
}
