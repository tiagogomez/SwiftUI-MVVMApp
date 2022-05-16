//
//  StorageControllerProtocol.swift
//  MVVMSwiftUI
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 5/05/22.
//

import Foundation

protocol StorageControllerProtocol {
    
    func isMovieStored(movie: Movie) -> Bool
    func storeMovie(movie: Movie)
    func removeMovie(movie: Movie)
    func fetchMovies() -> [Movie]
}
