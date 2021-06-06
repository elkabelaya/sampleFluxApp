//
//  Response.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 14.03.2021.
//
import Foundation

struct Response {
    fileprivate var data: Data
    init(data: Data) {
        self.data = data
    }
}

extension Response {
    public func decode<T: Codable>(_ type: T.Type) -> T? {
        let jsonDecoder = JSONDecoder()
        do {
            let response = try jsonDecoder.decode(T.self, from: data)
            return response
        } catch _ {
            return nil
        }
    }
}
