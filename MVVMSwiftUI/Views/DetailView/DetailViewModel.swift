//
//  DetailViewModel.swift
//  MVVMSwiftUI
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 27/04/22.
//

import Foundation

final class DetailViewModel: ObservableObject {
    
    @Published var movie: Movie?
    @Published var isFavorite = false
    
    private let storageManager: StorageManager
    
    init(storageController: StorageControllerProtocol = CoreDataController.shared) {
        self.storageManager = StorageManager(storageController)
    }
        
    func setMovie(movie: Movie) {
        self.movie = movie
        isFavorite = storageManager.isMovieStored(movie: movie)
    }
    
    func pressedFavoriteButton() {
        guard let movie = movie else { return }
        
        if isFavorite {
            storageManager.removeMovie(movie: movie)
            isFavorite = false
        } else {
            storageManager.storeMovie(movie: movie)
            isFavorite = true
        }
    }
}
