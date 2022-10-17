//
//  FeedView.swift
//  stim
//
//  Created by chaplin on 2022/10/06.
//

import SwiftUI

struct FeedView: View {
    
    @Namespace var animation
    @State private var selectedCategory: Categories = .latest
    @State private var isNewTweetClicked: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    categoriesLayer
                    
                    contentsLayer
                    
                }
            }
            .navigationTitle("커뮤니티")
            .toolbar {
                ToolbarItem {
                    Button() {
                        isNewTweetClicked.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.black)
                    }
                    .fullScreenCover(isPresented: self.$isNewTweetClicked){
                        NewTweetView()
                    }
                }
            }
        }
    }
}

extension FeedView {
    
    private var categoriesLayer: some View {
        HStack{
            ForEach(Categories.allCases, id: \.rawValue) { category in
                VStack {
                    Text(category.title)
                    .font(.subheadline)
                    .padding(.top,6)
                    .foregroundColor(selectedCategory == category ? .black : .gray)
                
                    if selectedCategory == category {
                        Capsule()
                        .foregroundColor(.black)
                        .frame(height:3)
                        .matchedGeometryEffect(id: "filter", in: animation)

                    } else {
                        Capsule()
                        .foregroundColor(.clear)
                        .frame(height:3)
                    }
                }
                .onTapGesture {
                    withAnimation(.default) {
                        self.selectedCategory = category
                    }
                }
            }
        }
    }
    
    private var contentsLayer: some View {
        LazyVStack {
            ForEach(0...20, id:\.self) { _ in
                NavigationLink(destination: TweetDetailView(), label: {
                    TweetRow(type: .primary)
                        .padding()
                })
                
                Divider()
            }
        }
    }
    
}
