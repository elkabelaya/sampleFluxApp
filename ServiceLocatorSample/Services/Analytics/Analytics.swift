//
//  Analytics.swift
//  ServiceLocatorSample
//
//  Created by Elka Belaya on 29.05.2021.
//

enum AnalyticsEvent: String {
    case appOpen = "App_Open"
    case coctailSelect = "Coctail_Select"
}

final class Analytics: Serviceable {
    
    func sendToSDK(_ name: AnalyticsEvent, _ properties: [AnyHashable: Any]? = nil) {
        print("send event \(name) \(String(describing: properties))")
    }
    
    func event(_ name: AnalyticsEvent, _ properties: [AnyHashable: Any]? = nil) {
        sendToSDK(name, properties)
        
    }
    
}
