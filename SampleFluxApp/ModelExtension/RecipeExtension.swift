//
//  RecipeExtension.swift
//  SampleFluxApp
//
//  Created by Elka Belaya on 06.06.2021.
//
import Networking

extension Recipe:Identifiable {
    public var id: String {
        title
    }
}
