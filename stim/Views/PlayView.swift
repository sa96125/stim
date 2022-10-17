//
//  PlayView.swift
//  stim
//
//  Created by chaplin on 2022/10/07.
//

import SwiftUI
import ACarousel

struct PlayView: View {
    
    @ObservedObject private var vm = PlayViewModel(webservice: Webservice())
    
    var body: some View {
        NavigationView {
            ScrollView (showsIndicators: false) {
                
                hirosLayer
                
                playListLayer
                
            }
            .navigationTitle("Let's Stim")
            .toolbar {
                ToolbarItem {
                    Button() {
                        print("보관함 버튼 눌림")
                    } label: {
                        Image(systemName: "tray")
                            .foregroundColor(.black)
                            .font(.subheadline)
                    }
                }
            }
        }
    }
}

extension PlayView {
    
    private var hirosLayer: some View {
        ACarousel(vm.heros, spacing: 10, headspace: 5, sidesScaling: 0.9) { hero in
            Image("hero2")
                .resizable()
                .frame(height: UIScreen.main.bounds.height / 3)
                .cornerRadius(15)
        }
        .frame(height: UIScreen.main.bounds.height / 3)
        .clipped()
        .shadow(color: .gray.opacity(0.5), radius: 10, x: 3, y: 10)
        .padding(.top)
    }
    
    private var playListLayer: some View {
        LazyVStack(spacing: 12) {
            ForEach(vm.audios) { audio in
                AudioRow().padding(.all, 4)
                Divider()
            }
        }.task {
            await fetchAudios()
        }
        .padding()
    }
    
    private func fetchAudios() async {
        do {
            try await vm.getAudios()
        } catch {
            print(error)
        }
    }
    
}
