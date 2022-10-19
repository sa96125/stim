//
//  Feed.swift
//  stim
//
//  Created by chaplin on 2022/10/11.
//

import Foundation

enum Categories: Int, CaseIterable {
    case latest
    case following
    case hotTopic
    case qna
    
    var title: String {
        switch self {
        case .latest: return "Latest"
        case .following: return "Following"
        case .hotTopic: return "Hot Topic"
        case .qna: return "Q&A"
        }
    }
}
