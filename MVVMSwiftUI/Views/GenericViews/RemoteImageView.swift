//
//  RemoteImageView.swift
//  MVVMSwiftUI
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 26/04/22.
//

import SwiftUI

struct RemoteImageView: View {
    
    @StateObject private var imageLoader = ImageLoader()
        
    var urlString: String
    
    var body: some View {
        ImageView(image: imageLoader.image)
            .onAppear {
            imageLoader.load(fromURL: urlString)
        }
    }
}

struct ImageView: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable()
            .scaledToFit() ?? Image("food-placeholder")
            .resizable()
            .scaledToFit()
    }
}

final class ImageLoader: ObservableObject {
    
    @Published var image: Image?
    
    private let networkManager: NetworkManager
    var request: ImageRequest?
    
    init(networkController: NetworkControllerProtocol = URLSessionController.shared) {
        self.networkManager = NetworkManager(networkController)
    }
    
    func load(fromURL url: String) {
        request = ImageRequest(url: url)
        
        networkManager.downloadImage(from: request) { [weak self] uiImage in
            self?.image = Image(uiImage: uiImage)
        }
    }
}

struct RemoteImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        RemoteImageView(
            urlString: "https://image.tmdb.org/t/p/w500/wwemzKWzjKYJFfCeiB57q3r4Bcm.png")
    }
}
