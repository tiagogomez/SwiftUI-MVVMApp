//
//  URLSessionController.swift
//  SwiftUI-MVVM
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 11/04/22.
//

import UIKit

final class URLSessionController: NSObject, NetworkControllerProtocol {

    static let shared = URLSessionController()
    private let imageCache = NSCache<NSString, UIImage>()
    
    private var discoverMoviesRequest: APIRequest<DiscoverMoviesResource>?
    private var searchMoviesRequest: APIRequest<SearchMoviesResource>?
    
    func getMovies(completion: @escaping moviesListCompletion) {
        let resource = DiscoverMoviesResource()
        discoverMoviesRequest = APIRequest(resource: resource)
        
        discoverMoviesRequest?.execute { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
    
    func searchMovies(with name: String, completion: @escaping moviesListCompletion) {
        let resource = SearchMoviesResource(searchString: name)
        searchMoviesRequest = APIRequest(resource: resource)
        
        searchMoviesRequest?.execute { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
    
    func downloadImage(from request: ImageRequest?, completion: @escaping (UIImage) -> Void) {
//        https://api.themoviedb.org/3/configuration?api_key=3cb6e017bb4597585470454ea96dd242
        let defaultImage = UIImage()
        
        guard let request = request else {
            completion(defaultImage)
            return
        }

        let cacheKey = NSString(string: request.url)
        if let image = imageCache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        
        request.execute { result in
            switch result {
            case .success(let image):
                self.imageCache.setObject(image, forKey: cacheKey)
                DispatchQueue.main.async {
                    completion(image)
                }
            case .failure:
                DispatchQueue.main.async {
                    completion(defaultImage)
                }
            }
        }
    }
}
