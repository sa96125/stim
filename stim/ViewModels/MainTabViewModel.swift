//
//  TabViewModel.swift
//  stim
//
//  Created by chaplin on 2022/10/08.
//

import Foundation

enum Tabs {
    case play
    case explore
    case notifications
    case feed
    case mypage
}

class MainTabViewModel: ObservableObject {
    
    @Published var selectedTab: Tabs = .play
    
}
