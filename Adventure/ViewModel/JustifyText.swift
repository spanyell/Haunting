//
//  JustifyText.swift
//  Adventure
//
//  Created by Dan Beers on 2/24/21.
//

import Foundation
import SwiftUI

struct JustifyText: UIViewRepresentable {
    var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.font = UIFont(name: "Hoefler Text", size: 25)
        textView.textAlignment = .justified
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
            
    }
}
