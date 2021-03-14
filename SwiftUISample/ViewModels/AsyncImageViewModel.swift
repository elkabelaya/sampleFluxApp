//
//  AsyncImageViewModel.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 14.03.2021.
//
import SwiftUI

class AsyncImageViewModel {

    private let networking = Networking()

    @Published var image: Image?

    public func getImageFromUrl (url: String) {
        /*networking.performNetworkTask(path: url,
                                      type: Image.self) { [weak self] (response) in
                                        self?.image = response
                                        completion?()
        }*/
    }

}
