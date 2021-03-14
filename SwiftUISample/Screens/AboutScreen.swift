//
//  AboutScreen.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 12.03.2021.
//

import SwiftUI

struct AboutScreen: View {
    @State private var showCredits: Bool = false
    
    var body: some View {
        VStack{
            Image(systemName: "house.circle.fill")
                .font(Font.largeTitle.bold())
            Spacer().frame(height:80)
            Button(action:{
                showCredits.toggle()
            }){
                Text("Version 1.0.0")
            }
            
        }
        .sheet(isPresented: $showCredits, content: {
            Text("SwiftUI sample")
                .font(.largeTitle)
        })
        
    }
}

#if DEBUG
struct AboutScreen_Previews: PreviewProvider {
    static var previews: some View {
        AboutScreen()
    }
}
#endif
