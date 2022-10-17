//
//  NotificationsView.swift
//  stim
//
//  Created by chaplin on 2022/10/07.
//

import SwiftUI

struct NotificationsView: View {
    
    var body: some View {
        NavigationView {
            List {
                
                Section(header: Text("최근 14일 이내 알림내역").font(.caption2).foregroundColor(.gray)) {
                    ForEach(0..<20, id: \.self ) { _ in
                        NotificationRow().padding(.vertical,6)
                    }
                }
                
            }
            .listStyle(.inset)
            .navigationTitle("알림")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button() {
                        print("알림 설정 클릭")
                    } label: {
                        Image(systemName: "bell.slash")
                            .foregroundColor(.black)
                            .font(.subheadline)
                    }
                }
            }
        }
    }
}
