//
//  GridView.swift
//  MVVMSwiftUI
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 25/04/22.
//

import SwiftUI

struct GridView: View {
    
    @StateObject private var viewModel = GridViewModel()
    
    private var columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
        
    var body: some View {
        ZStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.movies) { movie in
                        GridViewCard(movie: movie)
                    }
                }
                .padding()
            }
            .onAppear {
                viewModel.getMovies()
            }
            
            if viewModel.isLoading { LoadingView() }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
