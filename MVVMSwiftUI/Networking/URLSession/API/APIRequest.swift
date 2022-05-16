//
//  NetworkRequest.swift
//  MVVMSwiftUI
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 22/04/22.
//

import Foundation
import UIKit

protocol NetworkRequest: AnyObject {
    
    associatedtype ResponseType
    
    func execute(completion: @escaping (Result<ResponseType, APIError>) -> Void)
    func decode(_ data: Data) throws -> ResponseType
}

extension NetworkRequest {
    
    fileprivate func load(url: URL, completion: @escaping (Result<ResponseType, APIError>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let self = self else { return }
            
            if let _ =  error {
                completion(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let decodedResponse = try self.decode(data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }
}

class APIRequest<Resource: APIResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}
 
extension APIRequest: NetworkRequest {
    
    func execute(completion: @escaping (Result<Resource.ResponseType, APIError>) -> Void) {
        guard let url = resource.url else {
            completion(.failure(.invalidURL))
            return
        }
        load(url: url, completion: completion)
    }
    
    func decode(_ data: Data) throws -> Resource.ResponseType {
        let decoder = JSONDecoder()
        let response = try decoder.decode(Resource.ResponseType.self, from: data)
        return response
    }
}

class ImageRequest {
    let url: String
    
    init(url: String) {
        self.url = url
    }
}
 
extension ImageRequest: NetworkRequest {
    
    func execute(completion: @escaping (Result<UIImage, APIError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        load(url: url, completion: completion)
    }
    
    func decode(_ data: Data) -> UIImage {
        return UIImage(data: data) ?? UIImage()
    }
}
