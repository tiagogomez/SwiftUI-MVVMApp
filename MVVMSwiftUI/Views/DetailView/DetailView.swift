//
//  DetailView.swift
//  MVVMSwiftUI
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 27/04/22.
//

import SwiftUI

struct DetailView: View {
    
    let movie: Movie
    @StateObject private var viewModel = DetailViewModel()
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                if let imageURL = viewModel.movie?.backdrop {
                    RemoteImageView(urlString: "https://image.tmdb.org/t/p/w500\(imageURL)")
                }
                Button {
                    viewModel.pressedFavoriteButton()
                } label: {
                    Image(systemName: "heart.fill")
                }
                .buttonStyle(FavoriteButton(state: viewModel.isFavorite))
                .padding(5)

            }
            ScrollView {
                VStack(alignment: .leading) {
                    let title = viewModel.movie?.title ?? "No title"
                    Text(title)
                        .font(.title)
                        .padding(5)
                    let overview = viewModel.movie?.overview ?? "No overview"
                    Text(overview)
                        .padding(5)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.setMovie(movie: movie)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: Movie(
            id: 0,
            title: "The Batman",
            overview: "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
            poster: "https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg",
            backdrop: "https://image.tmdb.org/t/p/w500/5P8SmMzSNYikXpxil6BYzJ16611.jpg"
        ))
    }
}
