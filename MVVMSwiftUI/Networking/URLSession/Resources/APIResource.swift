//
//  APIResource.swift
//  MVVMSwiftUI
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 18/04/22.
//

import Foundation

protocol APIResource {
    
    associatedtype ResponseType: Decodable
    
    var methodPath: String { get }
    var queryItem: URLQueryItem? { get }
}

extension APIResource {
        
    var url: URL? {
        var components = URLComponents(string: "https://api.themoviedb.org")
        components?.path = methodPath
        let apiKey = URLQueryItem(name: "api_key", value: "3cb6e017bb4597585470454ea96dd242")
        let language = URLQueryItem(name: "language", value: "en-US")
        components?.queryItems = [apiKey, language]
        if let item = queryItem {
            components?.queryItems?.append(item)
        }

        return components?.url
    }
    
    var queryItem: URLQueryItem? { return nil }
}
