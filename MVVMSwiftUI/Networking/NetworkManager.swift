//
//  NetworkManager.swift
//  MVVMSwiftUI
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 12/05/22.
//

import UIKit

class NetworkManager {
    
    private let networkController: NetworkControllerProtocol
    
    init(_ networkController: NetworkControllerProtocol) {
        self.networkController = networkController
    }
    
    func getMovies(completion: @escaping moviesListCompletion) {
        networkController.getMovies(completion: completion)
    }
    
    func searchMovies(with name: String, completion: @escaping moviesListCompletion) {
        networkController.searchMovies(with: name, completion: completion)
    }
    
    func downloadImage(from request: ImageRequest?, completion: @escaping (UIImage) -> Void) {
        networkController.downloadImage(from: request, completion: completion)
    }
    
}
