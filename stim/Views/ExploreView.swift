//
//  ExploreView.swift
//  stim
//
//  Created by chaplin on 2022/10/07.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    LazyVStack {
                        ForEach(0...20, id: \.self) { _ in
                            NavigationLink(destination: ProfileView().navigationBarBackButtonHidden(true)) {
                                UserRow()
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                    }
                    
                }
            }
            .navigationTitle("검색")
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always)) {
            
            }
        }
    }
}
