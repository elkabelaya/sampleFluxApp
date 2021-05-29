//
//  Optional.swift
//  AppSUI
//
//  Created by Elka Belaya on 28.03.2021.
//

import Foundation

extension Optional where Wrapped == String {
    
    var asStringOrEmpty: String {
        self ?? ""
    }
    
}
