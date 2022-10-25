//
//  MainTabView.swift
//  stim
//
//  Created by chaplin on 2022/10/07.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        TabView {
            
            PlayView()
                .tabItem {
                    VStack {
                        Image(systemName: "play")
                        .font(.subheadline)
                        Text("플레이")
                    }
                }
            
            
            FeedView()
                .tabItem {
                    VStack {
                        Image(systemName: "square.grid.2x2")
                        .font(.subheadline)
                        Text("커뮤니티")
                    }
                }
            
            
            ExploreView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        .font(.subheadline)
                        Text("검색")
                    }
                }
            
            
            NotificationsView()
                .tabItem {
                    VStack {
                        Image(systemName: "bell")
                        .font(.subheadline)
                        Text("알림")
                    }
                }
            
            
            MyPageView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.crop.circle.fill")
                        .font(.subheadline)
                        Text("내 정보")
                    }
                }
            
        }.accentColor(.black)
    }
}
