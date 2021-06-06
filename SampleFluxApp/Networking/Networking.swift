//
//  Networking.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 14.03.2021.
//
import Foundation

struct Networking {

    func performNetworkTask<T: Codable>(url: URL?,
                                        type: T.Type,
                                        completion: ((_ response: T) -> Void)?) {
        if let url = url {
            let urlRequest = URLRequest(url: url)

            let urlSession = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
                if let _ = error {
                    return
                }
                guard let data = data else {
                    return
                }
                if let jsonString = String(data: data, encoding: .utf8) {
                            print(jsonString)
                         }
                let response = Response(data: data)
                guard let decoded = response.decode(type) else {
                    return
                }
                completion?(decoded)
            }

            urlSession.resume()
        }
    }
   
    
    func performNetworkTask<T: Codable>(path: String,
                                        type: T.Type,
                                        completion: ((_ response: T) -> Void)?) {
        let url = URL(string: path)
        self.performNetworkTask(url: url, type: type, completion: completion)
    }
    
    func performNetworkTask<T: Codable>(endpoint: CoctailAPI,
                                        type: T.Type,
                                        completion: ((_ response: T) -> Void)?) {
        self.performNetworkTask(path: endpoint.path, type: type, completion: completion)
    }
}
