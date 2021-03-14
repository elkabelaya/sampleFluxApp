//
//  CoctailListModel.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 14.03.2021.
//
struct CoctailListModel: Codable {
    let coctails: [CoctailModel]
    enum CodingKeys: String, CodingKey {
        case coctails = "drinks"
    }
}

// MARK: - Drink
struct CoctailModel: Codable {
    let name: String
    let glass: String
    let description:String
    var isForCoctailGlass: Bool {
        return glass == "Cocktail glass"
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "strDrink"
        case description = "strInstructions"
        case glass = "strGlass"
        
    }
}

extension CoctailModel:Identifiable{
    var id:String {
        name
    }
}


