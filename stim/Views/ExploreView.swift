//
//  ExploreView.swift
//  stim
//
//  Created by chaplin on 2022/10/07.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationView {
            
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(0...20, id: \.self) { _ in
                            NavigationLink {
                                ProfileView()
                            } label: {
                                UserRowView()
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("검색")
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
