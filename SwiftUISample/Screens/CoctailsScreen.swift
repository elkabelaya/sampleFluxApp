//
//  CoctailsScreen.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 12.03.2021.
//

import SwiftUI


struct CoctailsScreen: View {
    @StateObject var coctailListViewModel:CoctailListViewModel = .init()
    @State var coctailName:String = "margarita"
    @State var onlyInCoctailGlass:Bool = false
    var body: some View {
        NavigationView {
            
            List{
                FilterView(filterValue: $onlyInCoctailGlass, filterText: "Only for cocttail glasses")
                ForEach(coctailListViewModel.coctailModels){ item in
                    if (!onlyInCoctailGlass || item.isForCoctailGlass ){
                        CoctailListNavigationCell(coctailModel: item)
                    }
                    
                }
            }// List
            .navigationTitle("Margarita coctails")
            .onAppear(){
                if (coctailListViewModel.coctailModels.count == 0){
                    self.coctailListViewModel.getCoctailsForName(name: coctailName)
                }
            }
            
        }
    }
}


#if DEBUG
struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        CoctailsScreen()
    }
}
#endif
