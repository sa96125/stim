//
//  View.swift
//  stim
//
//  Created by chaplin on 2022/10/16.
//

import SwiftUI

extension View {
    
    func withDefaultShapeFormatting() -> some View {
        return modifier(DefaultShapeViewModifier())
    }
}
