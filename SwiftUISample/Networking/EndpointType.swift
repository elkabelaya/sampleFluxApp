//
//  EndpointType.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 14.03.2021.
//
import Foundation

protocol EndpointType {

    var baseURL: URL { get }

    var path: String { get }

}
