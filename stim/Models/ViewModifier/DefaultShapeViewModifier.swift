//
//  S.swift
//  stim
//
//  Created by chaplin on 2022/10/16.
//

import SwiftUI

struct DefaultShapeViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(15)
            .clipped()
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 3, y: 10)
    }
}
