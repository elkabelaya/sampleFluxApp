//
//  MainScreen.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 12.03.2021.
//

import SwiftUI

struct MainScreen: View {
     var body: some View {
        VStack{
            Text("This is a sample of flux application")
                .padding()
                .background(Color.orange)
                .foregroundColor(Color.white)
            }.edgesIgnoringSafeArea(.top)
        

        
    }

}

#if DEBUG
struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
#endif
