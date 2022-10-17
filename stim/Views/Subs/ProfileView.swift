//
//  ProfileView.swift
//  stim
//
//  Created by chaplin on 2022/10/07.
//

import SwiftUI

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct ProfileView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var scrollViewOffset: CGFloat = .zero
    private let userImageHeight = UIScreen.main.bounds.height / 2.2
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    
                    userImageLayer.opacity((userImageHeight + scrollViewOffset) / userImageHeight)
                    
                    userStatisticsLayer
                    
                    userDescribeLayer
                    
                    userAudiosLayer
                    
                    userTweetsLayer

                    userPicturesLayer

                }
            }
            .edgesIgnoringSafeArea(.top)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .onPreferenceChange(ScrollViewOffsetPreferenceKey.self, perform: { value in
                scrollViewOffset = value
            })
    
            backButtonLayer
            
        }
    }
}

extension ProfileView {
    
    private var backButtonLayer : some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.backward")
                .imageScale(.large)
                .padding()
        })
        .accentColor(.white)
    }
    
    private var userImageLayer : some View {
        ZStack(alignment: .bottomLeading) {
            
            GeometryReader{ g in
                Image("profileImage")
                    .resizable()
                    .offset(x: g.frame(in: .global).minY > 0 ? -g.frame(in: .global).minY / 2 : 0)
                    .offset(y: g.frame(in: .global).minY > 0 ? -g.frame(in: .global).minY : 0)
                    .frame(width: g.frame(in: .global).minY > 0
                           ? UIScreen.main.bounds.width + g.frame(in: .global).minY
                           : UIScreen.main.bounds.width)
                    .frame(height: g.frame(in: .global).minY > 0
                           ? UIScreen.main.bounds.height / 2.2 + g.frame(in: .global).minY
                           : UIScreen.main.bounds.height / 2.2)
                    .preference(key: ScrollViewOffsetPreferenceKey.self ,value: g.frame(in: .global).minY)
            }
            
            Text("_xxx_g_dragon")
                .font(.largeTitle).bold()
                .padding()
                .foregroundColor(.white)
        }
        .frame(height: UIScreen.main.bounds.height / 2.2)
    }
    
    private var userStatisticsLayer : some View {
        HStack {
            
            VStack(alignment: .center) {
                Text("10").font(.title3).bold()
                Text("음성").font(.subheadline)
            }
            
            Spacer()
            
            VStack(alignment: .center) {
                Text("20").font(.title3).bold()
                Text("게시물").font(.subheadline)
            }
            
            Spacer()
            
            VStack(alignment: .center) {
                Text("4k").font(.title3).bold()
                Text("팔로워").font(.subheadline)
            }
            
            Spacer()
            
            VStack(alignment: .center) {
                Text("24").font(.title3).bold()
                Text("팔로잉").font(.subheadline)
            }
            
        }.padding()
    }
    
    private var userDescribeLayer : some View {
        HStack {
            
            VStack(alignment: .leading){
                Text("아수라 발발타,").font(.subheadline)
                Text("https://github.com/sa96125").font(.subheadline)
                
                Spacer()
            }
            
            Spacer()
            
            VStack {
                Spacer()
                
                Text("인플루언서 50인")
                    .padding(6)
                    .font(.caption2)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(4)
            }
            
        }
        .padding()
        .frame(height:150)
    }
    
    private var userAudiosLayer: some View {
        VStack(alignment: .leading) {
            Text("ON STIMMING").font(.title2).bold().padding(.top)
            
            ForEach(0..<3) { _ in
                HStack {
                    Rectangle()
                        .frame(width:50, height: 50)
                        .cornerRadius(4)
                    VStack(alignment: .leading) {
                        Text("진심 운동 시리즈, 1탄 ")
                        Text("재생 시간 5:60 ")
                            .font(.subheadline)
                            .foregroundColor(Color.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName:"plus")
                }
                .listRowInsets(EdgeInsets())
                .frame(height:60)

            }
        }.padding(.horizontal)
    }
    
    private var userTweetsLayer : some View {
        VStack(alignment: .leading) {
            
            Text("최신 글").font(.title2).bold().padding(.top)
            
            TweetRow(type: .primary)
            
        }.padding(.horizontal)
    }
    
    private var userPicturesLayer : some View {
        VStack (alignment: .leading) {
            Text("사진")
                .font(.title2)
                .bold()
                .padding(.leading)
                .padding(.top)
                .padding(.top)

            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0...6, id: \.self) { _ in
                        VStack {
                            Color.primary
                                .frame(width:150, height: 150)
                                .cornerRadius(12)
                        }
                    }
                }
                .foregroundColor(Color(.black))
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
    }
    
}
