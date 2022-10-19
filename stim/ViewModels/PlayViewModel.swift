//
//  Play.swift
//  stim
//
//  Created by chaplin on 2022/10/11.
//

import Foundation

@MainActor
class PlayViewModel: ObservableObject {
    
    private let webservice: Webservice
    
    @Published var rockerButtonHandler: Bool = false
    @Published var heros: [Hero] = [Hero(), Hero()]
    @Published var audios: [Audio] = []
    
    init(webservice: Webservice) {
        self.webservice = webservice
    }
    
    func getAudios() async throws {
        audios = try await webservice.getAudios()
    }
    
}
