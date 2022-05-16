//
//  ListView.swift
//  MVVMSwiftUI
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 12/04/22.
//

import SwiftUI

struct ListView: View {
    
    @StateObject private var viewModel = GridViewModel()
    @State private var searchText = String()
        
    var body: some View {
        NavigationView {
            ZStack {
                List(viewModel.movies) { movie in
                    NavigationLink(destination: DetailView(movie: movie)) {
                        Text(movie.title ?? "Empty movie")
                    }
                }
                .onAppear {
                    viewModel.getMovies()
//                    viewModel.searchMovies(with: $0)
                }
                
                if viewModel.isLoading { LoadingView() }
            }
            .searchable(text: $searchText, prompt: "Search a Movie")
            .onChange(of: searchText) {
                viewModel.searchMovies(with: $0)
            }
            .navigationTitle("Movies List")
        }
        .navigationViewStyle(.stack)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
