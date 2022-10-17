//
//  TweetRowView.swift
//  stim
//
//  Created by chaplin on 2022/10/06.
//

import SwiftUI

enum ContentType {
    case primary
    case image
}

struct TweetRow: View {
        
    var type : ContentType
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            headerLayer
            
            contentLayer
            
            footerLayer
            
        }
    }
}

extension TweetRow {
    
    private var headerLayer: some View {
        HStack(alignment: .center, spacing: 4) {
            Circle()
                .frame(width: 16)
                .foregroundColor(Color(.black))
            
            
            Text("batman332")
                .font(.caption2)
                .foregroundColor(Color(.black))
            
            Text("1분전")
                .font(.caption2)
                .foregroundColor(.gray)
            
            Spacer()
            
            Image(systemName: "eye.circle")
                .foregroundColor(.gray)
                .font(.caption2)
            
            Text("99")
                .font(.caption2)
                .foregroundColor(.gray)
        }
    }
    
    @ViewBuilder private var contentLayer: some View {
        switch type {
            case .primary :
                primaryView
            case .image :
                hasImageView
            }
    }
    
    private var primaryView: some View {
        VStack(alignment: .leading) {
            Text("오랜만에 운동 리뷰!")
                .bold()
                .foregroundColor(Color(.black))
                
            Text("작년 2월말에 슬릭 웨이트 반을 처음 시작해서 딱 1년이 되어간다. 드디어 용기를 내어서 다음기수는 웨이트 퍼포먼스 반 신청! 맨몸운동 위주로 하다가 처음 웨이트 했을때 너무 힘들었는데 지금은 무게가 가벼워서 올리는 일도 많다.")
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .foregroundColor(Color(.black))
        }
    }
    
    private var hasImageView: some View {
        HStack {
            VStack {
                Text("오랜만에 운동 리뷰!")
                    .bold()
                    .foregroundColor(Color(.black))
                    
                Text("작년 2월말에 슬릭 웨이트 반을 처음 시작해서 딱 1년이 되어간다. 드디어 용기를 내어서 다음기수는 웨이트 퍼포먼스 반 신청! 맨몸운동 위주로 하다가 처음 웨이트 했을때 너무 힘들었는데 지금은 무게가 가벼워서 올리는 일도 많다.")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .foregroundColor(Color(.black))
            }
            
            Spacer()
            
            Color(.red)
                .frame(width:50, height:50)
            
        }.padding()
    }
    
    private var footerLayer: some View {
        HStack(spacing: 20) {
            Text("#5분할")
                .font(.caption2)
                .foregroundColor(.gray)
            
            Spacer()
            
            Button {
                // action
            } label: {
                Image(systemName: "heart")
                    .font(.caption)
                    .foregroundColor(.black)
            }

            Button {
                // action
            } label: {
                Image(systemName: "ellipsis.bubble")
                    .font(.caption2)
                    .foregroundColor(.black)
            }
            
            Button {
                // action
            } label: {
                Image(systemName: "slider.horizontal.3")
                    .font(.caption2)
                    .foregroundColor(.black)
            }
        }
    }
    
}

