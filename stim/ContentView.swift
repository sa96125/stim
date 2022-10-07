
//
//  ContentView.swift
//  stim
//
//  Created by chaplin on 2022/10/05.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            MainTabView()
        }
        

        .navigationTitle("Navigation")
        .toolbar {
            ToolbarItem {
                Button {
                    
                } label: {
                    HStack(spacing:16) {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.black)
                        Image(systemName: "paperplane")
                            .foregroundColor(.black)
                    }
                    
                }
            }
        }
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
