//
//  NetworkControllerProtocol.swift
//  MVVMSwiftUI
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 12/05/22.
//

import UIKit

typealias moviesListCompletion = (Result<MoviesResponse, APIError>) -> Void

protocol NetworkControllerProtocol {
    
    func getMovies(completion: @escaping moviesListCompletion)
    func searchMovies(with name: String, completion: @escaping moviesListCompletion)
    func downloadImage(from request: ImageRequest?, completion: @escaping (UIImage) -> Void)
}
