//
//  NewTweetView.swift
//  stim
//
//  Created by chaplin on 2022/10/08.
//

import SwiftUI

struct NewTweetView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var content = ""
    
    var body: some View {
        VStack {
            
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("취소").foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Button {
                    print("Dissmiss")
                } label: {
                    Text("완료").foregroundColor(Color(.systemBlue))
                }
            }
            
            
            TextArea("내용을 입력해주세요", text: $content)
            
            
            Spacer()
            
        }.padding()
    }
}
