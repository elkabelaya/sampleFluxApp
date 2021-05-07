//
//  TwoColumnScreen.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 27.03.2021.
//

import SwiftUI
import SwiftUIComponents

final class TwoColumnScreenViewModel: ObservableObject {
    
    @Published private(set) var items = [[Int]]()
    
    init() {
        let columned = (1...100).publisher.collect(2) // Publisher [[1,2], [3,4], [5,6], ...]
        _ = columned.collect().sink {
            self.items = $0
            print("sink \(self.items)")
        }
    }
}

struct TwoColumnScreen: View {
    
    @StateObject var viewModel: TwoColumnScreenViewModel = .init()
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            NavPopButton() {
                Image(systemName: "arrow.left.circle.fill")
                    .font(.largeTitle)
            }
            
            Text("Two Column")
                .font(.largeTitle)
                .padding(.top, 20)
            
            VStack(spacing: 10) {
                ForEach(0..<viewModel.items.count, id: \.self) { pair in
                    // Row
                    HStack(spacing: 10) {
                        ForEach(self.viewModel.items[pair], id: \.self) { i in
                            // Cell
                            Group {
                                if i == 10 {
                                    NavPushButton(destination: Screen10()) {
                                        self.cell(value: i)
                                    }
                                } else {
                                    self.cell(value: i)
                                }
                            }
                        }
                    }
                }
            }
            .padding(.bottom, 15)
        } // ScrollView
        .padding(.horizontal, 20)
    }
    
    func cell(value: Int) -> some View {
        Group {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.gray)
                Text("\(value)")
            }
            .frame(height: 100)
        }
    }
}

// Nested screen

struct Screen10: View {
    
    var body: some View {
        NavPopButton(destination: .root) {
            Text("<-- To Root")
                .font(.largeTitle)
        }
    }
    
}

struct TwoColumnScreen_Previews: PreviewProvider {
    static var previews: some View {
        TwoColumnScreen()
    }
}
