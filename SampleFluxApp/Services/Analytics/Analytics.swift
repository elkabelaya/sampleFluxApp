//
//  Analytics.swift
//  SampleFluxApp
//
//  Created by Elka Belaya on 29.05.2021.
//

import Combine
enum AnalyticsEvent: String {
    case appOpen = "App_Open"
    case recipeSelect = "Recipe_Select"
    case recipesLoaded = "Recipes_Loaded"
    case tabSelect = "Tab_Select"
}

final class Analytics: ObservableObject {
    
    func sendToSDK(_ name: AnalyticsEvent, _ properties: [AnyHashable: Any]? = nil) {
        print("send event \(name) \(String(describing: properties))")
    }
    
    func event(_ name: AnalyticsEvent, _ properties: [AnyHashable: Any]? = nil) {
        sendToSDK(name, properties)
        
    }
    
}
