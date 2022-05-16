//
//  DiscoverMoviesResource.swift
//  MVVMSwiftUI
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 18/04/22.
//

import Foundation

public struct DiscoverMoviesResource: APIResource {
    
    typealias ResponseType = MoviesResponse
    
    var methodPath: String {
        return "/3/discover/movie"
    }
}

public struct SearchMoviesResource: APIResource {
    
    typealias ResponseType = MoviesResponse
    
    let searchString: String
    
    var methodPath: String {
        return "/3/search/movie"
    }
    
    var queryItem: URLQueryItem? {
        return URLQueryItem(name: "query", value: searchString)
    }
}

struct MoviesResponse: Decodable {
    
    let results: [Movie]
}
