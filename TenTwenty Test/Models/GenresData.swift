//
//  GenresData.swift
//  TenTwenty Test
//
//  Created by Muhammad Abbas on 20/02/2022.
//

import Foundation

struct GenresData: Codable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "string_id"
        case name = "genre_name"
    }
}
