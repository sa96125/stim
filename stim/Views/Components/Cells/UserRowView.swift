//
//  UserRowView.swift
//  stim
//
//  Created by chaplin on 2022/10/07.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing:12) {
            Circle()
                .frame(width: 48, height: 48)
                .foregroundColor(.black)
            
            VStack(alignment: .leading) {
                Text("joker")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text("오늘 밤은 삐딱하게")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
