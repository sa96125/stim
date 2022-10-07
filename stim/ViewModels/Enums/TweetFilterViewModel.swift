//
//  TweetFilterViewModel.swift
//  stim
//
//  Created by chaplin on 2022/10/07.
//

import Foundation


enum TweetFilterViewModel: Int, CaseIterable {
    case latest
    case following
    case health
    case foods
    case ads
    
    var title: String {
        switch self {
        case .latest: return "최신"
        case .following: return "팔로잉"
        case .health: return "운동"
        case .foods: return "식단"
        case .ads: return "광고"
        }
    }
}
