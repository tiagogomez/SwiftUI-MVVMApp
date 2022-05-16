//
//  NetworkRequest.swift
//  MVVMSwiftUI
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 22/04/22.
//

import Foundation

enum APIError: Error {
    
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
    case decodingError
}
