//
//  String.swift
//  AppSUI
//
//  Created by Elka Belaya on 28.03.2021.
//

import Foundation

extension String {
    
    func trim() -> Self {
        self.filter { !"\n\t\r".contains($0) }
    }
    
    
    
}

extension String: Identifiable {
    public var id: String { self }
}
