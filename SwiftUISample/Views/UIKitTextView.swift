//
//  UIKitTextView.swift
//  SwiftUISample
//
//  Created by Elka Belaya on 13.03.2021.
//

import SwiftUI

final class UIKitTextViewModel: ObservableObject {
    @Published var text: String
    @Published var textStyle: UIFont.TextStyle
    
    init(text:String){
        self.text = text
        self.textStyle = UIFont.TextStyle.body
    }
    
    init(text:String, textStyle:UIFont.TextStyle ){
        self.text = text
        self.textStyle = textStyle
    }
}

struct UIKitTextView: UIViewRepresentable {
    @ObservedObject var viewModel:UIKitTextViewModel
    var textDidChange: (UITextView) -> Void
    
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.isEditable = true
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = viewModel.text
        uiView.font = UIFont.preferredFont(forTextStyle:viewModel.textStyle)
        
        DispatchQueue.main.async {
            self.textDidChange(uiView)
        }
    }

    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $viewModel.text, textDidChange: textDidChange)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
            @Binding var text: String
            var textDidChange: (UITextView) -> Void

            init(text: Binding<String>, textDidChange: @escaping (UITextView) -> Void) {
                self._text = text
                self.textDidChange = textDidChange
            }

            func textViewDidChange(_ textView: UITextView) {
                self.text = textView.text
                self.textDidChange(textView)
            }
        }
    
}

struct UIKitTextView_Previews: PreviewProvider {
    
    static var previews: some View {
        UIKitTextView(viewModel: UIKitTextViewModel(text: "this is uikit uitextview"), textDidChange: {_ in })
    }
}
