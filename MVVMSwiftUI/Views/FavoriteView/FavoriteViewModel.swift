//
//  FavoriteViewModel.swift
//  MVVMSwiftUI
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 10/05/22.
//

import Foundation

final class FavoriteViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    
    private let storageManager: StorageManager
    
    init(storageController: StorageControllerProtocol = CoreDataController.shared) {
        self.storageManager = StorageManager(storageController)
    }
    
    func getMovies() {
        movies = storageManager.fetchMovies()
    }
}
