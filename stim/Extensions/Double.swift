//
//  Double.swift
//  stim
//
//  Created by chaplin on 2022/10/17.
//

import Foundation

extension Double {
    
    func formatMmSs() -> String {
        let minutes = Int(self) / 60 % 60
        let seconds = Int(self) % 60
        return String(format: "%01d분 %02d초", minutes, seconds)
    }
}
