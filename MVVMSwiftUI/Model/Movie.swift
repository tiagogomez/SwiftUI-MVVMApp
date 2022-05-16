//
//  Movie.swift
//  MVVMSwiftUI
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 18/04/22.
//

import Foundation

struct Movie: Identifiable, Decodable, Equatable {
    
    var id: Int?
    var title: String?
    var overview: String?
    var poster: String?
    var backdrop: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title = "original_title"
        case overview
        case poster = "poster_path"
        case backdrop = "backdrop_path"
    }
}
