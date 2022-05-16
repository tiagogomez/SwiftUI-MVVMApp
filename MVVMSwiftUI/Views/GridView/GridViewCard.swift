//
//  GridViewCard.swift
//  MVVMSwiftUI
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 26/04/22.
//

import SwiftUI

struct GridViewCard: View {
    
    let movie: Movie
        
    var body: some View {
        ZStack(alignment: .topTrailing) {
            if let urlPoster = movie.poster {
                RemoteImageView(
                    urlString: "https://image.tmdb.org/t/p/w500\(urlPoster)"
                )
            }
            if let id = movie.id {
                Spacer()
                Text(String(id))
                    .font(.caption)
                    .padding(5)
                    .foregroundColor(.white)
            }
        }
    }
}

struct GridViewCard_Previews: PreviewProvider {
    static var previews: some View {
        GridViewCard(movie: Movie(
            id: 0,
            title: "test",
            overview: "test",
            poster: "https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg",
            backdrop: "https://image.tmdb.org/t/p/w500/5P8SmMzSNYikXpxil6BYzJ16611.jpg"
        ))
    }
}
