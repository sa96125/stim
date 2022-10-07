//
//  ProfileView.swift
//  stim
//
//  Created by chaplin on 2022/10/07.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var currentValue = 0.0
    @State private var lasttValue = 1.0
    
    var body: some View {
    
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                ZStack(alignment: .bottomLeading) {
                    Image("profileImage")
                        .resizable()
                        .scaledToFill()
                        .scaleEffect()

                   
                    Text("_xxx_g_dragon")
                        .font(.largeTitle).bold()
                        .padding()
                        .foregroundColor(.white)
                }.frame(height: 400)
                
                
                VStack(alignment: .leading){
                    Text("아수라 발발타, 나는야 럭키가이 :)").font(.title2)
                    Text("운동 경력 2년 크로스핏 코치 Jake입니다.").font(.title2)
                    Text("인플루언서 50").font(.subheadline)
                    Text("대한민국, 서울").font(.subheadline)
                }.padding()
                
                
                VStack(alignment: .leading){
                    Text("ON STIMMING").font(.title).bold()
                    
                    ForEach(0...2, id:\.self) { _ in
                 
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
                }
                .padding()
                
                
                VStack(alignment: .leading){
                    Text("최근 활동").font(.title).bold()
                    
                    TweetRowView()
                    TweetRowView()
                    TweetRowView()
                    TweetRowView()
                    
                }
                .padding()
                
            }
            
        }.ignoresSafeArea(edges: .top)

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
