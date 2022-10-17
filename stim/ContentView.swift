
//
//  ContentView.swift
//  stim
//
//  Created by chaplin on 2022/10/05.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        Group {
            if authViewModel.userSession == nil {
                RegisterView()
            } else {
                MainTabView()
            }
        }
    }
}
