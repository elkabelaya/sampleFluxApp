//
//  CatalogScreen.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 16.03.2021.
//

import SwiftUI
import SwiftUIComponents
struct CatalogScreen: View {
    
    var body: some View {

        NavControllerView(transition: .custom(.moveAndFade)) {
            CatalogScreenContent()
        }

    }
}

struct CatalogScreenContent: View {
    var columns: [GridItem] = Array(repeating: .init(), count: 3)
    var body: some View {
        GeometryReader { geometry in
            VStack{
                NavPushButton(destination: SecondScreen()) {
                    Text("CustomNavigationStack, 2nd level")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(Color.white)
                }
                HStack{
                    
                    CustomActivityIndicatorView()
                    CustomButtonView (action:{
                        print("custom button")
                    }){
                        Text("custom button")
                    }
                    Button("Quit") {
                        print("Quit")
                    }
                    .buttonStyle(WhiteButton())
                }//HStack
                LazyVGrid(columns: columns){
                    ForEach((0...1000), id: \.self) {
                        Text("\($0)")
                            .padding()
                            .frame(width: geometry.size.width/3)
                            .background(Color.green)
                    }
                }//LazyVGrid
            }//VStack
        }//GeometryReader
    }
}

struct SecondScreen: View {
    
    var body: some View {
        VStack(spacing: 50) {
            NavPushButton(destination: TwoColumnScreen()) {
                Text("CustomNavigationStack, 3nd level")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(Color.white)
            }
            NavPopButton() {
                Image(systemName: "arrow.left.circle.fill")
                    .font(.largeTitle)
            }
        }
    }
    
}

struct CatalogScreen_Previews: PreviewProvider {
    static var previews: some View {
        CatalogScreen()
    }
}
