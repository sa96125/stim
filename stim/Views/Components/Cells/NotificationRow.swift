//
//  NotificationMessageRow.swift
//  stim
//
//  Created by chaplin on 2022/10/10.
//

import SwiftUI

struct NotificationRow: View {
    
    var body: some View {
        HStack(spacing:8) {
            
            Circle()
                .frame(width: 40, height: 40)
                .foregroundColor(.black)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("_xxx_jake followed you")
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                Text("Jun 28, 2022")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
        }
    }
}
