//
//  TabRouter.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 13.03.2021.
//

import SwiftUI

class TabRouter: ObservableObject {
    @Published var currentTab:TabRoute = TabRoute.undefined
    @Published var currentAction:TabAction = TabAction.undefined
}
