//
//  GridViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 11/04/22.
//

import Foundation

final class GridViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    
    private let networkManager: NetworkManager
    
    init(networkController: NetworkControllerProtocol = URLSessionController.shared) {
        self.networkManager = NetworkManager(networkController)
    }
    
    func getMovies() {
        isLoading = true
        
        networkManager.getMovies { [weak self] result in
            self?.isLoading = false
            
            switch result {
            case .success(let movies):
                self?.movies = movies.results
            case .failure(let error):
                print(error)
                return
            }
        }
    }
    
    func searchMovies(with name: String) {
        isLoading = true
        
        networkManager.searchMovies(with: name) { [weak self] result in
            self?.isLoading = false
            
            switch result {
            case .success(let movies):
                self?.movies = movies.results
            case .failure(let error):
                print(error)
                return
            }
        }
    }
}
