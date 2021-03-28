//
//  CoctailListViewModel.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 14.03.2021.
//
import SwiftUI

final class CoctailListViewModel:ObservableObject {
    @Published private (set) var coctailModels:[CoctailModel] = []
    //private let networking = Networking()
   
    public func getCoctailsForName(name: String) {
        /*networking.performNetworkTask(endpoint: CoctailAPI.search(name: name),
                                      type: CoctailListModel.self) { [weak self] (response) in
            self?.coctailModels = (response as CoctailListModel).coctails
            
        }*/
    }

}

struct CoctailListViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
