//
//  NumberFormatter.swift
//  stim
//
//  Created by chaplin on 2022/10/11.
//

import Foundation

extension NumberFormatter {
    
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
