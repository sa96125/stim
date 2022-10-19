//
//  TextArea.swift
//  stim
//
//  Created by chaplin on 2022/10/08.
//

import SwiftUI
import UIKit

struct TextArea: View {
    
    @Binding var text: String
    let placeholder: String
    
    init(_ placeholder:String, text:Binding<String>) {
        self.placeholder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextField(placeholder,text: $text, axis: .vertical)
                .lineLimit(1...5)
                
        }.font(.body)
    }
}
