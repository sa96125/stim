//
//  Int.swift
//  stim
//
//  Created by chaplin on 2022/10/17.
//

import Foundation

extension Int {
    
    var numberString: String {
        
        guard self < 10 else { return "0" }
        
        return String(self)
    }
}
