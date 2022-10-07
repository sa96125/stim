//
//  MainTabView.swift
//  stim
//
//  Created by chaplin on 2022/10/07.
//

import SwiftUI

enum Tab {
    case play
    case explore
    case notifications
    case feed
    case mypage
}

struct MainTabView: View {
    
    @State private var selectedTab: Tab = .play
    
    
    var body: some View {
        
        TabView(selection: self.$selectedTab) {
            
            PlayView()
                .onTapGesture {
                    self.selectedTab = .play
                }
                .tabItem {
                    VStack {
                        Image(systemName: "play")
                        Text("플레이")
                    }
                }
                .tag(Tab.play)
            
            
            ExploreView()
                .onTapGesture {
                    self.selectedTab = .explore
                }
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("검색")
                    }
                }
                .tag(Tab.explore)
            
            
            FeedView()
                .onTapGesture {
                    self.selectedTab = .feed
                }
                .tabItem {
                    VStack {
                        Image(systemName: "square.grid.2x2")
                        Text("커뮤니티")
                    }
                }
                .tag(Tab.feed)
            
            
            NotificationsView()
                .onTapGesture {
                    self.selectedTab = .feed
                }
                .tabItem {
                    VStack {
                        Image(systemName: "bell")
                        Text("알림")
                    }
                }
                .tag(Tab.notifications)
            
            
            MypageView()
                .onTapGesture {
                    self.selectedTab = .mypage
                }
                .tabItem {
                    VStack {
                        Image(systemName: "person.crop.circle.fill")
                        Text("마이페이지")
                    }
                }
                .tag(Tab.mypage)

    
        }
        .accentColor(.black)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
