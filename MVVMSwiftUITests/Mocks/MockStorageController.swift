//
//  MockStorageController.swift
//  MVVMSwiftUITests
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 11/05/22.
//

import Foundation
@testable import MVVMSwiftUI

class MockStorageController: StorageControllerProtocol {
    
    var mockStoredMovies = [Movie]()
    
    func isMovieStored(movie: Movie) -> Bool {
        if mockStoredMovies.contains(movie) {
            return true
        } else {
            return false
        }
    }
    
    func storeMovie(movie: Movie) {
        mockStoredMovies.append(movie)
    }
    
    func removeMovie(movie: Movie) {
        if let index = mockStoredMovies.firstIndex(of: movie) {
            mockStoredMovies.remove(at: index)
        }
    }
    
    func fetchMovies() -> [Movie] {
        return mockStoredMovies
    }
}
