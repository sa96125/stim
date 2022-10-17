//
//  MainTabView.swift
//  stim
//
//  Created by chaplin on 2022/10/07.
//

import SwiftUI

struct MainTabView: View {
    
    @ObservedObject var mainTabViewModel = MainTabViewModel()
    
    var body: some View {
        TabView(selection: self.$mainTabViewModel.selectedTab) {
            
            PlayView()
                .onTapGesture {
                    self.mainTabViewModel.selectedTab = .play
                }
                .tabItem {
                    VStack {
                        Image(systemName: "play")
                        .font(.subheadline)
                        Text("플레이")
                    }
                }
                .tag(Tabs.play)
            
            
            FeedView()
                .onTapGesture {
                    self.mainTabViewModel.selectedTab = .feed
                }
                .tabItem {
                    VStack {
                        Image(systemName: "square.grid.2x2")
                        .font(.subheadline)
                        Text("커뮤니티")
                    }
                }
                .tag(Tabs.feed)
            
            
            ExploreView()
                .onTapGesture {
                    self.mainTabViewModel.selectedTab = .explore
                }
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        .font(.subheadline)
                        Text("검색")
                    }
                }
                .tag(Tabs.explore)
            
            
            NotificationsView()
                .onTapGesture {
                    self.mainTabViewModel.selectedTab = .feed
                }
                .tabItem {
                    VStack {
                        Image(systemName: "bell")
                        .font(.subheadline)
                        Text("알림")
                    }
                }
                .tag(Tabs.notifications)
            
            
            MyPageView()
                .onTapGesture {
                    self.mainTabViewModel.selectedTab = .mypage
                }
                .tabItem {
                    VStack {
                        Image(systemName: "person.crop.circle.fill")
                        .font(.subheadline)
                        Text("내 정보")
                    }
                }
                .tag(Tabs.mypage)
            
        }.accentColor(.black)
    }
}
