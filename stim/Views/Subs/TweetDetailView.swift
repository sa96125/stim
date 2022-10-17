//
//  TweetDetailView.swift
//  stim
//
//  Created by chaplin on 2022/10/07.
//

import SwiftUI

struct TweetDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            Color.clear
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.backward")
                    .imageScale(.large)
                    .padding()
            })
            
        }
    }
}
