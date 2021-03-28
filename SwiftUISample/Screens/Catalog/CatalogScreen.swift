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
                HStack{
                    NavPushButton(destination: SecondScreen()) {
                        Text("Second")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(Color.white)
                    }
                    ActivityIndicatorView()
                    CustomButton (action:{
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
                Text("Two Column for SwiftUI 1.0")
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
