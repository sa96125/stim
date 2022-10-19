//
//  Webservice.swift
//  stim
//
//  Created by chaplin on 2022/10/11.
//

import Foundation

enum NetworkError : Error {
    case badURL
    case badRequest
    case decodingError
}

class Webservice {
    
    func getAudios() async throws -> [Audio] {
        
        guard let url = URL(string: "https://63453a1ddcae733e8fec9f19.mockapi.io/api/v1/users/audios") else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        guard let audios = try? JSONDecoder().decode([Audio].self, from: data) else {
            throw NetworkError.decodingError
        }
        
        return audios
    }
    
}
