//
//  MypageViewModel.swift
//  stim
//
//  Created by chaplin on 2022/10/07.
//

import Foundation


enum MypageViewModel: Int, CaseIterable {
    case profile
    case logout
    
    var description: String {
        switch self {
            case .profile: return "Profile"
            case .logout: return "Logout"
        }
    }
    
    var imageName: String {
        switch self {
            case .profile: return "person"
            case .logout: return "arrow.left.square"
        }
    }
}
