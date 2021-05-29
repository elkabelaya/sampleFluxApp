//
//  MainScreen.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 12.03.2021.
//

import SwiftUI

struct MainScreen: View {
    @StateObject var tabRouter: TabRouter = ServiceLocator.assembly.inject()
    
   
    var body: some View {
        VStack{
            Text("This is a sample of custom injection")
                .padding()
                .background(Color.orange)
                .foregroundColor(Color.white)
            }.edgesIgnoringSafeArea(.top)
        

        
    }

}

#if DEBUG
struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen().environmentObject(TabRouter())
    }
}
#endif
