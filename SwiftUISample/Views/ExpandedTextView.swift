//
//  ExpandedTextView.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 13.03.2021.
//
import SwiftUI
import UIKit

struct ExpandingTextView: View {
    @Binding var viewModel: UIKitTextViewModel
    let minHeight: CGFloat = 50
    
    @State private var textViewHeight: CGFloat?
    
    var body: some View {
        UIKitTextView(viewModel: viewModel, textDidChange: textDidChange)
            .frame(height: textViewHeight ?? minHeight)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
    }

    private func textDidChange(_ textView: UITextView) {
        self.textViewHeight = max(textView.contentSize.height, minHeight)
    }
}

#if DEBUG
struct ExpandedTextView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandingTextView(viewModel: .mock(
                            UIKitTextViewModel(
                                text: "This is UITextView",
                                textStyle: UIFont.TextStyle.largeTitle
                            )))
    }
}
#endif
