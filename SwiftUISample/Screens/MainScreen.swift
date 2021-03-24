//
//  MainScreen.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 12.03.2021.
//

import SwiftUI

struct MainScreen: View {
    @EnvironmentObject var tabRouter: TabRouter
    
    @State  var textViewViewModel:UIKitTextViewModel =
        .init(
            text: "This is a sample application",
            textStyle: UIFont.TextStyle.caption1
        )
    
    var body: some View {
        VStack{
            Text("Main Page").font(.largeTitle)
            ExpandingTextView(viewModel: $textViewViewModel)
                .frame(width: 200)
            Button(action: {
                tabRouter.currentTab = TabRoute.coctail
                tabRouter.currentAction = TabAction.select
            }){
                Text("Change to tab 2")
            }
        }
        
    }
}

#if DEBUG
struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen().environmentObject(TabRouter())
    }
}
#endif
