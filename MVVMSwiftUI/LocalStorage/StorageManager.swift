//
//  StorageManager.swift
//  MVVMSwiftUI
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 3/05/22.
//

import SwiftUI
import CoreData

class StorageManager {
        
    private let storageController: StorageControllerProtocol
    
    init(_ storageController: StorageControllerProtocol) {
        self.storageController = storageController
    }
    
    func isMovieStored(movie: Movie) -> Bool {
        storageController.isMovieStored(movie: movie)
    }
    
    func storeMovie(movie: Movie) {
        storageController.storeMovie(movie: movie)
    }
    
    func removeMovie(movie: Movie) {
        storageController.removeMovie(movie: movie)
    }
    
    func fetchMovies() -> [Movie] {
        return storageController.fetchMovies()
    }
}
