//
//  FeedView.swift
//  stim
//
//  Created by chaplin on 2022/10/06.
//

import SwiftUI

struct FeedView: View {
    
    @State private var selectedCategory: TweetFilterViewModel = .latest
    @Namespace var animation
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack{
                        ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { category in
                            
                            
                            VStack {
                                Text(category.title)
                                    .font(.title3)
                                    .fontWeight(selectedCategory == category ? .semibold : .regular)
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
                    
                    
                    LazyVStack {
                        ForEach(0...20, id:\.self) { _ in
                            
                            NavigationLink {
                                TweetDetailView()
                            } label: {
                                TweetRowView().padding()
                                Divider()
                                    .frame(height: 2.0)
                                    .background(Color.white)
                            }

                        }
                    }
                }
                
                .navigationTitle("커뮤니티")
            }
        }
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
