//
//  TweetRowView.swift
//  stim
//
//  Created by chaplin on 2022/10/06.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            
            HStack(alignment: .center) {
                Circle()
                    .frame(width: 22)
                    .foregroundColor(Color(.black))
                
                
                Text("batman332")
                    .font(.subheadline)
                    .foregroundColor(Color(.black))
                
                Text("영양박사")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Text("1분전")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Image(systemName: "eye.circle")
                    .foregroundColor(.gray)
                
                Text("99")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
            }
            
            Text("오랜만에 운동 리뷰!")
                .bold()
                .foregroundColor(Color(.black))
                
            Text("작년 2월말에 슬릭 웨이트 반을 처음 시작해서 딱 1년이 되어간다. 드디어 용기를 내어서 다음기수는 웨이트 퍼포먼스 반 신청! 맨몸운동 위주로 하다가 처음 웨이트 했을때 너무 힘들었는데 지금은 무게가 가벼워서 올리는 일도 많다. 2주후에 같은 반 신청한 친구들도 있고, 다른반으로 가는 친구들도 있고, 슬릭을 잠시 쉬는 친구들도 있어서 보고싶을 것 같다!")
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .foregroundColor(Color(.black))
            
            HStack(spacing: 17) {
                Text("#5분할")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Button {
                    // action
                } label: {
                    Image(systemName: "heart")
                        .font(.title2)
                        .foregroundColor(.black)
                }

                Button {
                    // action
                } label: {
                    Image(systemName: "ellipsis.bubble")
                        .font(.title3)
                        .foregroundColor(.black)
                }
                
                Button {
                    // action
                } label: {
                    Image(systemName: "slider.horizontal.3")
                        .font(.title3)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
