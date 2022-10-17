//
//  AudioRow.swift
//  stim
//
//  Created by chaplin on 2022/10/10.
//

import SwiftUI

struct AudioRow: View {
    
    var body: some View {
        HStack(spacing:12) {
            
            Image(systemName: "beats.headphones")
            
            VStack {
                Text("진심 운동 시리즈 1탄, 어깨루틴")
                .foregroundColor(.black)
            }
               
            Spacer()
            
            
            Image(systemName: "ellipsis")
            
        }
        .font(.subheadline)
    }
}
