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
            text: "This is UITextView",
            textStyle: UIFont.TextStyle.caption1
        )
    
    @State var showDiagramModal: Bool = false
    @State var showAnimationModal: Bool = false
    @State var showGeometryFXModal: Bool = false
    
    var headerImage: Image {
        Image("stretch_header")
    }

    var stretchyHeader: some View {
        ScrollView{
            GeometryReader { geometry in
                if geometry.frame(in: .global).minY <= 0 {
                    headerImage
                        .imageFill()
                        .frame(width: geometry.size.width,
                               height: geometry.size.height)
                        .offset(y:geometry.frame(in: .global).minY/9)
                } else {
                    headerImage
                        .imageFill()
                        .frame(width: geometry.size.width,
                               height: geometry.size.height + geometry.frame(in: .global).minY)
                        .offset(y: -geometry.frame(in: .global).minY)
                }
                
            }//GeometryReader
            .modifier(StretchyHeaderModifier())
        }

    }
    
    var body: some View {

            
        VStack{
            stretchyHeader
            Text("Show Diagram")
                .padding()
                .background(Color.orange)
                .foregroundColor(Color.white)
                .onTapGesture {
                    showDiagramModal.toggle()
                }
                .sheet(isPresented: $showDiagramModal, content: {
                    DiagramModal()
            })
            
            Text("Show Animations")
                .padding()
                .background(Color.green)
                .foregroundColor(Color.white)
                .onTapGesture {
                    showAnimationModal.toggle()
                }
                .sheet(isPresented: $showAnimationModal, content: {
                    AnimationModal()
                })
            /*
             Button("Present!") {
             isPresented.toggle()
             }
             .fullScreenCover(isPresented: $isPresented, content: FullScreenModalView.init)
             */
            
            Text("Show Geometry FX")
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .onTapGesture {
                    showGeometryFXModal.toggle()
                }
                .sheet(isPresented: $showGeometryFXModal, content: {
                    GeometryFXModal()
                })
            ExpandingTextView(viewModel: $textViewViewModel)
                .frame(width: 200)
            Button{
                tabRouter.currentTab = TabRoute.food
                tabRouter.isSuperFoodShowed = true
            } label: {
                Text("Change to tab 2")
            }
            
        }//VStack
        .edgesIgnoringSafeArea(.top)
        

        
    }

}

struct StretchyHeaderModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 400)
    }
}
#if DEBUG
struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen().environmentObject(TabRouter())
    }
}
#endif
