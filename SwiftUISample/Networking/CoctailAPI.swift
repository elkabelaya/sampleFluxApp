//
//  CoctailAPI.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 14.03.2021.
//
import Foundation

enum CoctailAPI {
    case search(name: String)
}

extension CoctailAPI: EndpointType {
    var baseURL: URL {
        return URL(string: "https://www.thecocktaildb.com/api/json/v1/1/")!
    }

    var path: String {
        switch self {
        case .search(let name):
            return "\(baseURL)search.php?s=\(name)"
        }
    }
}
