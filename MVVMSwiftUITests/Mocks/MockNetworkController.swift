//
//  MockNetworkController.swift
//  MVVMSwiftUITests
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 12/05/22.
//

import UIKit
@testable import MVVMSwiftUI

class MockNetworkController: NetworkControllerProtocol {
    
    var mockResponseMovies = [Movie]()
    var completeClosure: moviesListCompletion!
    var isGetMoviesCalled = false
    var isSearchMoviesCalled = false
    
    func getMovies(completion: @escaping moviesListCompletion) {
        isGetMoviesCalled = true
        completeClosure = completion
    }
    
    func searchMovies(with name: String, completion: @escaping moviesListCompletion) {
        isSearchMoviesCalled = true
    }
    
    func downloadImage(from request: ImageRequest?, completion: @escaping (UIImage) -> Void) {
        let image = UIImage()
        completion(image)
    }
    
    func closureSuccess() {
        let response = MoviesResponse(results: mockResponseMovies)
        completeClosure(.success(response))
    }
}
